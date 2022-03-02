create database training;
use training;
drop table if exists WORKOUTS;
drop table if exists USERS;

create table USERS(
USER_EMAIL varchar(30) primary key,
USER_NAME varchar(30),
USER_PAYMENT varchar(30)
);

create table WORKOUTS(
ID int,
USER_EMAIL varchar(30),
INSERT_TIMESTAMP timestamp,
WORKOUT_DATE date,
WORKOUT_TYPE varchar(30),
WORKOUT_DURATION time,
WORKOUT_DISTANCE_MILES float,
WORKOUT_CITY varchar(30),
WORKOUT_STATE char(2),
WORKOUT_COMMENT text,
foreign key (USER_EMAIL) references USERS(USER_EMAIL)
);



-- 1	2021-02-04 10:33:12	1/12/2021	Running	1:05:34	8.12	Cambridge	MA	Awesome run!	lisa@mymail.com	Lisa Simpson	VISA
-- 2	2021-02-05 15:30:02	1/3/2021	Swimming	0:22:10	0.5	Boston	MA	Boring but necessary	wonka@yahoo.com	Willie Wonka	PAYPAL
-- 3	2021-02-06 20:26:52	2/2/2021	Hiking	3:12:09	6.41	Burlington	VT		jhn@work.org	John Doe
-- 4	2021-02-08 12:23:42	2/2/2021	Walking	3:15:33	6.48			Scenic views	jdoe@vz.com	Jane Doe	MC
-- 5	2021-02-09 6:20:32	2/3/2021	Weight Lifting	0:45:01		New Haven	CT	Nailed it!	jdoe@vz.com	Jane Doe	MC
-- 6	2021-02-10 11:17:03	10/13/2021	Running	1:58:12	26.2	Chicago	IL	Set my PR on this one!	jr@yahoo.com	Jack Rabbit

insert into USERS values ('lisa@mymail.com', 'Lisa Simpson', 'VISA');
insert into USERS values ('wonka@yahoo.com',	'Willie Wonka',	'PAYPAL');
insert into USERS values ('jhn@work.org',	'John Doe', NULL);
insert into USERS values ('jdoe@vz.com',	'Jane Doe', 'MC');
insert into USERS values ('jr@yahoo.com',	'Jack Rabbit', NULL);

insert into WORKOUTS values (1,'lisa@mymail.com', '2021-02-04 10:33:12','2021-01-12', 'Running', '1:05:34', 8.12, 'Cambridge','MA','Awesome run!');
insert into WORKOUTS values (2,'wonka@yahoo.com', '2021-02-05 15:30:02','2021-01-03','Swimming','0:22:10',	0.5,'Boston','MA',	'Boring but necessary');
insert into WORKOUTS values (3,'jhn@work.org', '2021-02-06 20:26:52','2021-02-02','Hiking','3:12:09',6.41,'Burlington','VT',null);
insert into WORKOUTS values (4,'jdoe@vz.com', '2021-02-08 12:23:42','2021-02-02','Walking',	'3:15:33', 6.48,null, null, 'Scenic views');
insert into WORKOUTS values (5,'jdoe@vz.com', '2021-02-09 6:20:32',	'2021-02-03','Weight Lifting','0:45:01',null,'New Haven','CT','Nailed it!');
insert into WORKOUTS values (6,'jr@yahoo.com', '2021-02-10 11:17:03', '2021-10-13','Running','1:58:12',26.2, 'Chicago','IL','Set my PR on this one!');

use training;


select * from USERS;

select * from WORKOUTS;

select * from USERS where USER_PAYMENT is null;

update USERS set USER_PAYMENT='FREE' where USER_PAYMENT is null;

select * from WORKOUTS where WORKOUT_DATE <'2021-02-01';

-- SET SQL_SAFE_UPDATES = 0;

delete from WORKOUTS where WORKOUT_CITY is null and WORKOUT_STATE is null;

alter table USERS add column EXPIRE_DATE date;

 describe USERS;

 alter table WORKOUTS drop column WORKOUT_COMMENT;

 describe WORKOUTS;


use employees;

select * from employees limit 0, 1000;

select (
select count(*) as male_count
from employees
where gender='M'
)/(select count(*) from employees) as male_percent,
(
select count(*) as female_count
from employees
where gender='F'
)/(select count(*) from employees) as female_percent;

select sum(if(gender='F',1, 0))*100/count(*)||'%', sum(if(gender='M', 1,0))*100/count(*)||'%'
from employees;

select * from salaries order by salary desc limit 3;
