

set linesize 250 trimspool on
col plan_table_output format a250

select *
from table(dbms_xplan.display_cursor( '&v_sql_id', &v_child_num ,'LAST ALL ALLSTATS'))
/


