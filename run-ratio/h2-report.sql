

prompt
prompt report generated vi Advanged Group By
prompt

-- h2.sql 

set linesize 200 trimspool on
set pagesize 50000

spool h2-report.log

with data as (
	select distinct
		region_id
		, dept_id
		, product_id
		, emp_id
		, sum(qty) qty_sold
	from af_test
	group by grouping sets(
		rollup(
			region_id
			, dept_id
			, product_id
			, emp_id
		), 
		rollup (
			region_id
			, product_id
		)
	)
	having group_id() < 1
),
prod_totals as (
	select distinct
		region_id
		, product_id
		, qty_sold
	from data
	where emp_id is null
		and dept_id is null
		and product_id is not null
),
emp_totals as (
	select
		region_id
		, dept_id
		, product_id
		, emp_id
		, qty_sold
	from data
	where emp_id is  not null
		and product_id is not null
)
select * from (
select
	e.region_id
	, e.dept_id
	, e.product_id
	, e.emp_id
	, e.qty_sold emp_qty_sold
	, p.qty_sold as region_prod_total
	, e.qty_sold / p.qty_sold as ratio2rpt
from emp_totals e
join prod_totals p on p.region_id = e.region_id
	and p.product_id = e.product_id
--order by 1,2,3,4,5,6
order by 7,4,2
)
/

spool off




