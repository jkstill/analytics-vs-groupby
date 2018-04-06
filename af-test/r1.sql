
@@flush

select count(*) from (
	select 
		region_id
		, dept_id
		, product_id
		, emp_id
		, sum(qty) qty_sold
	from af_test
	group by 
		region_id
		, dept_id
		, product_id
		, emp_id
	order by sum(qty)
)

l

/

