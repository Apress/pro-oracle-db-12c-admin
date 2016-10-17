create table f_sales (
 sales_id number
,sales_amt number
,d_date_id number)
tablespace p1_tbsp
partition by range(d_date_id)(
 partition y12 values less than (20130101)
   tablespace p1_tbsp
,partition y13 values less than (20140101)
    tablespace p2_tbsp);
--
insert into f_sales values(1,20,20120322);
insert into f_sales values(2,33,20120507);
insert into f_sales values(3,72,20120101);
insert into f_sales values(4,12,20130322);
insert into f_sales values(5,98,20130507);

