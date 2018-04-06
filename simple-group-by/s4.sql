

prompt
prompt count of Sales with prod_count_total - via count() Analytic Function
prompt


select count(*) from  (
select  distinct
	s.prod_id
	, s.channel_id
	, count(*) over (partition by s.prod_id, s.channel_id) prod_count_per_channel
	, count(*) over (partition by s.prod_id) prod_count_total
from sh.sales s
--group by s.prod_id, s.channel_id
order by prod_id, channel_id
)

l

/
