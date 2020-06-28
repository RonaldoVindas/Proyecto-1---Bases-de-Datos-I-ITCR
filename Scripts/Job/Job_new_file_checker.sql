BEGIN
    DBMS_SCHEDULER.create_job (
        job_name => 'DAILY_NEW_FILE_CHECK',
        job_type => 'PLSQL_BLOCK',
        job_action => 'BEGIN CONTROL_JOBCHECKCOUNT.JOBCHECKCOUNT; END;',
        start_date => '27-JUN-20 11.00.00 PM -06:00',
        repeat_interval => 'FREQ=DAILY;INTERVAL=1',
        end_date => NULL,
        enabled => TRUE,
        comments => 'This job checks for newly inserted files everyday at 11:00 p.m');
END;
