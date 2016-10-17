select a.owner
 ,a.name mv_group
 ,b.name mv_name
from dba_rgroup a
    ,dba_rchild b
where a.refgroup = b.refgroup
and   a.owner    = b.owner
order by a.owner, a.name, b.name;

