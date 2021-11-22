### 1
/*
创建Employees表、Department表。各表的结构如下所示：

Employees表结构
列名	数据类型	长度	是否允许为空值	说明
EmployeeID	Char	6	×	员工编号，主键
Name	Char	10	×	姓名
Birthday	Date		×	出生日期
Sex	Number	1	×	性别
Address	Char	20	√	地址
Zip	Char	6	√	邮编
PhoneNumber	Char	12	√	电话号码
DepartmentID	Char	3	×	员工部门号，外键

Department表结构
列名	数据类型	长度	是否允许为空值	说明
DepartmentID	Char	3	×	部门编号，主键
DepartmentName	Char	20	×	部门名
Note	Varchar2	100	√	备注


表1 Employees表数据样本
编号	姓名	出生日期	性别	住址	邮编	电话号码	部门号
000001	王林	1966-01-23	1	中山路32-1-508	210003	83355668	2
010008	伍容华	1976-03-28	1	北京东路100-2	210001	83321321	1
020010	王向容	1982-12-09	1	四牌楼10-0-108	210006	83792361	1
020018	李丽	1960-07-30	0	中山东路102-2	210002	93413301	1
102201	刘明	1972-10-18	1	虎距路100-2	210013	83606608	5
102208	朱俊	1965-09-28	1	牌楼巷5-3-106	210004	84708817	5
108991	钟敏	1979-08-10	0	中山路10-3-105	210003	83346722	3
111006	张石兵	1974-10-01	1	解放路34-1-203	210010	84563418	5
210678	林涛	1977-04-02	1	中山北路24-35	210008	83467336	3
302566	李玉珉	1968-09-20	1	热和路209-3	210001	58765991	4
308759	叶凡	1978-11-18	1	北京西路3-7-52	210002	83308901	4
504209	陈琳琳	1969-09-03	0	汉中路120-4-12	210018	84468158	4


表2 Departments表数据样本
部门号	部门名称	备注	部门号	部门名称	备注
1	财务部	NULL	4	研发部	NULL
2	人力资源部	NULL	5	市场部	NULL
3	经理办公室	NULL


1.用SQL语句建立这两个表的结构并把相应数据插入进去
2. 统计男性女性员工的人数
3.找出所有年龄大于55岁的员工信息
4.找出研发部的所有员工信息
5.查找名为钟敏的员工所在部门的信息
*/
drop table Employees;
drop table Department;



create table Department(
DepartmentID char(3) not null primary key,
DepartmentName char(20) not null,
Note varchar2(100)
);
create table Employees(
EmployeeID char(6) not null primary key,
Name char(10) not null,
Birthday Date not null,
Sex Number(1) not null,
Address char(20),
Zip Char(6),
PhoneNumber char(12),
DepartmentID Char(3) not null,
foreign key (DepartmentID) references Department(DepartmentID)
);

insert into Department values (1,'财务部',NULL);
insert into Department values (2,'人力资源部',NULL);
insert into Department values (3,'经理办公室',NULL);
insert into Department values (4,'研发部',NULL);
insert into Department values (5,'市场部',NULL);

