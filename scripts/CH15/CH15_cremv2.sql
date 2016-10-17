create materialized view sales_rep_mv
segment creation immediate
refresh
  with primary key
  fast
  on demand
as
select
 sales_id
,sales_amt
,trunc(sales_dtt) sales_dtt
from sales;
