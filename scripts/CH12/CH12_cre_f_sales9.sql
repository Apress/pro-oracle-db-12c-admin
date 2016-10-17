create table f_sales(
  sales_amt  number
 ,state_code varchar2(3)
 ,d_date_id  number)
partition by range(d_date_id)
subpartition by list(state_code)
(partition p2011 values less than (20120101)
  (subpartition p1_north values ('ID','OR')
  ,subpartition p1_south values ('AZ','NM')),
 partition p2012 values less than (20130101)
  (subpartition p2_north values ('ID','OR')
  ,subpartition p2_south values ('AZ','NM')));

