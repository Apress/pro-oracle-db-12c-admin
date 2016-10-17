create table exa_info(
  exa_id        NUMBER 
 ,machine_count NUMBER
 ,hide_flag     NUMBER
 ,oracle        NUMBER
 ,ship_date     DATE
 ,rack_type     VARCHAR2(32)
) nologging parallel 2;

