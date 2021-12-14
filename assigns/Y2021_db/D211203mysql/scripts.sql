
-- 1
-- schools(school, conference)
-- degree_salary(degree, starting_median, mid_career_median, mid_career_90)
-- school_salary(school, region, starting_median, mid_career_median, mid_career_90)

drop table if exists school_salary;
drop table if exists degree_salary;
drop table if exists schools;


--a.	What is the SQL for creating the relations and loading the files into the relations.  Be sure to include any key, foreign key, or check constraints that you see when creating the relations.   Include any transformations you do on the data to enable the data to be loaded/used and made consistent.  (20 points)

create table schools(
school varchar(100) primary key,
conference varchar(20)
);

create table school_salary(
school varchar(100) primary key,
region varchar(20),
starting_median text,
mid_career_median text,
mid_career_90 text
);


create table degree_salary(
degree varchar(50) primary key,
starting_median text,
mid_career_median text,
mid_career_90 text
);

update school_salary set starting_median=null where starting_median='';
update school_salary set mid_career_median=null where mid_career_median='';
update school_salary set mid_career_90=null where mid_career_90='';

update school_salary set starting_median=replace(substring(starting_median,2),',',''),
mid_career_median=replace(substring(mid_career_median,2),',',''),
mid_career_90=replace(substring(mid_career_90,2),',','');

alter table school_salary modify starting_median decimal(20,2);
alter table school_salary modify mid_career_median decimal(20,2);
alter table school_salary modify mid_career_90 decimal(20,2);

update degree_salary set starting_median=null where starting_median='';
update degree_salary set mid_career_median=null where mid_career_median='';
update degree_salary set mid_career_90=null where mid_career_90='';

update degree_salary set starting_median=replace(substring(starting_median,2),',',''),
mid_career_median=replace(substring(mid_career_median,2),',',''),
mid_career_90=replace(substring(mid_career_90,2),',','');

alter table degree_salary modify starting_median decimal(20,2);
alter table degree_salary modify mid_career_median decimal(20,2);
alter table degree_salary modify mid_career_90 decimal(20,2);


select * from school_salary where school not in (select school from schools)
;

select * from schools where school not in (select school from school_salary)
;

delete from schools where school not in (select school from school_salary);

alter table schools add constraint fk_school foreign key (school) references school_salary (school);

--b.	What is all the information in the school_salary relation about tech schools in descending order by starting median salary?  (10 points)
select *
from school_salary
order by starting_median desc;

--c.	What is the degree and salary information for the degree with the highest 90th percentile mid-career salary? (10 points)
select degree, mid_career_90
from degree_salary
where mid_career_90=(select max(mid_career_90) from degree_salary);

--d.	What is all the salary information for the schools in the Big Ten in decreasing order of mid-career 90th percentile salary? (10 points)

select school_salary.school, region, starting_median, mid_career_median, mid_career_90
from school_salary join schools on schools.school=school_salary.school
where schools.conference='Big Ten'
order by mid_career_90 desc;


--e.	List the school and salary information for these NJ schools:  Fairleigh Dickinson University, Princeton University, Rider University, Rutgers University, Seton Hall University, Stevens Institute of Technology in ascending order by school.  Use FORMAT and CONCAT to create a string for the salary that has a starting $ and a comma after the thousands place, for example:  $49,200.00 .  The salary columns in the result should be named starting_median, mid_career_median, and mid_career_90.  (10 points)
select school,concat('$',format(starting_median,2)) as starting_median,
concat('$',format(mid_career_median,2)) as mid_career_median,
concat('$',format(mid_career_90,2)) as mid_career_90
from school_salary
where school in ('Fairleigh Dickinson University', 'Princeton University', 'Rider University', 'Rutgers University', 'Seton Hall University', 'Stevens Institute of Technology')
order by school;


--f.	List the degree and starting median salary in descending order by median salary for degrees about information, marketing, accounting, finance, or business.  Use FORMAT and CONCAT to create a string for the salary that has a starting $ and a comma after the thousands place, for example:  $49,200.00 .  The result columns should be named degree and starting_median.  (10 points)
select degree, concat('$',format(starting_median,2)) as starting_median
from degree_salary
where lower(degree) like '%information%' or
lower(degree) like '%marketing%' or
lower(degree) like '%accounting%' or
lower(degree) like '%finance%' or
lower(degree) like '%business%'
order by starting_median desc;


