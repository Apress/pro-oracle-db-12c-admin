select * from (
select a.sid session_id, a.sql_id, a.status
,a.cpu_time/1000000 cpu_sec
,a.buffer_gets, a.disk_reads
,substr(b.sql_text,1,35) sql_text
from v$sql_monitor a
    ,v$sql b
where a.sql_id = b.sql_id
and   a.status='EXECUTING'
order by a.disk_reads desc)
where rownum <=20;
