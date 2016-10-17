select segment_name, segment_type, segment_subtype, bytes/1024/1024 meg_bytes
from user_segments
where segment_name IN ('&&table_just_created',
                       '&&lob_segment_just_created',
                       '&&lob_index_just_created');

