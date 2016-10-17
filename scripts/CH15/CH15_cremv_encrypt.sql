create materialized view sales_mv
(sales_id   encrypt no salt
,sales_amt  encrypt)
as
select
 sales_id
,sales_amt
from sales;

