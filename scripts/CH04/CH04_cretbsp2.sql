create tablespace tools
  datafile '/u01/dbfile/o12c/tools01.dbf'
  size 100m
  autoextend on maxsize 1000m
  extent management local
  uniform size 128k
  segment space management auto;

