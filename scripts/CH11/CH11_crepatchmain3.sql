create table patchmain
(patch_id   number
,patch_desc clob
,patch      blob
) tablespace users
 lob (patch_desc) store as (tablespace lob_data)
,lob (patch)      store as (tablespace lob_data);
The following query verifies the associated tablespaces for this table:
select table_name, tablespace_name, 'N/A' column_name
from user_tables
where table_name='PATCHMAIN'
union
select table_name, tablespace_name, column_name
from user_lobs
where table_name='PATCHMAIN';

