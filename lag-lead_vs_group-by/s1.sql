

-- s1.sql
-- show lead() implemented manually

prompt
prompt lead() via scalar subquery
prompt

with data as (
	select tmain.id
		, (select id from t1 where id = tmain.id -1 ) previous_id
	from t1 tmain
)
select min(id), max(previous_id)  from data

l

/