--g.	What schools in the Big Ten have a higher median starting salary than the median starting salary of Management Information Systems (MIS), and what are their median starting salaries?  Format the starting salaries with a starting $ and a comma after the thousands place in a result column called starting_median.  List the schools in the answer in descending order by median starting salary.  (10 points)

select schools.school, concat('$',format(starting_median,2)) as starting_median
from school_salary join schools on school_salary.school=schools.school
where schools.conference='Big Ten'
and school_salary.starting_median>(select starting_median from degree_salary where degree='Management Information Systems (MIS)')
order by starting_median desc;

--h.	What are the schools, conferences, regions and starting median salaries for schools that  do not have a median mid-career salary listed for the 90th percentile?  Format the starting salaries with a starting $ and a comma after the thousands place, and call the column starting_median in the result.  Also include a column called both_mid_career_unknown which should be set to True if both the mid-career median and the mid-career 90th percentile are set to null and False otherwise. Sort the result in ascending order by conference and then school.  (10 points)
select schools.school, schools.conference, school_salary.region, concat('$',format(school_salary.starting_median,2)) as starting_median,
case when mid_career_median is null and mid_career_90 is null then true else false end as both_mid_career_unknown
from schools join school_salary on schools.school=school_salary.school
where mid_career_90 is null
order by conference, schools.school;

--i.	What is the name, median starting salary, median mid-career salary, and percentage increase from median starting to median mid-career salary for the school(s) with the highest percentage increase?  Calculate the percentage increase as ((mid_career_median – starting_median)/starting_median)*100.  Round the percentage increase to the nearest integer and add a % symbol to the end.  The column with the percentage increase should be called percent_incr. (10 points).

select school, starting_median, mid_career_median, concat(round((mid_career_median-starting_median)/starting_median*100),'%') as percent_incr
from school_salary
where concat(round((mid_career_median-starting_median)/starting_median*100),'%')=
(select max(concat(round((mid_career_median-starting_median)/starting_median*100),'%')) from school_salary)
;



-- a new
drop table if exists degree_salary;
drop table if exists schools;
drop table if exists school_salary;

drop table if exists school_salary_src;
drop table if exists degree_salary_src;
drop table if exists schools_src;

create table schools_src(
school varchar(100) primary key,
conference varchar(20)
);

create table school_salary_src(
school varchar(100) primary key,
region varchar(20),
starting_median text,
mid_career_median text,
mid_career_90 text
);


create table degree_salary_src(
degree varchar(50) primary key,
starting_median_salary text,
mid_career_median text,
mid_career_90th_percentile_salary text
);


create table schools(
school varchar(100) primary key,
conference varchar(20)
);

create table school_salary(
school varchar(100) primary key,
region varchar(20),
starting_median text,
mid_career_median text,
mid_career_90 text
);


create table degree_salary(
degree varchar(50) primary key,
starting_median text,
mid_career_median text,
mid_career_90 text
);

insert into school_salary select * from school_salary_src;

insert into schools select * from schools_src;

insert into degree_salary select * from degree_salary;


update school_salary set starting_median=null where starting_median='';
update school_salary set mid_career_median=null where mid_career_median='';
update school_salary set mid_career_90=null where mid_career_90='';

update school_salary set starting_median=replace(substring(starting_median,2),',',''),
mid_career_median=replace(substring(mid_career_median,2),',',''),
mid_career_90=replace(substring(mid_career_90,2),',','');

alter table school_salary modify starting_median decimal(20,2);
alter table school_salary modify mid_career_median decimal(20,2);
alter table school_salary modify mid_career_90 decimal(20,2);

update degree_salary set starting_median=null where starting_median='';
update degree_salary set mid_career_median=null where mid_career_median='';
update degree_salary set mid_career_90=null where mid_career_90='';

update degree_salary set starting_median=replace(substring(starting_median,2),',',''),
mid_career_median=replace(substring(mid_career_median,2),',',''),
mid_career_90=replace(substring(mid_career_90,2),',','');

alter table degree_salary modify starting_median decimal(20,2);
alter table degree_salary modify mid_career_median decimal(20,2);
alter table degree_salary modify mid_career_90 decimal(20,2);


select * from school_salary where school not in (select school from schools)
;

select * from schools where school not in (select school from school_salary)
;

delete from schools where school not in (select school from school_salary);

alter table schools add constraint fk_school foreign key (school) references school_salary (school);