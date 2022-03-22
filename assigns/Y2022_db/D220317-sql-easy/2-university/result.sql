 -- 1
 select name,dept_name from instructor
 order by dept_name, name;

-- 2
 select d.dept_name, median(i.salary)
 from instructor i
 join department d on d.dept_name=i.dept_name
 group by d.dept_name
 having median(i.salary)>50000 and median(i.salary)<90000;


-- 3
create table num_students(
ID int primary key,
number_advisees int
);

insert into num_students
select i_ID, count(s_ID)
from advisor
group by i_ID
having count(s_ID)>=1;

-- 4
delete
from takes
where year<2022 and grade is null;

-- 5
select name,tot_cred
from student
where ID in
(
select s.ID
from student s
join takes t on s.ID=t.ID
join course c on t.course_id=c.course_id
where t.grade in ('B', 'B+','A-','A','A+')
group by s.ID
having count(c.course_id)>=3
)
order by tot_cred;



-- 6
insert into section
values
(
(select course_id from course where course_id='CS-101'),
(select max(sec_id)+1 from section s where course_id='CS-101'),
(select semester from section s where course_id='CS-101' limit 1),
(select max(year)+1 from section s where course_id='CS-101'),
null,
null,
null
);

insert into section
values
(
(select course_id from course where course_id='CS-190'),
(select max(sec_id)+1 from section s where course_id='CS-190'),
(select semester from section s where course_id='CS-190' limit 1),
(select max(year)+1 from section s where course_id='CS-190'),
null,
null,
null
);

insert into section
values
(
(select course_id from course where course_id='CS-315'),
(select max(sec_id)+1 from section s where course_id='CS-315'),
(select semester from section s where course_id='CS-315' limit 1),
(select max(year)+1 from section s where course_id='CS-315'),
null,
null,
null
);

insert into section
values
(
(select course_id from course where course_id='CS-319'),
(select max(sec_id)+1 from section s where course_id='CS-319'),
(select semester from section s where course_id='CS-319' limit 1),
(select max(year)+1 from section s where course_id='CS-319'),
null,
null,
null
);

insert into section
values
(
(select course_id from course where course_id='CS-347'),
(select max(sec_id)+1 from section s where course_id='CS-347'),
(select semester from section s where course_id='CS-347' limit 1),
(select max(year)+1 from section s where course_id='CS-347'),
null,
null,
null
);


-- 7
select time_slot_id, course_id, count(time_slot_id) as slot_count
from section s
where s.course_id in (select course_id from teaches)
group by time_slot_id, course_id
order by course_id, slot_count;
