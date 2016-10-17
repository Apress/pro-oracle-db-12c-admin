column "MVIEW BEING REFRESHED" format a25
column inserts format 9999999
column updates format 9999999
column deletes format 9999999
--
select
  currmvowner_knstmvr || '.' || currmvname_knstmvr "MVIEW BEING REFRESHED",
  decode(reftype_knstmvr, 1, 'FAST', 2, 'COMPLETE', 'UNKNOWN') reftype,
  decode(groupstate_knstmvr, 1, 'SETUP', 2, 'INSTANTIATE',
     3, 'WRAPUP', 'UNKNOWN' ) STATE,
  total_inserts_knstmvr inserts,
  total_updates_knstmvr updates,
  total_deletes_knstmvr deletes
from x$knstmvr x
where type_knst = 6
and exists (select 1
            from v$session s
            where s.sid=x.sid_knst
            and s.serial#=x.serial_knst);

