/*
Q1(a)	The dataset to be used in this exercise is the College_Admission database provided along with this assignment. The dataset contains a normalized schema for a table of students, colleges, and information about students applying to colleges. You are required to load the data in Oracle Database and use SQL Developer to answer the following questions. For each question please provide query statements and results. (1*3=3 marks)
i.	Retrieve students’ names with majors for which they have applied.
ii.	Retrieve the name, GPA, and application decision of students from the high school with less than 1000 students and have applied to major in CS at Stanford.
iii.	Compute the amount by which the average GPA of students applying to CS  exceeds the average GPA of students who are not applying to CS. [Hint: compute two subqueries in the from clause, one of them computes the average GPA of CS applicants and one the average GPA of non CS applicants, in the select clause do the subtraction of the non-CS GPA from the CS-GPA].
Q1(b) In the next task, use the same database (College_Admission) by using PL/SQL block to work on triggers for the scenario given below: (4 marks)
 Create a row-level trigger on the student table that will fire after insertions into the student table by checking the GPA value of a new record. If the GPA of the inserted student is greater than 3.3, or less than or equal to 3.6, that student will be automatically applying to Stanford for a geology major and applying to MIT for a biology major. In other words, if the GPA of a new student satisfies the given condition (GPA>3.3 or GPA<=3.6), two new rows should be automatically added to Apply table, one with values (sID of the new Student, cName: ‘Stanford’, major: ‘geology’, Decision: NULL, and second row with values ( sID of the new student, cName: ‘MIT’, major: ‘biology’, Decision: NULL).
To test the above trigger, create and execute SQL statements to insert a new row in the student table with satisfying GPA conditions. E.g.
insert into Student values ('111', 'Kevin', 3.5, 1000);
insert into Student values ('222', 'Lori', 3.8, 1000);

The first insert statement satisfies the GPA condition (GPA>3.3 or GPA<=3.6), so two new tuples should be automatically added in the Apply table. You should provide trigger code, test SQL and query results showing new records in the student, and Apply tables according to your insert statement.
Q1(c)	In the next task, you will be working on the same database to work on indexes by considering the following scenario: (3 marks)
Create a tree-based index (one at a time) on the following attribute pairs (Note: by default, indexes are tree-based).
Student.sID, College.cName
Student.sID, Student.GPA
Apply.cName, College.cName
Apply.sID, Student.GPA
Execute the following query each time you create an index, and evaluate which two pairs of the index are most useful for speeding up query execution. For each pair, discuss why or why not that index pair is useful based on the number of disc blocks required to access to retrieve a record.
Select * From Student, Apply, College
Where Student.sID = Apply.sID and Apply.cName = College.cName
And Student.GPA > 1.5 And College.cName < 'Cornell'
*/

-- (a)i
select distinct SNAME, MAJOR
from student join apply on student.SID=apply.SID;

-- (a)ii

select SNAME,GPA, DECISION
from student join apply on student.SID=apply.SID
join college on college.CNAME=apply.CNAME
where SIZEHS<1000 and MAJOR='CS' and college.CNAME='Stanford';
-- (a)iii

select CS_GPA-nonCS_GPA
from
(
select avg(GPA) as CS_GPA
from student join apply on student.SID=apply.SID
where MAJOR='CS'
) t1,
(
select avg(GPA) as nonCS_GPA
from student join apply on student.SID=apply.SID
where MAJOR!='CS'
) t2;



--SNAME	MAJOR
--Amy	CS
--Amy	EE
--Amy	CS
--Amy	EE
--Bob	biology
--Craig	bioengineering
--Craig	bioengineering
--Craig	CS
--Craig	EE
--Fay	history
--Helen	CS
--Helen	CS
--Irene	CS
--Irene	biology
--Irene	marine biology
--Jay	history
--Jay	history
--Jay	psychology
--Craig	CS
--Download CSV
--19 rows selected.
--
--Result Set 9
--SNAME	GPA	DECISION
--Helen	3.7	Y
--Irene	3.9	N
--Download CSV
--2 rows selected.
--
--Result Set 10
--CS_GPA-NONCS_GPA
--.19761904761904761904761904761904761904

-- (b)

create or replace trigger trg_fire_student
after insert on student for each row
begin
    if :new.GPA>3.3 or :new.GPA<=3.6 then
        insert into apply values (:new.SID, 'Standford', 'geology', null);
        insert into apply values (:new.SID, 'MIT','biology', null);
    end if;
end;


-- (c)

drop index idx_sid;
drop index idx_cname;
drop index idx_gpa;
drop index idx_ap_cname;
drop index idx_ap_sid;

-- Student.sID, College.cName
create index idx_sid on student(SID);
create index idx_cname on college(CNAME);
-- Student.sID, Student.GPA
create index idx_sid on student(SID);
create index idx_gpa on student(GPA);

--Apply.cName, College.cName
create index idx_ap_cname on apply(CNAME);
create index idx_cname on college(CNAME);

--Apply.sID, Student.GPA
create index idx_ap_sid on student(SID);
create index idx_gpa on student(GPA);


Select * From Student, Apply, College
Where Student.sID = Apply.sID and Apply.cName = College.cName
And Student.GPA > 1.5 And College.cName < 'Cornell'


SID	SNAME	GPA	SIZEHS
123	Amy	3.9	1000
234	Bob	3.6	1500
345	Craig	3.5	500
456	Doris	3.9	1000
567	Edward	2.9	2000
678	Fay	3.8	200
789	Gary	3.4	800
987	Helen	3.7	800
876	Irene	3.9	400
765	Jay	2.9	1500
654	Amy	3.9	1000
543	Craig	3.4	2000
Download CSV
12 rows selected.

CNAME	STATE	ENROLLMENT
Stanford	CA	15000
Berkeley	CA	36000
MIT	MA	10000
Cornell	NY	21000
Download CSV
4 rows selected.


SID	CNAME	MAJOR	DECISION
123	Stanford	CS	Y
123	Stanford	EE	N
123	Berkeley	CS	Y
123	Cornell	EE	Y
234	Berkeley	biology	N
345	MIT	bioengineering	Y
345	Cornell	bioengineering	N
345	Cornell	CS	Y
345	Cornell	EE	N
678	Stanford	history	Y
987	Stanford	CS	Y
987	Berkeley	CS	Y
876	Stanford	CS	N
876	MIT	biology	Y
876	MIT	marine biology	N
765	Stanford	history	Y
765	Cornell	history	N
765	Cornell	psychology	Y
543	MIT	CS	N
Download CSV
19 rows selected.