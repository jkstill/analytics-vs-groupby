
-- tcf2.sql
-- from http://datavirtualizer.com/power-of-display_cursor/
-- see jared still comments as to why this script does not work with partitions
--

col cn format 99
col ratio format 99
col ratio1 format A6
set linesize 140
break on sql_id on cn
col lio_rw format 999
col "operation" format a60
col a_rows for 999,999,999
col e_rows for 999,999,999
--col elapsed for 999,999,999
col elapsed for 999,999,990.099999
col tcf_graph format a12
col partition_start format a8 head 'PSTART'
col partition_stop format a8 head 'PSTOP'

set linesize 200
set pagesize 100

break on report
compute sum of elapsed on report

select
		id,
       case when stime - nvl(ptime ,0) > 0 then
          (stime - nvl(ptime ,0)) / 1e6
        else 0 end as elapsed,
		 starts,
		 partition_start,
		 partition_stop,
       cardinality e_rows,
	a_rows,
		operation
from (
  SELECT
      stats.LAST_ELAPSED_TIME                             stime,
      p.elapsed                                  ptime,
      stats.sql_id                                        sql_id
    --, stats.HASH_VALUE                                    hv
    , stats.CHILD_NUMBER                                  childn
    , to_char(stats.id,'990')
      ||decode(stats.access_predicates,null,null,'A')
      ||decode(stats.filter_predicates,null,null,'F')     id
    , stats.CARDINALITY                                    cardinality
    , LPAD(' ',depth)||stats.OPERATION||' '||
      stats.OPTIONS||' '||
      stats.OBJECT_NAME||
      DECODE(stats.PARTITION_START,NULL,' ',':')||
      TRANSLATE(stats.PARTITION_START,'(NRUMBE','(NR')||
      DECODE(stats.PARTITION_STOP,NULL,' ','-')||
      TRANSLATE(stats.PARTITION_STOP,'(NRUMBE','(NR')      operation,
      stats.last_starts                                     starts,
      stats.last_output_rows                                a_rows,
		stats.partition_start,
		stats.partition_stop
  FROM
       v$sql_plan_statistics_all stats
       , (select sum(last_cu_buffer_gets + last_cr_buffer_gets) lio,
                 sum(LAST_ELAPSED_TIME) elapsed,
                 child_number,
                 parent_id,
                 sql_id
         from v$sql_plan_statistics_all
			where sql_id = '&v_sql_id'
				and child_number = '&v_child_num'
         group by child_number,sql_id, parent_id) p
  WHERE
    stats.sql_id='&v_sql_id'  and
    p.sql_id(+) = stats.sql_id and
    p.child_number(+) = stats.child_number and
    p.parent_id(+)=stats.id
)
order by sql_id, childn , id
/

clear break


