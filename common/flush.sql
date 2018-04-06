
prompt Flushing Shared Spool and Buffer Cache
prompt 
set term off feed off
alter system flush shared_pool;
alter system flush buffer_cache;
set term on feed on

