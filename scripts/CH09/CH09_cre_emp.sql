create table emp(
 emp_id number primary key
,emp_name varchar2(15)
,dept_id number);
--
create table dept(
 dept_id number primary key
,dept_name varchar2(15),
 constraint emp_dept_fk
 foreign key(dept_id) references dept(dept_id));
--
insert into dept values(1,'HR');
insert into dept values(2,'IT');
insert into dept values(3,'SALES');
insert into emp values(10,'John',2);
insert into emp values(20,'Bob',1);
insert into emp values(30,'Craig',2);
insert into emp values(40,'Joe',3);
insert into emp values(50,'Jane',1);
insert into emp values(60,'Mark',2);
--
create or replace view emp_dept_v
as
select a.emp_id, a.emp_name, b.dept_name, b.dept_id
from emp a, dept b
where a.dept_id = b.dept_id;


