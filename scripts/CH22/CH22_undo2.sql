select
  sum(bytes)/1024/1024                  cur_mb_size
 ,dbms_undo_adv.required_undo_size(900) req_mb_size
from dba_data_files
where tablespace_name =
  (select
    value
   from v$parameter
   where name = 'undo tablespace');
