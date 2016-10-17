select tablespace_name
,sum(bytes_used)/1024/1024 mb_used
from v$temp_extent_pool
group by tablespace_name;
