
-- oracle is optimizing this query as the subscalar query is not causing another scan


prompt
prompt count of Sales with prod_count_total - simple Group By with Scalar Subquery
prompt


select count(*) from  (
select  s.prod_id
	, s.channel_id
	, count(*) prod_count_per_channel
	, (select /*+ no_push_pred no_merge */ count(*)  from sh.sales where prod_id = s.prod_id) prod_count_total
from sh.sales s
group by s.prod_id, s.channel_id
order by prod_id, channel_id
)

l

/
