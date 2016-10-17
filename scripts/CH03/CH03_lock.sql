SET LINES 83 PAGES 30
COL blkg_user    FORM a10
COL blkg_machine FORM a10
COL blkg_sid     FORM 99999999
COL wait_user    FORM a10
COL wait_machine FORM a10
COL wait_sid     FORM 9999999
COL obj_own      FORM a10
COL obj_name     FORM a10
--
SELECT
 s1.username    blkg_user
,s1.machine     blkg_machine
,s1.sid         blkg_sid
,s1.serial#     blkg_serialnum
,s1.sid || ',' || s1.serial# kill_string
,s2.username    wait_user
,s2.machine     wait_machine
,s2.sid         wait_sid
,s2.serial#     wait_serialnum
,lo.object_id   blkd_obj_id
,do.owner       obj_own
,do.object_name obj_name
FROM v$lock l1
    ,v$session s1
    ,v$lock l2
    ,v$session s2
    ,v$locked_object lo
    ,dba_objects do
WHERE s1.sid = l1.sid
AND   s2.sid = l2.sid
AND   l1.id1 = l2.id1
AND   s1.sid = lo.session_id
AND   lo.object_id = do.object_id
AND   l1.block = 1
AND   l2.request > 0;

