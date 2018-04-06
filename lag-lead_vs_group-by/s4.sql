

-- s2.sql
-- show lead() and lag() implemented manually
-- different method


prompt
prompt lead() and lag() via 2 outer joins
prompt

with data as (
	select tmain.id
		, (select id from t1 where id = tmain.id -1 ) previous_id
	from t1 tmain
	left outer join t1 aux on aux.id = tmain.id - 1
	left outer join t1 aux on aux.id = tmain.id + 1
)
select min(id), max(previous_id)  from data

l

/


