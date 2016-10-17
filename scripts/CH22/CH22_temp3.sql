SELECT s.sid, s.serial#, s.username 
,p.spid, s.module, p.program 
,SUM(su.blocks) * tbsp.block_size/1024/1024 mb_used 
,su.tablespace 
FROM v$sort_usage    su 
    ,v$session       s 
    ,dba_tablespaces tbsp 
    ,v$process       p 
WHERE su.session_addr = s.saddr 
AND   su.tablespace   = tbsp.tablespace_name 
AND   s.paddr         = p.addr 
GROUP BY 
 s.sid, s.serial#, s.username, s.osuser, p.spid, s.module, 
 p.program, tbsp.block_size, su.tablespace 
ORDER BY s.sid;
