Question 1: Consider the 4 relations, namely, student, takes, section, and course in the relational database schema （above）(the slide 3.13 in ch3.pptx). In the database schema design, there are foreign keys defined: from takes to student, from takes to section, and from section to course. Suppose that you are requested to find student IDs and the course information (e.g., course id and course title) they have taken in 2021.
(a)	Do you have to follow the foreign keys in the database design to answer this question using all the 4 relations? Give you answer with justification.
Yes. Because takes relation 的ID references student’ID , join these two tables should follow the foreign keys.
Using natural join it will join them based on the same ID in student and takes relation.
Using theta-join, it can 指定student ID 和takes ID 相等。
Section relation 的course_id references course 的course_id, join these two talbes should follow the foreign keys.
And takes relation 的 course_id 和sec_id references section 的course_id 和sec_id， join these two talbes should follow the foreign keys.

(b)	Show an SQL query to answer this question using natural joins.
select *
from student natural join takes
natural join section
natural join course;
(c)	Show an SQL query to answer this question using θ-joins.

select *
from student, takes, section, course
where student.ID=takes.ID
and takes.course_id=section.course_id and takes.sec_id=section.sec_id
and section.course_id=course.course_id;

Note: we have discussed θ-join (slides 3.14-3.15 ch3.pptx) and natural join (slides 3.16-3.20 ch3.pptx).
  Question 2: Consider the following query: “For all courses, show its course id if one of its section was once taught by a SEEM department instructor and was once taught by a CSE department instructor.”
(a)	Answer this query using SQL in which you must have set operations.
select course.course_id
from course natural join section
natural join teaches
natural join instructor
where instructor.dept_name='SEEM'
 intersect
select course.course_id
from course natural join section
natural join teaches
natural join instructor
where instructor.dept_name='CSE';
(b)	Answer this query using SQL in which you must only use joins and selections excluding set operations, nested subquery, or derived relation.
SELECT
	course.course_id
FROM
	course
	INNER JOIN section ON course.course_id = section.course_id
	INNER JOIN teaches ON teaches.course_id = section.course_id
	AND teaches.sec_id = section.sec_id
	INNER JOIN teaches t2 ON t2.course_id = section.course_id
	AND t2.sec_id = section.sec_id
	INNER JOIN instructor inst1 ON inst1.ID = teaches.ID
	INNER JOIN instructor inst2 ON inst2.ID = t2.ID
WHERE
	inst1.dept_name = 'SEEM'
	AND inst2.dept_name = 'CSE';
(c)	Answer this query using SQL in which you must use nested subquery without correlation variables.
SELECT
	c1.course_id
FROM
	course c1
	INNER JOIN section s1 ON c1.course_id = s1.course_id
	INNER JOIN teaches t1 ON t1.course_id = s1.course_id
	AND t1.sec_id = s1.sec_id
	INNER JOIN instructor inst1 ON inst1.ID = t1.ID
WHERE
	inst1.dept_name = 'SEEM'
	AND c1.course_id IN (
	SELECT
		c2.course_id
	FROM
		course c2
		INNER JOIN section s2 ON c2.course_id = s2.course_id
		INNER JOIN teaches t2 ON t2.course_id = s2.course_id
		AND t2.sec_id = s2.sec_id
		INNER JOIN instructor inst2 ON inst2.ID = t2.ID
	WHERE
		inst2.dept_name = 'CSE'
	);
(d)	Answer this query using SQL in which you must use nested subquery with correlation variables.

SELECT
	c1.course_id
FROM
	course c1
	INNER JOIN section s1 ON c1.course_id = s1.course_id
	INNER JOIN teaches t1 ON t1.course_id = s1.course_id
	AND t1.sec_id = s1.sec_id
	INNER JOIN instructor inst1 ON inst1.ID = t1.ID
  where inst1.dept_name='SEEM' and exists
	(
	select *
	from course c2
	INNER JOIN section s2 ON c2.course_id = s2.course_id
	INNER JOIN teaches t2 ON t2.course_id = s2.course_id
	AND t2.sec_id = s2.sec_id
	INNER JOIN instructor inst2 ON inst2.ID = t2.ID
	where inst2.dept_name='CSE' and inst1.ID!=inst2.ID and c1.course_id=c2.course_id
	);

(e)	Answer this query using SQL in which you must use derived relations.
SELECT
	t1.course_id
FROM
	(
	SELECT
		c1.course_id
	FROM
		course c1
		INNER JOIN section s1 ON c1.course_id = s1.course_id
		INNER JOIN teaches t1 ON t1.course_id = s1.course_id
		AND t1.sec_id = s1.sec_id
		INNER JOIN instructor inst1 ON inst1.ID = t1.ID
	WHERE
		inst1.dept_name = 'SEEM'
	) t1
	INNER JOIN (
	SELECT
		c2.course_id
	FROM
		course c2
		INNER JOIN section s2 ON c2.course_id = s2.course_id
		INNER JOIN teaches t2 ON t2.course_id = s2.course_id
		AND t2.sec_id = s2.sec_id
		INNER JOIN instructor inst2 ON inst2.ID = t2.ID
	WHERE
		inst2.dept_name = 'CSE'
	) t2 ON t1.course_id = t2.course_id;
  Question 3: Consider a query to find the instructor names who have the highest salary.
