select 
	nvl((to_number(partition_stop) - to_number(partition_start))+1,1) pcount
from v$sql_plan_statistics_all
/
