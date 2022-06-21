create table teacher(
id smallint primary key,
name varchar(20)
);

create table course(
id smallint primary key,
name varchar(100),
teacher_id SMALLINT,
foreign key (teacher_id) references teacher(id)
);


create table class(
id smallint primary key,
name varchar(50)
);

create table student (
id smallint primary key,
name varchar(20),
gender char(2),
class_id smallint,
foreign key (class_id) REFERENCES class(id)
);

create table score(
id int,
student_id smallint,
course_id smallint,
mark tinyint
);






delete from teacher;

INSERT INTO teacher (id, name) VALUES (1,'老虎');
INSERT INTO teacher (id, name) VALUES (2,'小马');
INSERT INTO teacher (id, name) VALUES (3,'大牛');




INSERT INTO class (id, name) VALUES (1, '软件工程1班');
INSERT INTO class (id, name) VALUES (2, '计算机科学技术1班');
INSERT INTO class (id, name) VALUES (3, '网络工程1班');

INSERT INTO course (id,name,teacher_id) VALUES (1,'数据结构', 1);
INSERT INTO course (id,name,teacher_id) VALUES (2,'java语言', 2);
INSERT INTO course (id,name,teacher_id) VALUES (3,'数据库原理', 3);
INSERT INTO course (id,name,teacher_id) VALUES (4,'C语言', 1);

INSERT INTO student (id,name, gender,class_id) VALUES(1,'牡丹','女',1);
INSERT INTO student (id,name, gender,class_id) VALUES(2,'柳树','男',2);
INSERT INTO student (id,name, gender,class_id) VALUES(3,'玫瑰','女',3);
INSERT INTO student (id,name, gender,class_id) VALUES(4,'月季','女',1);
INSERT INTO student (id,name, gender,class_id) VALUES(5,'小草','男',2);
INSERT INTO student (id,name, gender,class_id) VALUES(6,'风清','男',3);
INSERT INTO student (id,name, gender,class_id) VALUES(7,'月明','女',1);

INSERT INTO score (id, student_id, course_id, mark) VALUES (1,1,2,79);
INSERT INTO score (id, student_id, course_id, mark) VALUES (2,2,1,58);
INSERT INTO score (id, student_id, course_id, mark) VALUES (3,2,3,66);
INSERT INTO score (id, student_id, course_id, mark) VALUES (4,2,4,80);
INSERT INTO score (id, student_id, course_id, mark) VALUES (5,3,1,63);
INSERT INTO score (id, student_id, course_id, mark) VALUES (6,3,4,95);
INSERT INTO score (id, student_id, course_id, mark) VALUES (7,4,2,88);
INSERT INTO score (id, student_id, course_id, mark) VALUES (8,4,3,62);
INSERT INTO score (id, student_id, course_id, mark) VALUES (9,5,2,59);
INSERT INTO score (id, student_id, course_id, mark) VALUES (10,5,4,100);
INSERT INTO score (id, student_id, course_id, mark) VALUES (11,1,1,55);

INSERT INTO score (id, student_id, course_id, mark) VALUES (12,3,2,81);
INSERT INTO score (id, student_id, course_id, mark) VALUES (13,4,4,50);
INSERT INTO score (id, student_id, course_id, mark) VALUES (14,5,3,77);
INSERT INTO score (id, student_id, course_id, mark) VALUES (15,1,4,58);
INSERT INTO score (id, student_id, course_id, mark) VALUES (16,1,3,91);
INSERT INTO score (id, student_id, course_id, mark) VALUES (17,6,1,75);
INSERT INTO score (id, student_id, course_id, mark) VALUES (18,4,1,80);
INSERT INTO score (id, student_id, course_id, mark) VALUES (19,2,2,75);




-- 1
SELECT c.name, t.name as tname
FROM course c join teacher t on t.id=c.teacher_id;


-- 2
select t1.sid
from
(
select c.id as cid, c.name, s.id as sid, sc.mark
from score sc join student s on s.id=sc.student_id
join course c on sc.course_id=c.id
where c.name='数据结构'
) t1,
(
select c.id as cid, c.name, s.id as sid, sc.mark
from score sc join student s on s.id=sc.student_id
join course c on sc.course_id=c.id
where c.name='java语言'
) t2 where t1.mark<t2.mark and t1.sid=t2.sid;

-- 3
select s.id as sid, round(avg(sc.mark),2) as avgscore
from score sc join student s on sc.student_id=s.id
group by s.id
having avg(sc.mark)>65;

-- 4
select  s.name, round(avg(sc.mark),2) as avgscore
from score sc join student s on sc.student_id=s.id
group by s.name
having avg(sc.mark)>65;


-- 5
select s.name, count(sc.course_id) coursecount, sum(sc.mark) as totalmark
from score sc join student s on sc.student_id=s.id
group by s.name;

-- 6
select distinct s.name
from score sc join student s on sc.student_id=s.id
join course c on c.id=sc.course_id
where c.teacher_id not in (select id from teacher where name='大牛');

-- 7
select s.name
from score sc join student s on sc.student_id=s.id
where sc.course_id in(
select c.id
from course c join teacher t on c.teacher_id=t.id
where t.name='大牛');


-- 8
select distinct s.name
from score sc join student s on sc.student_id=s.id
where sc.mark<60;

-- 9
select s.name
from score sc join student s on sc.student_id=s.id
group by s.name
having count(distinct sc.course_id)=(select count(*) from course);

-- 10
select distinct s.name
from score sc join student s on sc.student_id=s.id
where sc.course_id in (
select sc.course_id
from score sc join student s on sc.student_id=s.id
where s.name='小草');

-- 11
select s.name
from score sc join student s on sc.student_id=s.id
where sc.course_id not in (
select sc.course_id
from score sc join student s on sc.student_id=s.id
where s.name='小草');

-- 12
select sc.course_id, max(sc.mark) as max_score, min(sc.mark) as min_mark
from score sc
group by sc.course_id;

-- 13
select s.id as sid, s.name
from score sc join student s on sc.student_id=s.id
group by s.id, s.name
having count(distinct sc.course_id)=1;

-- 14
select c.id, c.name, avg(sc.mark) as avgmark
from score sc join course c on c.id=sc.course_id
group by c.id, c.name
order by avgmark, c.id desc;

-- 15
select t1.student_id, t1.`数据库原理`, t2.`java语言`,
t3.`c语言`, t4.coursecount, t4.avgmark
from
(
select sc.student_id, sc.mark as "数据库原理"
from score sc join course c on c.id=sc.course_id
where c.name='数据库原理'
) t1,
(
select sc.student_id, sc.mark as "java语言"
from score sc join course c on c.id=sc.course_id
where c.name='java语言'
) t2,
(
select sc.student_id, sc.mark as "c语言"
from score sc join course c on c.id=sc.course_id
where c.name='c语言'
) t3,
(
select s.id as sid, count(sc.course_id) as coursecount, avg(sc.mark) as avgmark
from score sc join student s on sc.student_id=s.id
group by s.id
) t4 where t1.student_id=t2.student_id and t2.student_id=t3.student_id
and t3.student_id=t4.sid;