create table sales(
 sales_id number primary key
,amnt    number
,state   varchar2(2)
,sales_person_id number);
--
insert into sales values(1, 222, 'CO', 8773);
insert into sales values(20, 827, 'FL', 9222);
--
create or replace view sales_rockies as
select sales_id, amnt, state
from sales
where state in ('CO','UT','WY','ID','AZ');

