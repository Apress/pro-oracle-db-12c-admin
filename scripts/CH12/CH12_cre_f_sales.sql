create table f_sales
(sales_amt number
,d_date_id number)
partition by range (d_date_id)(
partition p_2012 values less than (20130101),
partition p_2013 values less than (20140101),
partition p_max  values less than (maxvalue));

