create table inv_backup
nologging
tablespace hr_data
parallel 2
as select * from inv;

