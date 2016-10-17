select s.sid, s.serial#, s.username, s.program 
,r.name undo_name, rs.status 
,rs.rssize/1024/1024 redo_size_mb 
,rs.extents 
from v$session     s 
    ,v$transaction t 
    ,v$rollname    r 
    ,v$rollstat    rs 
where s.taddr = t.addr 
and t.xidusn  = r.usn 
and r.usn     = rs.usn;
