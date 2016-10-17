create table orders(
 order_id    number
,order_date  date
,constraint order_pk primary key(order_id))
partition by range(order_date)
interval(numtoyminterval(1, 'YEAR'))
(partition p1 values less than (to_date('01-01-2013','dd-mm-yyyy')));
--
create table order_items(
 line_id  number
,order_id number not null
,sku      number
,quantity number
,constraint order_items_pk  primary key(line_id, order_id)
,constraint order_items_fk1 foreign key (order_id) references orders)
partition by reference (order_items_fk1);

