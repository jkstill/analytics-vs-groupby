
spool run.log

@@banner s1.sql
@@prep
@@s1.sql
@get-prev-sqlid
@@showplan
@tcf2

@@banner s2.sql
@@prep
@@s2.sql
@get-prev-sqlid
@@showplan
@tcf2

@@banner s3.sql
@@prep
@@s3.sql
@get-prev-sqlid
@@showplan
@tcf2

@@banner s3a.sql
@@prep
@@s3a.sql
@get-prev-sqlid
@@showplan
@tcf2

@@banner s4.sql
@@prep
@@s4.sql
@get-prev-sqlid
@@showplan
@tcf2


spool off




