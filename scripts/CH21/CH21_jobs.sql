SELECT job_name
 ,last_start_date
 ,last_run_duration
 ,next_run_date
 ,repeat_interval
FROM dba_scheduler_jobs
WHERE job_name='RMAN_BACKUP';
--
SELECT job_name
,log_date
,operation
,status
FROM dba_scheduler_job_log
WHERE job_name='RMAN_BACKUP';
