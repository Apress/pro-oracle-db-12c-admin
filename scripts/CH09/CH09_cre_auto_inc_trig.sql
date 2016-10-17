create or replace trigger inv_bu_tr
before insert on inv
for each row
begin
  select inv_seq.nextval into :new.inv_id from dual;
end;
/

