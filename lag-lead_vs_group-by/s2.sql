

-- s2.sql
-- show lead() and lag()  implemented manually

prompt
prompt lead() and lag() via scalar subquery
prompt

with data as (
	select tmain.id
		, (select id from t1 where id = tmain.id -1 ) previous_id
		,(select id from t1 where id = tmain.id +1 ) next_id
	from t1 tmain
)
select min(id), max(previous_id)  from data

l

/


