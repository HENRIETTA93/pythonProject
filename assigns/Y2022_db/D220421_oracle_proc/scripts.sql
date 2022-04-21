drop table jobs;

create table jobs(
job_id varchar2(10) primary key,
job_title varchar2(50),
min_salary number(10,2),
max_salary number(10,2)
);

insert into jobs values('IT_DBA','dba',10,20);

select * from jobs;

-- 1
create or replace procedure UPD_JOB(jobId IN varchar, jobTitle IN varchar)
as
v_count number;
my_exp exception;
pragma exception_init(my_exp,-1);
begin
select count(*) into v_count from jobs where job_id=jobId;
if v_count<1 then
dbms_output.put_line('no update occurs');
end if;
update jobs set job_title=jobTitle where job_id=jobId;
exception
  when my_exp then
 dbms_output.put_line('no update occurs');
end;

-- 2
begin
UPD_JOB('IT_DBA','Database Administrator');
end;

select * from jobs;

-- 3
begin
UPD_JOB('IT_WEB','Web Master');
end;

select * from jobs;