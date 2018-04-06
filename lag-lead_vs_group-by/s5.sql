
-- s2.sql
-- show lead() analytic function


prompt
prompt lead() and lag() analytic functions
prompt


with data as (
	select tmain.id
		, lag(tmain.id) over ( order by id ) previous_id
		, lead(tmain.id) over ( order by id ) next_id
	from t1 tmain
)
select min(id), max(previous_id)  from data

l

/


