value range of 01-01-2013:
create table f_sales(
 sales_amt  number
,d_date_dtt date)
partition by range (d_date_dtt)
interval(numtoyminterval(1, 'YEAR'))
store in (p1_tbsp, p2_tbsp, p3_tbsp)
(partition p1 values less than (to_date('01-01-2013','dd-mm-yyyy'))
tablespace p1_tbsp);

