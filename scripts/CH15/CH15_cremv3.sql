create materialized view sales_mv
tablespace users
using index tablespace users
refresh with primary key
  fast on demand
as
select sales_id ,sales_amt, sales_dtt
from sales;

