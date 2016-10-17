CREATE TABLE patchmain(
 patch_id number
,patch_desc clob)
LOB(patch_desc) STORE AS SECUREFILE (encrypt)
tablespace lob_data;

