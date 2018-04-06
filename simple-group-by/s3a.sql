


prompt
prompt count of Sales with prod_count_total - via Group By and join
prompt


select count(*) from  (
select  s.prod_id
	, s.channel_id
	, count(*) prod_count_per_channel
	, t.prod_count_total
from 
(
	select prod_id
		, count(*) prod_count_total
	from sh.sales
	group by prod_id
) t
join sh.sales s on t.prod_id = s.prod_id
group by s.prod_id, s.channel_id, t.prod_count_total
order by prod_id, channel_id
)

l

/
