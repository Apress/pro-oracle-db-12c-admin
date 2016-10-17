create or replace trigger emp_dept_v_updt
instead of update on emp_dept_v
for each row
begin
  update emp set emp_name=UPPER(:new.emp_name)
  where emp_id=:old.emp_id;
end;
/

