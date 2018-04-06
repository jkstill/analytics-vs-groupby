
@@flush

select count(*) from (
	select distinct
		region_id
		, dept_id
		, product_id
		, emp_id
		, sum(qty) over (partition by region_id, dept_id, product_id, emp_id) qty_sold
	from af_test
	order by 5
)

l

/

