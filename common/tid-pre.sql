
-- tracefile_identifier_demo.sql

-- column variables to capture host, owner and tracefile name
col tracehost new_value tracehost noprint
col traceowner new_value traceowner noprint
col tracefile new_value tracefile noprint

col u_tracefile_id new_value u_tracefile_id noprint

prompt
prompt Tracefile ID:
prompt

set term off head off feed off

-- 
select '&1' u_tracefile_id from dual;

-- get oracle owner
select username traceowner from v$process where pname = 'PMON';

-- get host name
select host_name tracehost from v$instance;

-- set tracefile identifier
alter session set tracefile_identifier = '&u_tracefile_id';

select value tracefile from v$diag_info where name = 'Default Trace File';

set term on head on feed on