(a)	Give your answer using aggregate function.
select name
from instructor where salary=(
select max(salary)
from instructor
);


(b)	There is an incorrect answer to this question.
select name, salary from instructor order by name desc
Explain why this SQL is considered as incorrect.
This sql 对name 进行了排序，要查询最高工资的instructor，需要salary进行排序。
  Question 4: We discussed assertion in Chapter 4. Write an assertion to ensure a student cannot take more than 30 credits per semester. Note that the credits of a course is specified in the credits attribute in the course relation.

create assertion credits_nomore30_constraint check
(
not exists
(
select student.ID from student where tot_cred >
(
select sum(credits)
from takes, student,course
where takes.course_id = course.course_id
and student.ID = takes.ID
and grade is not null and grade <> 'F'
group by takes.semester
having sum(credits)>=30
)
)
);

  Question 5: Suppose that the grade attribute in the takes relation are not letter grades (e.g., A, A-, ...), but are numeric scores in the range of 0-100. Answer the following questions using SQL.
(a)	For all students, show their student ID, name, and their total numeric scores.
select student.ID, name, sum(takes.grade) as total_scores
from takes inner join student on student.ID=takes.ID
group by student.ID, name;

(b)	For all students, show their student ID, name, and average numeric scores.
select student.ID, name, avg(takes.grade) as avg_scores
from takes inner join student on student.ID=takes.ID
group by student.ID, name;

(c)	For every department, show the department name, and the maximum average numeric score.
select dept_name, max(avg_scores)
from
(
select dept_name, student.ID, name, avg(takes.grade) as avg_scores
from takes inner join student on student.ID=takes.ID
group by dept_name,student.ID, name
) t
group by dept_name;
(d)	Show the department name with the lowest average numeric score over the answer of (3).
with tmp
as
(
select dept_name, max(avg_scores) as max_avg_scores
from
(
select dept_name, student.ID, name, avg(takes.grade) as avg_scores
from takes inner join student on student.ID=takes.ID
group by dept_name,student.ID, name
) t
group by dept_name
)
select dept_name
from tmp
where max_avg_scores=
(
select min(max_avg_scores) from tmp
);

  Question 6: Answer the following questions using SQL statements.
(a)	Show the full department names that contain ’Eng.’ twice, assuming that you do not know the full name.
select dept_name
from department
where dept_name like '%Eng.%Eng.%';
(b)	Show candidate classrooms with building name, room no, and capacity for a section that has 100 students, which are not used for any other sections on Thursday in term Fall, 2022. Note that the day in the relation of time slot is week day.
select classroom.building, classroom.room_no, classroom.capacity
from classroom
inner join section on section.building=classroom.building and section.room_no=classroom.room_no
where section.sec_id=
(
select section.sec_id
from section
inner join takes on takes.sec_id=section.sec_id
where section.sec_id
not in
(
select section.sec_id
from section
where semester = 'Fall'
and year = 2022
and time_slot_id =(select time_slot_id from time_slot where DAYNAME(now())!='Thursday')
)
group by section.sec_id
having count(takes.ID)=100
);

(c)	Find student names and the instructor names if the students have taken any course taught by their advisor. Note that the advisor relation records that an instructor (i id) is the advisor of a student (s id).
select t3.s_name, t3.t_name
from
(
select teaches.course_id, instructor.ID
from instructor
inner join teaches on teaches.ID=instructor.ID
) t1,
(
select takes.course_id, student.ID
from student
inner join takes on takes.ID=student.ID
) t2,
(
select student.ID as s_id, student.name as s_name, instructor.ID as i_id, instructor.name as t_name
from student
inner join advisor on student.ID=advisor.s_id
inner join instructor on instructor.ID=advisor.i_id
) t3
where t1.course_id=t2.course_id and t1.ID=t3.i_id and t2.ID=t3.s_id;

(d)	For each student who has not taken any section taught by his/her advisor, output his/her ID, assuming that each student has exactly one advisor.
select ID
from student
where ID not in
(
select student.ID
from student
inner join advisor on student.ID=advisor.s_id
inner join instructor on instructor.ID=advisor.i_id
inner join takes on takes.ID=student.ID
inner join teaches on teaches.ID=instructor.ID
where takes.sec_id=teaches.sec_id and takes.course_id=teaches.course_id
);
(e)	To help students to plan their study plan over 4 years, you are required to show all prerequisites (directly and indirectly) for all courses offered by SEEM department.
with prerequisites
as
(
select prereq.prereq_id
from department
inner join course on course.dept_name=department.dept_name
inner join prereq on prereq.course_id=course.course_id
where department.dept_name='SEEM'
)
select prereq_id
from prerequisites
union
select prereq.prereq_id
from prerequisites
inner join prereq on prereq.course_id=prerequisites.prereq_id;
