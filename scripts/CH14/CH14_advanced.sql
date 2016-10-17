create or replace type rec_exa_type is object
(
  exa_id        number
 ,machine_count number
 ,hide_flag     number
 ,oracle        number
 ,ship_date     date
 ,rack_type     varchar2(32)
);
/
--
create or replace function exa_trans
return table_exa_type pipelined is
begin
for r1 in
   (select rec_exa_type(
      exa_id, machine_count, hide_flag
     ,oracle, ship_date, rack_type
    ) exa_rec
    from exadata_et) loop
  if (r1.exa_rec.oracle = 0) then
    r1.exa_rec.ship_date := r1.exa_rec.ship_date + 30;
  end if;
 pipe row (r1.exa_rec);
end loop;
return;
end;
/
--
create table exa_info(
  exa_id        NUMBER 
 ,machine_count NUMBER
 ,hide_flag     NUMBER
 ,oracle        NUMBER
 ,ship_date     DATE
 ,rack_type     VARCHAR2(32)
) nologging parallel 2;
