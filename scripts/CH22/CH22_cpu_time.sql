select * from(
select s.sid, s.username, s.sql_id
,sa.elapsed_time/1000000, sa.cpu_time/1000000
,sa.buffer_gets, sa.sql_text
from v$sqlarea sa
    ,v$session s
where s.sql_hash_value = sa.hash_value
and   s.sql_address    = sa.address
and   s.username is not null
order by sa.cpu_time desc)
where rownum <= 10;
