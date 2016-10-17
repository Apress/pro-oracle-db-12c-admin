create table patchmain(
 patch_id   number
,patch_desc clob)
lob(patch_desc) store as securefile (tablespace lob_data);

