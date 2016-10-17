create table f_sales (
 sales_id  number
,sales_amt number
,d_date_id number)
tablespace p1_tbsp
partition by range(d_date_id)(
 partition y10 values less than (20110101)
   tablespace p1_tbsp
,partition y11 values less than (20120101)
   tablespace p2_tbsp
,partition y12 values less than (20130101)
   tablespace p3_tbsp);

