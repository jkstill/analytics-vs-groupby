

-- s2.sql
-- show lead() implemented manually
-- different method

prompt
prompt lead() via outer join
prompt

with data as (
	select tmain.id
		, (select id from t1 where id = tmain.id -1 ) previous_id
	from t1 tmain
	left outer join t1 aux on aux.id = tmain.id - 1
)
select min(id), max(previous_id)  from data

l

/


