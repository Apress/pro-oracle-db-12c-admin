create table exadata_et(
  exa_id        NUMBER
 ,machine_count NUMBER
 ,hide_flag     NUMBER
 ,oracle        NUMBER
 ,ship_date     DATE
 ,rack_type     VARCHAR2(32)
)
organization external (
  type              oracle_loader
  default directory exa_dir
  access parameters
  (
    records delimited  by newline
    fields  terminated by '|'
    missing field values are null
    (exa_id
    ,machine_count
    ,hide_flag
    ,oracle
    ,ship_date char date_format date mask "mm/dd/yyyy"
    ,rack_type)
   )
  location ('ex.csv')
)
reject limit unlimited;

