

set term off
set autotrace off
set serveroutput off
col plan_table_output format a200
set term on

spool run-af_tst.log

@@prep
@@banner r1.sql
@@r1.sql
@@showplan
@@banner ===

@@prep
@@banner r2.sql
@@r2.sql
@@showplan
@@banner ===

spool off




