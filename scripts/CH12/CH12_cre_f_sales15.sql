create table f_sales (
 sales_id number
,sales_amt number
,d_date_id number
)
indexing off
partition by range (d_date_id)
(partition p1 values less than (20110101)  indexing on,
 partition p2 values less than (20120101)  indexing on,
 partition p3 values less than (20130101)  indexing on,
 partition p4 values less than (20140101)  indexing off);