insert into Employees values('000001','王林',	to_date('1966-01-23','YYYY-MM-DD'),	1,	'中山路32-1-508',	'210003',	'83355668',	2);
insert into Employees values('010008','伍容华',	to_date('1976-03-28','YYYY-MM-DD'),	1,	'北京东路100-2',	'210001',	'83321321',	1);
insert into Employees values('020010','王向容', to_date('1982-12-09','YYYY-MM-DD'),	1,	'四牌楼10-0-108','210006',	'83792361',	1 );
insert into Employees values('020018','李丽',to_date('1960-07-30','YYYY-MM-DD'),	0,	'中山东路102-2',	'210002',	'93413301',	1 );
insert into Employees values('102201','刘明',	to_date('1972-10-18','YYYY-MM-DD'),	1,	'虎距路100-2',	'210013',	'83606608',	5 );
insert into Employees values('102208','朱俊',	to_date('1965-09-28','YYYY-MM-DD'),	1,	'牌楼巷5-3-106',	'210004',	'84708817',	5);
insert into Employees values('108991','钟敏',	to_date('1979-08-10','YYYY-MM-DD'),	0,	'中山路10-3-105','210003',	'83346722',	3 );
insert into Employees values('111006','张石兵',	to_date('1974-10-01','YYYY-MM-DD'),	1,	'解放路34-1-203','210010',	'84563418',	5 );
insert into Employees values('210678','林涛',	to_date('1977-04-02','YYYY-MM-DD'),	1,	'中山北路24-35',	'210008',	'83467336',	3 );
insert into Employees values('302566','李玉珉',	to_date('1968-09-20','YYYY-MM-DD'),	1,	'热和路209-3',	'210001',	'58765991',	4 );
insert into Employees values('308759','叶凡',to_date('1978-11-18','YYYY-MM-DD'),	1,	'北京西路3-7-52','210002',	'83308901',	4 );
insert into Employees values('504209','陈琳琳',	to_date('1969-09-03','YYYY-MM-DD'),	0,	'汉中路120-4-12','210018',	'84468158',	4 );
commit;

select Sex, count(EmployeeID)
from Employees
group by Sex;

select * from Employees where to_char(sysdate,'YYYY')-to_char(Birthday,'YYYY')>55;

select e.*
from Employees e join Department d on e.DepartmentID=d.DepartmentID
where d.DepartmentName='研发部';

select d.*
from Employees e join Department d on e.DepartmentID=d.DepartmentID
where e.Name='钟敏';

### 2
/*
create table student(
sno varchar2(10) primary key,
sname varchar2(20),
sage number(2),
ssex varchar2(5)
);
create table teacher(
tno varchar2(10) primary key,
tname varchar2(20)
);
create table course(
cno varchar2(10),
cname varchar2(20),
tno varchar2(20),
constraint pk_course primary key (cno,tno)
);
create table sc(
sno varchar2(10),
cno varchar2(10),
score number(4,2),
constraint pk_sc primary key (sno,cno)
);
/*******初始化学生表的数据******/
insert into student values ('s001','张三',23,'男');
insert into student values ('s002','李四',23,'男');
insert into student values ('s003','吴鹏',25,'男');
insert into student values ('s004','琴沁',20,'女');
insert into student values ('s005','王丽',20,'女');
insert into student values ('s006','李波',21,'男');
insert into student values ('s007','刘玉',21,'男');
insert into student values ('s008','萧蓉',21,'女');
insert into student values ('s009','陈萧晓',23,'女');
insert into student values ('s010','陈美',22,'女');
commit;
/******************初始化教师表***********************/
insert into teacher values ('t001', '刘阳');
insert into teacher values ('t002', '谌燕');
insert into teacher values ('t003', '胡明星');
commit; );
/***************初始化课程表****************************/
insert into course values ('c001','J2SE','t002');
insert into course values ('c002','Java Web','t002');
insert into course values ('c003','SSH','t001');
insert into course values ('c004','Oracle','t001');
insert into course values ('c005','SQL SERVER 2005','t003');
insert into course values ('c006','C#','t003');
insert into course values ('c007','JavaScript','t002');
insert into course values ('c008','DIV+CSS','t001'); );
insert into course values ('c009','PHP','t003');
insert into course values ('c010','EJB3.0','t002');
commit;
/***************初始化成绩表***********************/
insert into sc values ('s001','c001',78.9);
insert into sc values ('s002','c001',80.9);
insert into sc values ('s003','c001',81.9);
insert into sc values ('s004','c001',60.9);
insert into sc values ('s001','c002',82.9);
insert into sc values ('s002','c002',72.9);
insert into sc values ('s003','c002',81.9);
insert into sc values ('s005','c005','59');
commit;
/*
1、查询“c001”课程比“c002”课程成绩高的所有学生的学号；
2、查询平均成绩大于60 分的同学的学号和平均成绩；
3、查询所有同学的学号、姓名、选课数、总成绩；
4、查询没学过“谌燕”老师课的同学的学号、姓名；
5、查询课程编号“c002”的成绩比课程编号“c001”课程低的所有同学的学号、姓名；
6、查询出只选修了一门课程的全部学生的学号和姓名
7、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列
8、求选了课程的学生人数
9、查询各个课程及相应的选修人数
10、查询两门以上不及格课程的同学的学号及其平均成绩
*/

