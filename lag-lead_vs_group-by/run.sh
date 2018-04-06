#!/bin/bash

unset SQLPATH

> run.log

for script in s1 s2 s3 s4 s5
do

sqlplus /nolog <<-EOF | tee -a run.log

@@reconnect
@@prep
@@banner ${script}.sql
@@tid-pre ${script^^*}
@@10046
@@${script}.sql
@@10046_off
@@get-prev-sqlid
@@showplan
@@tid-post


EOF

done

