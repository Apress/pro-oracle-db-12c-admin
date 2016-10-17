set lines 80 
col blkg_user form a10 
col blkg_machine form a10 
col blkg_sid form 99999999 
col wait_user form a10 
col wait_machine form a10 
col wait_sid form 9999999 
col obj_own form a10 
col obj_name form a10 
col blkg_sql form a50 
col wait_sql form a50 
-- 
select 
 s1.username    blkg_user, s1.machine     blkg_machine 
,s1.sid         blkg_sid, s1.serial#     blkg_serialnum 
,s1.process     blkg_OS_PID 
,substr(b1.sql_text,1,50) blkg_sql 
,chr(10) 
,s2.username    wait_user, s2.machine     wait_machine 
,s2.sid         wait_sid, s2.serial#     wait_serialnum 
,s2.process     wait_OS_PID 
,substr(w1.sql_text,1,50) wait_sql 
,lo.object_id   blkd_obj_id 
,do.owner       obj_own, do.object_name obj_name 
from v$lock          l1 
    ,v$session       s1 
    ,v$lock          l2 
    ,v$session       s2 
    ,v$locked_object lo 
    ,v$sqlarea       b1 
    ,v$sqlarea       w1 
    ,dba_objects     do 
where s1.sid = l1.sid 
and s2.sid = l2.sid 
and l1.id1 = l2.id1 
and s1.sid = lo.session_id 
and lo.object_id = do.object_id 
and l1.block = 1
and s1.prev_sql_addr = b1.address 
and s2.sql_address = w1.address 
and l2.request > 0;
