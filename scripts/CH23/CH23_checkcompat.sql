SET SERVEROUTPUT ON
DECLARE
hold_var boolean;
begin
hold_var := DBMS_PDB.CHECK_PLUG_COMPATIBILITY(pdb_descr_file=>'/orahome/oracle/dba/dkpdb.xml');
if hold_var then
  dbms_output.put_line('YES');
else
  dbms_output.put_line('NO');
end if;
end;
/

