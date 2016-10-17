CREATE TABLE patchmain(
 patch_id   NUMBER
,patch_desc CLOB)
LOB(patch_desc) STORE AS SECUREFILE
(COMPRESS LOW)
TABLESPACE lob_data;

