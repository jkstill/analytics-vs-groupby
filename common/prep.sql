

set tab off verify off
set serveroutput off

@@flush

set term off feed off
alter session set statistics_level= 'ALL';
set term on feed on

set timing on
set linesize 200 trimspool on
set pagesize 100
