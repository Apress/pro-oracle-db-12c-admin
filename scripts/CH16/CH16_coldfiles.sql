select name from v$datafile
union
select name from v$controlfile
union
select name from v$tempfile
union
select member from v$logfile;