select t1.sno
from
(
select sno, score
from sc
where cno='c001'
) t1,
(
select sno, score
from sc
where cno='c002'
) t2
where t1.sno=t2.sno and t1.score>t2.score;


select sno, avg(score)
from sc
group by sno
having avg(score)>60;

select s.sno, s.sname, count(sc.cno), sum(sc.score)
from student s
join sc on s.sno=sc.sno
group by s.sno, s.sname;

select sno, sname
from student
where sno not in (
select sc.sno
from sc join course c on sc.cno=c.cno
join teacher t on c.tno=t.tno
where t.tname='谌燕'
);

select s.sno, s.sname
from student s
join
(
select t1.sno
from
(
select sno, score
from sc
where cno='c001'
) t1,
(
select sno, score
from sc
where cno='c002'
) t2
where t1.sno=t2.sno and t1.score>t2.score
) t on t.sno=s.sno;

select s.sno, s.sname
from student s join sc on s.sno=sc.sno
group by s.sno, s.sname
having count(sc.cno)=1;

select cno, avg(score)
from sc
group by cno
order by avg(score), cno desc;

select count(distinct sno)
from sc;

select cno, count(sno)
from sc
group by cno;

select sno, avg(score)
from sc
where sno in ( select sno from sc where score<60 group by sno having count(cno)>=2)
group by sno;

### 3
/*
1、	创建表departments和表employees, 并为两张表输入若干数据。

表departments结构：
字段名称    字段类型         约束
Dep_id      number          主键
Dep_name    varchar2(20)
表employees结构：
字段名称    字段类型         约束
emp_id      number          主键
emp_name    varchar2(20)
sex         varchar2(20)
title       varchar2(20)
wage        number
idcard      varchar2(12)
dep_id      number          外键
（表的数据需要根据程序要求自行添加）

2、	编写PL/SQL程序，查询5号员工工资，如果工资小于3000，则加200员工资，并提示信息“5号员工工资已更新。”，如果工资大于3000，则提示信息“5号员工工资为XXX，已达到规定标准。”
3、	编写PL/SQL程序，查询1号员工的工资，使用CASE语句输出其工资等级。工资小于等于3000，等级为“低”；工资大于3000，小于5000，等级为”中”；工资大于等于5000，等级为高；
4、	编写PL/SQL程序，查询的departments表中是否有部门号为“6”的记录，如果没有，插入新记录部门号为6，部门名称为“后勤部”。如果有，显示查询结果。

*/
-- 1
create table departments(
dep_id  number  primary key,
dep_name varchar2(20)
);

create table employees(
emp_id   number  primary key,
emp_name  varchar2(20),
sex  varchar2(20),
title  varchar2(20),
wage  number,
idcard  varchar2(12),
dep_id  number,
foreign key (dep_id) references departments(dep_id)
);

insert into departments values (1,'财务部');
insert into departments values (2,'人力资源部');
insert into departments values (3,'经理办公室');
insert into departments values (4,'研发部');
insert into departments values (5,'市场部');

insert into employees values(1,'王一一','男', '文员', 2500,12345678901,1);
insert into employees values(2,'王二二','男', '文员', 2500,12345678901,2);
insert into employees values(3,'王三三','女', '主任', 2500,12345678901,3);
insert into employees values(4,'王四四','女', '文员', 2500,12345678901,4);
insert into employees values(5,'王五五','男', '主任', 2500,12345678901,5);
insert into employees values(6,'王六六','女', '文员', 2500,12345678901,3);
commit;
-- 2

