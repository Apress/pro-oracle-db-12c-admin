create tablespace inv_idx_small
  datafile '/u01/dbfile/O12C/inv_idx_small01.dbf' size 100m
  extent management local
  uniform size 128k
  segment space management auto;
--
create tablespace inv_idx_med
  datafile '/u01/dbfile/O12C/inv_idx_med01.dbf' size 1000m
  extent management local
  uniform size 4m
  segment space management auto;

