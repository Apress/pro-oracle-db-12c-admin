create table inv(
 inv_id number generated as identity
,inv_desc varchar2(30 char));
--
alter table inv add constraint inv_pk primary key (inv_id);

