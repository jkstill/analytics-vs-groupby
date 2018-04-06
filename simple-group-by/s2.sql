

prompt
prompt count of Sales - count() Analytic Function
prompt

select count(*)
from (
	select distinct prod_id
		, max(channel_id) over (partition by prod_id) channel_id
		, count(*) over (partition by prod_id, channel_id) prod_count
	from sh.sales
)

l

/

