BEGIN
DBMS_SCHEDULER.CREATE_JOB(
job_name => 'RMAN_BACKUP',
job_type => 'EXECUTABLE',
job_action => '/orahome/oracle/bin/rmanback.bsh',
repeat_interval => 'FREQ=DAILY;BYHOUR=9;BYMINUTE=35',
start_date => to_date('17-01-2013','dd-mm-yyyy'),
job_class => '"DEFAULT_JOB_CLASS"',
auto_drop => FALSE,
comments => 'RMAN backup job',
enabled => TRUE);
END;
/

