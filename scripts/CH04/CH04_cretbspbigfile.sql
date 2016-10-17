create bigfile tablespace inv_big_data
  datafile '/u01/dbfile/o12c/inv_big_data01.dbf'
  size 10g
  extent management local
  uniform size 128k
  segment space management auto;

