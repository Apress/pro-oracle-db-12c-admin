select * from (
select owner, segment_name, segment_type, partition_name
,sum(bytes)/1024/1024 meg_tot
from dba_segments
group by owner, segment_name, segment_type, partition_name
order by sum(extents) desc)
where rownum <= 10;

