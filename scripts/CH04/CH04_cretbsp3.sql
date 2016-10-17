define tbsp_large=5G
define tbsp_med=500M
--
create tablespace reg_data
  datafile '/u01/dbfile/o12c/reg_data01.dbf'
  size &&tbsp_large
  extent management local
  uniform size 128k
  segment space management auto;
--
create tablespace reg_index
  datafile '/u01/dbfile/o12c/reg_index01.dbf'
  size &&tbsp_med
  extent management local
  uniform size 128k
  segment space management auto;

