set lines 132
col table_name form a10
col partition_name form a9
col part_pos form 999
col interval form a10
col tablespace_name form a12
col high_value form a30
--
select table_name, partition_name, partition_position part_pos
       ,interval, tablespace_name, high_value
from user_tab_partitions
where table_name = 'F_SALES'
order by table_name, partition_position;

