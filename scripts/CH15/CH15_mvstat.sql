select a.log_table, a.log_owner
,b.master mast_tab
,c.owner  mv_owner
,c.name   mview_name
,c.mview_site, c.mview_id
from dba_mview_logs a
    ,dba_base_table_mviews b
    ,dba_registered_mviews c
where b.mview_id = c.mview_id
and   b.owner    = a.log_owner
and   b.master   = a.master
order by a.log_table;

