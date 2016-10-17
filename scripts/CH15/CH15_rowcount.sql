set head off pages 0 lines 132 trimspool on
spo mvcount_dyn.sql
select 'select count(*) || ' || '''' || ': ' || table_name || ''''
|| ' from ' || table_name || ';'
from user_tables
where table_name like 'MLOG%';
spo off;

