create tablespace inv_mgmt_data
  datafile '/u01/dbfile/o12c/inv_mgmt_data01.dbf' size 100m
  extent management local
  uniform size 128k
  segment space management auto
  nologging;

