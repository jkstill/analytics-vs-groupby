#!/bin/bash

unset SQLPATH

> run-ratio.log

for script in h1 h2
do

sqlplus /nolog <<-EOF | tee -a run-ratio.log

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