-- 3
create or replace function fn_salary_level(emp_id number)
return varchar2(5)
is
salary_level varchar2(5);
begin
    select case when wage<=3000 then '低'
    when wage>3000 and wage<5000 then '中'
    when wage>=5000 then '高' end into salary_level
    from employees;
    return salary_level;
end;

-- 4
create or replace procedure pr_dept_find()
is begin
dept_num number;
dept_name varchar2(20);
select count(1) into dept_num from departments where dep_id=6;
select dep_name into dept_name from departments where dep_id=6;
if dept_num =0 then
insert into departments values(6,'后勤部');
else
dbms_output.put_line(dep_name);
end if;
end;


### 4
/*
(1)	用PL/SQL在EMP表中查询职业为CLERK，且比他的上司受雇时间早的职工的名字及其上司的名字，并将存入新建的表NAME中。用两种方法来解答：
①用游标WHILE循环实现；②用游标FOR循环实现。
(2)	编写带参数的存储过程，有两个参数，参数1为要加薪的部门号，参数2为加薪幅度，实现给职工加工资，部门号为0表示给所有部门的职工都加。
(3)	创建触发器MyTrigger，它的作用是当表DEPT中的记录被删除后，自动删除表EMP中的对应的员工记录，从而保证数据的完整性。
*/

### 5
/*
在SQL/PLUS环境下完成以下操作：
以用户SCOTT登陆，完成以下操作
1.查询当前用户的所有约束的基本信息
2. 查询当前用户的所有表的基本信息
以用户SYS登陆(AS SYSDBA)，完成以下操作
1. 查询关于内存结构的一些信息
2. 查询用户的所有的触发器的基本信息
3. 查询构成数据字典的所有的表信息
4. 查询所有后台进程信息
5. 查询数据文件的基本信息
6．查询所有表空间的信息
7. 查询当前所有用户的基本信息
*/

### 6
'''
CREATE USER c##hr_admin
IDENTIFIED BY password
DEFAULT TABLESPACE data_ts
QUOTA 100M ON test_ts
QUOTA 500K ON data_ts
TEMPORARY TABLESPACE temp_ts
CONTAINER = ALL;
'''
/*
1)	了解数据库用户。
2)	熟悉创建、更改、删除、查看用户的方法。
3)	了解数据库的不同权限。
4)	掌握权限的授予和回收的方法。
5)	了解权限、角色的不同点以及它们之间的关系。
6)	熟练掌握对角色的管理。
实验内容：
1.创建一个用户student，密码是m1234，默认表空间myspace，临时表空间mytemp,帐户锁定（表空间和临时表空间需要自己创建）

2.创建一个锁定前允许的最大失败登陆次数为5次，口令宽限期为6天， 并启用口令复杂函数的概要文件myprofile，并分配给用户student

3.创建一个角色myrole，具有连接到数据库以及创建表，视图的权限，并把这个角色赋给用户student
*/


CREATE USER c##student
IDENTIFIED BY m1234
DEFAULT TABLESPACE myspace
QUOTA 100M ON test_ts
QUOTA 500K ON data_ts
TEMPORARY TABLESPACE mytemp
CONTAINER = ALL;
ALTER USER student lock;


CREATE PROFILE myprofile LIMIT
SESSIONS_PER_USER UNLIMITED
CPU_PER_SESSION UNLIMITED
CPU_PER_CALL 6000
CONNECT_TIME 60
LOGICAL_READS_PER_SESSION DEFAULT
LOGICAL_READS_PER_CALL 6000
COMPOSITE_LIMIT 6000000
PRIVATE_SGA 66K
FAILED_LOGIN_ATTEMPTS 6
PASSWORD_LIFE_TIME 60
PASSWORD_REUSE_TIME 60
PASSWORD_REUSE_MAX 5
PASSWORD_LOCK_TIME 1/24
PASSWORD_GRACE_TIME 10;