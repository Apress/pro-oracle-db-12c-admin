create table patchmain(
 patch_id   number
,patch_desc clob)
tablespace users
lob(patch_desc) store as basicfile;

