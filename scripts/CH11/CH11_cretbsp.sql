create tablespace lob_data
  datafile '/u01/dbfile/o12c/lob_data01.dbf'
  size 1000m
  extent management local
  uniform size 1m
  segment space management auto;

