create table inv
(inv_id     number,
 inv_desc   varchar2(30 char),
 create_dtt date default sysdate)
parallel 2;

