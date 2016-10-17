create table f_sales
(sales_amt  number
,d_date_dtt date
)
partition by range (d_date_dtt)(
 partition p_2011 values less than (to_date('01-01-2012','dd-mm-yyyy')),
 partition p_2012 values less than (to_date('01-01-2013','dd-mm-yyyy')),
 partition p_max  values less than (maxvalue));

