BEGIN
    DBMS_SCHEDULER.create_job (
        job_name => 'DAILY_NEW_FILE_CHECK',
        job_type => 'PLSQL_BLOCK',
        job_action => 'BEGIN SELECT CONTROL_QUERIES.NEWCRIMINALRECORD FROM DUAL; END;',
        start_date => '30-JUN-20 11.12.00 PM -06:00',
        repeat_interval => 'FREQ=DAILY;INTERVAL=1',
        end_date => NULL,
        enabled => TRUE,
        comments => 'This job checks for newly inserted files everyday at 11:00 p.m');
END;
