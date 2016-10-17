CONNECT &&master_user/&&master_pwd
--
SET LINESIZE 132 PAGESIZE 0 ECHO OFF FEEDBACK OFF
SET VERIFY OFF HEAD OFF TERM OFF TRIMSPOOL ON
--
SPO gen_syns_dyn.sql
--
select 'create or replace synonym ' || table_name || 
       ' for ' || '&&master_user..' ||
  table_name || ';'
from user_tables;
--
SPO OFF;
--
SET ECHO ON FEEDBACK ON VERIFY ON HEAD ON TERM ON;

