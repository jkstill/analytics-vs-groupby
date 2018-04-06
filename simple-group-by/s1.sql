
prompt
prompt count of Sales - simple Group By
prompt


select count(*) from (
	select prod_id,channel_id,  count(*) prod_count
	from sh.sales
	group by prod_id, channel_id
)

l

/
