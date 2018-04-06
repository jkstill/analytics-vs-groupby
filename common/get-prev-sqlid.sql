
col v_sql_id new_value v_sql_id noprint
col v_child_num new_value v_child_num noprint

select prev_sql_id v_sql_id, prev_child_number v_child_num from v$session where sid = sys_context('userenv','sid') 
/

