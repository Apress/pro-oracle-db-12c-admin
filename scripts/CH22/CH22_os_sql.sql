select
  'USERNAME : ' || s.username|| chr(10) ||
  'OSUSER   : ' || s.osuser  || chr(10) ||
  'PROGRAM  : ' || s.program || chr(10) ||
  'SPID     : ' || p.spid    || chr(10) ||
  'SID      : ' || s.sid     || chr(10) ||
  'SERIAL#  : ' || s.serial# || chr(10) ||
  'MACHINE  : ' || s.machine || chr(10) ||
  'TERMINAL : ' || s.terminal
from v$session s,
     v$process p
where s.paddr = p.addr
and   p.spid  = &PID_FROM_OS;
--
select
  'USERNAME : ' || s.username || chr(10) ||
  'OSUSER   : ' || s.osuser   || chr(10) ||
  'PROGRAM  : ' || s.program  || chr(10) ||
  'SPID     : ' || p.spid     || chr(10) ||
  'SID      : ' || s.sid      || chr(10) ||
  'SERIAL#  : ' || s.serial#  || chr(10) ||
  'MACHINE  : ' || s.machine  || chr(10) ||
  'TERMINAL : ' || s.terminal || chr(10) ||
  'SQL TEXT : ' || sa.sql_text
from v$process p,
v$session s,
v$sqlarea sa
where p.addr = s.paddr
and s.username is not null
and s.sql_address = sa.address(+)
and s.sql_hash_value = sa.hash_value(+)
and p.spid= &PID_FROM_OS;

