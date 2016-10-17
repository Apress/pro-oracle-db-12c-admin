create table f_sales(
 sales_amt number
,d_date_id number)
partition by range (d_date_id)
interval(1)
(partition p1 values less than (20120101));

