create table f_sales
 (sales_amt  number
 ,d_date_id  number
 ,state_code varchar2(3))
partition by list (state_code)
 ( partition reg_west values ('AZ','CA','CO','MT','OR','ID','UT','NV')
  ,partition reg_mid  values ('IA','KS','MI','MN','MO','NE','OH','ND')
  ,partition reg_def  values (default));

