create materialized view sales_daily_mv
segment creation immediate
refresh
complete
on demand
as
select
 sum(sales_amt) sales_amt
,trunc(sales_dtt) sales_dtt
from sales
group by trunc(sales_dtt);

