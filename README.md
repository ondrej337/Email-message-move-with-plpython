# Email-message-move-with-plpython
Email message move with plpython in postgresql database

Example:
mail from INBOX to SPAM

1. Instal Python imap_tools
https://pypi.org/project/imap-tools/ (follow the instruction)

 pip install imap_tools
2. Create Schema mycron

CREATE SCHEMA mycron;
2.1 Create 2 tables on schema mycron:
download file: userbox.sql, usermail.sql

2.2 Create function mycron.py_move_mail()
download file: py_move_mail.py

2.3 Call function:
Call plpython function to test

SELECT mycron.py_move_mail(1);
3. PGcron job:
Create JOB: (every 5 minutes)

SELECT cron.schedule ('Move ','*/10 * * * *',$$select mycron.py_move_mail(1)$$);
Unselect from cron: 10->id_job:

select cron.unschedule(10); 
Table of the created jobs:

SELECT * FROM cron.job;
History of jobs run:

select * from cron.job_run_details order by runid desc;
