/*
 高校学籍管理系统
功能要求：
●实现学生信息、班级、院系、专业等的管理；
●实现课程、学生成绩信息管理；
●实现学生的奖惩信息管理；
●创建规则用于限制性别项只能输入“男”或“女”；
●创建视图查询各个学生的学号、姓名、班级、专业、院系；
●创建存储过程查询指定学生的成绩单；
●创建触发器当增加、删除学生和修改学生班级信息时自动修改相应班级学生人数；
●建立数据库相关表之间的参照完整性约束。

 */



create database 高校学籍管理系统
ON
( NAME =高校学籍管理系统_data,
	  FILENAME = 'D:\高校学籍管理系统_data.mdf',
	  SIZE=5MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
( NAME = SCT电气学院068_log,
      FILENAME ='D:\高校学籍管理系统_log.ldf',
      SIZE=5MB,
      MAXSIZE = 15MB,
      FILEGROWTH = 1MB)
GO

use 高校学籍管理系统

go
create table 院系(
院系id int primary key,
院系名 varchar(20) not null
);

create table 班级(
班级id int primary key,
班级名 varchar(20),
院系id int,
学生人数 int,
constraint 班级_院系_fk foreign key (院系id) references 院系(院系id)
);

create table 学生(
学生id int primary key,
姓名 varchar(20) not null,
性别 char(2) not null,
班级 int,
地址 varchar(20),
constraint 班级_学生_fk foreign key (班级) references 班级(班级id),
constraint 学生_性别_ck check (性别 in ('男','女'))
);

create table 教师(
教师id int primary key,
姓名 varchar(20) not null,
性别 char(2) not null,
constraint 教师_性别_ck check (性别 in ('男','女'))
);

create table 课程(
课程id int primary key,
课程名 varchar(20) not null,
学分 int,
教师id int,
constraint 课程_教师_fk foreign key (教师id) references 教师(教师id)
);

create table 选课(
学生id int,
课程id int,
成绩 int,
选课次数 int,
primary key(学生id,课程id),
constraint 选课_学生_fk foreign key (学生id) references 学生(学生id),
constraint 选课_课程_fk foreign key (课程id) references 课程(课程id)
);


create table 奖惩(
学生id int,
奖惩名称 varchar(20),
奖惩内容 varchar(50),
奖惩日期 date,
primary key(学生id,奖惩名称,奖惩日期),
constraint 奖惩_学生_fk foreign key (学生id) references 学生(学生id)
);

go
go
insert into 教师 values(101,'王小非','男');
insert into 教师 values(102,'张大郎','男');
insert into 教师 values(103,'古爱零','女');
insert into 教师 values(104,'张三三','男');

insert into 课程 values(1,'C语言',20,101);
insert into 课程 values(2,'Java语言',30,102);
insert into 课程 values(3,'数据库',32,103);
insert into 课程 values(4,'操作系统',32,103);

insert into 院系 values(11,'计算机系');
insert into 院系 values(12,'中文系');

insert into 班级 values(2001,'信息工程1班',11,0);
insert into 班级 values(2002,'计科1班',11,0);
insert into 班级 values(2003,'软件工程',11,0);
insert into 班级 values(2004,'计算智能',11,0);

insert into 学生 values(20001,'小白','男',2002,'XXX大街XX路01号');
insert into 学生 values(20002,'小王','男',2002,'XXX大街XX路01号');
insert into 学生 values(20003,'小红','女',2002,'XXX大街XX路01号');
insert into 学生 values(20004,'小刘','男',2002,'XXX大街XX路01号');
insert into 学生 values(20005,'张一一','女',2002,'XXX路XX02');
insert into 学生 values(20006,'张一二','女',2002,'XXX路XX02');
insert into 学生 values(20007,'张一三','女',2002,'XXX路XX02');
insert into 学生 values(20008,'张一四','男',2001,'XXX路XX02');
insert into 学生 values(20009,'张一五','男',2001,'XXX路XX02');
insert into 学生 values(20010,'张一六','男',2001,'XXX路XX02');
insert into 学生 values(20011,'小华','女',2001,'XXX北01号');


insert into 选课 values(20001,1,79,1);
insert into 选课 values(20001,2,79,1);
insert into 选课 values(20001,3,79,1);
insert into 选课 values(20002,1,79,1);
insert into 选课 values(20002,2,80,1);
insert into 选课 values(20002,3,80,1);
insert into 选课 values(20002,4,89,1);
insert into 选课 values(20003,3,89,1);
insert into 选课 values(20003,4,89,1);
insert into 选课 values(20004,3,89,1);
insert into 选课 values(20005,3,79,1);
insert into 选课 values(20006,3,68,1);
insert into 选课 values(20007,2,68,1);
insert into 选课 values(20008,2,68,1);
insert into 选课 values(20009,2,55,1);
insert into 选课 values(20010,2,55,1);

insert into 奖惩 values(20001,'院系奖学金','奖金3000','2022-01-03');
insert into 奖惩 values(20002,'院系奖学金','奖金3000','2022-01-03');
insert into 奖惩 values(20003,'学校奖学金','奖金3000','2022-01-03');
insert into 奖惩 values(20002,'院系奖学金','奖金1000','2022-07-03');
insert into 奖惩 values(20001,'违反校规','惩罚书面检查','2021-03-03');
insert into 奖惩 values(20004,'国家奖学金','奖金10000','2021-01-03');

go
create view 学生信息_vw as
select s.姓名,c.班级名,d.院系名
from 学生 s,班级 c,院系 d
where s.班级=c.班级id and c.院系id=d.院系id;

go
select * from 学生信息_vw;


go
create procedure 学生成绩_pro @学生id int
as
select s.学生id,s.姓名,c.课程名,sc.成绩
from 学生 s,选课 sc, 课程 c
where s.学生id=sc.学生id and s.学生id=@学生id
and sc.课程id=c.课程id;

go
exec 学生成绩_pro @学生id=20001;


GO
create trigger tri_跟新班级人数
on 学生
for insert
as
begin
    declare @班级id int
 declare @课程id int
 select @班级id=班级 from 学生
 begin
     update 班级 set 学生人数=学生人数+1 where 班级id=@班级id
 end
end

go
insert into 学生 values(20012,'王往往','女',2001,'XXXX宿舍')
go


-- 查询所有的学生信息
select * from 学生信息_vw;

-- 查询所有的教师信息
select * from 教师;

-- 查询所有的课程信息，并列出教授课程的教师

select 课程.*, 教师.姓名
from 课程,教师
where 课程.教师id=教师.教师id;

-- 查询所有的学生的选课信息，及成绩

select 学生.学生id,姓名,课程.课程id, 课程名, 选课.成绩
from 学生, 选课, 课程
where 学生.学生id=选课.学生id
and 选课.课程id=课程.课程id;

-- 计科1班转来一名女学生，学号在现有基础上递增，名字为 '小小白',地址未知。首先列出原来的班级人数，插入数据后，再列出班级人数。
go
select * from 班级 where 班级名='计科1班';
go
insert into 学生 values( (select max(学生id)+1 from 学生),'小小白', '女',(select 班级id from 班级 where 班级名='计科1班'),null);
go
select * from 班级 where 班级名='计科1班';




-- 查询在2022年的奖惩信息
select * from 奖惩 where YEAR(奖惩日期)=2022;

-- 使用存储过程查询学生小王的成绩单
go
declare @id int
set @id=(select 学生id from 学生 where 姓名='小王')
exec  学生成绩_pro @学生id=@id
go

-- 查询每个同学的最高分、最低分以及平均成绩
select 学生.学生id,姓名, max(选课.成绩), min(选课.成绩), avg(选课.成绩)
from 学生, 选课, 课程
where 学生.学生id=选课.学生id
and 选课.课程id=课程.课程id
group by 学生.学生id,姓名;



select 院系.院系名, max(选课.成绩) as 最高分,min (选课.成绩) as 最低分
from 院系
left join 班级 on 院系.院系id=班级.院系id
left join 学生 on 学生.班级=班级.班级id
left join 选课 on 选课.学生id= 学生.学生id
group by 院系.院系名;

select 姓名, avg(选课.成绩) as 平均分
from 学生
left join 选课 on 选课.学生id= 学生.学生id
where 姓名 like '%白%'
group by 姓名
order by 平均分 desc;


select 教师.姓名, sum(课程.学分) as 总学分
from 教师
left join 课程 on 课程.教师id=教师.教师id
group by 教师.姓名
order by 总学分 desc;