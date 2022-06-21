create database salary_system
ON
( NAME =salary_system_data,
	  FILENAME = 'D:\salary_system_data.mdf',
	  SIZE=5MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
( NAME = SCT电气学院068_log,
      FILENAME ='D:\salary_system_log.ldf',
      SIZE=3MB,
      MAXSIZE = 15MB,
      FILEGROWTH = 10%)
GO

use salary_system

go
create table dept (
	id int not null  primary key ,
	name varchar(20) not null ,
	manager_id varchar(10)
);


create table emp(
	id varchar(10) primary key not null ,
	name varchar(20) not null ,
	sex varchar(5) check( sex in ( '男', '女')) ,
	birth date ,
	telphone varchar(20) ,
	education varchar(20) ,
	dept_id int not null ,
 	foreign key (dept_id) references dept(id)
);

alter table dept add constraint fk_manager foreign key(manager_id) references emp(id);

insert into dept values(1,'信息部',null);
insert into dept values(2,'销售部',null);
insert into dept values(3,'财务部',null);



insert into emp values('emp1001' , '李晓波' ,'男' , '1998-01-01' , '13900000000' , '本科' , '1') ,
('emp1002' , '刘慈欣' ,'女' , '1998-03-02' , '13526457801' , '硕士' , '2') ,
('emp1003' , '谭浩明' ,'男' , '1998-02-02' , '13530107801' , '本科' , '3') ,
('emp2001' , '张一一' ,'女' , '1998-11-01' , '13530117801' , '本科' , '1') ,
('emp2002' , '张二二' ,'女' , '1998-07-02' , '13530127801' , '本科' , '2') ,
('emp2003' , '张三三' ,'男' , '1999-08-02' , '13530137801' , '本科' , '3') ,
('emp2004' , '张四四' ,'男' , '1999-12-01' , '13530147801' , '硕士' , '1') ,
('emp2005' , '李五五' ,'男' , '1999-06-02' , '13530157801' , '硕士' , '2') ,
('emp2006' , '张菲菲' ,'女' , '1999-06-03' , '13530167801' , '本科' , '3') ;


update dept set manager_id='emp1001' where id=1;
update dept set manager_id='emp1002' where id=2;
update dept set manager_id='emp1003' where id=3;

create table salary(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	base money ,
	extra money ,
	reward money ,
	deduct money ,
	paydate date ,
	foreign key (emp_id) references emp(id)
);

insert into salary values('salary01_emp1001','emp1001',8000,500,1000,0,'2022-06-30'),
('salary01_emp2001','emp2001',6000,500,800,0,'2022-05-30'),
('salary02_emp2001','emp2001',6000,500,800,0,'2022-04-30'),
('salary01_emp2004','emp2004',6000,500,800,100,'2022-02-28'),
('salary01_emp1002','emp1002',8000,100,1000,0,'2022-04-28'),
('salary01_emp2002','emp2002',6500,0,600,50,'2022-05-30'),
('salary01_emp2005','emp2005',6500,200,100,0,'2022-06-30'),
('salary01_emp1003','emp1003',8000,0,1000,0,'2022-05-28'),
('salary01_emp2003','emp2003',7000,300,200,0,'2022-06-30'),
('salary01_emp2006','emp2006',6000,200,200,0,'2022-04-30');

create table worktime(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	check_in_time datetime ,
	check_out_time datetime ,
	foreign key (emp_id) references emp(id)

);

insert into worktime values ( 'work0001' , 'emp1001' , '2022-06-15 09:00:00' , '2022-06-15 17:20:00' ) ,
 ( 'work0002' , 'emp1002' , '2022-06-15 09:00:00' , '2022-06-15 17:15:00' ) ,
 ( 'work0003' , 'emp1003' , '2022-06-15 09:00:00' , '2022-06-15 18:10:00' ) ,
 ( 'work0004' , 'emp2001' , '2022-06-15 09:00:00' , '2022-06-15 17:02:00' ) ,
 ( 'work0005' , 'emp2002' , '2022-06-15 09:00:00' , '2022-06-15 18:03:00' ) ,
 ( 'work0006' , 'emp2003' , '2022-06-15 09:10:00' , '2022-06-15 17:04:00' ) ,
 ( 'work0007' , 'emp2004' , '2022-06-15 09:00:00' , '2022-06-15 17:15:00' ) ,
 ( 'work0008' , 'emp2005' , '2022-06-15 09:00:00' , '2022-06-15 14:06:00' ) ,
 ( 'work0009' , 'emp2006' , '2022-06-15 09:20:00' , '2022-06-15 19:17:00' ) ;

create table onleave(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	leave_start_time datetime ,
	leave_end_time datetime,
	foreign key (emp_id) references emp(id)
);

insert into onleave values ('1' , 'emp2004' , '2022-06-18 09:00:00' , '2022-06-21 14:00:00'),
('2' , 'emp2002' , '2022-06-12 14:00:00' , '2022-06-13 14:00:00');


go
-- 视图
go
create view V_dep_manage_info
as
select d.id as dept_id , d.name as dep_name , e.name as emp_name , e.sex as emp_sex , e.birth, e.telphone , e.education
from dept d , emp e
where d.manager_id = e.id;

go

select * from V_dep_manage_info



go

create view V_emp_real_salary
as
select e.id , e.name , (s.base + s.extra + s.reward - s.deduct) as real_salary
from emp e , salary s
where e.id = s.emp_id;

go

select * from V_emp_real_salary;




go
create view V_emp_kaoqin
as
select e.id , e.name , c.check_in_time , c.check_out_time , (c.check_out_time - c.check_in_time ) as work_time
from emp e , worktime c
where e.id = c.emp_id;

go

select * from V_emp_kaoqin;


go
create view V_emp_leavenum
as
select e.id , min(e.name) as name , count(l.id) as leave_num
from emp e , onleave l
where e.id = l.emp_id
group by e.id

go

select * from V_emp_leavenum;





go
create view V_emp_salaryhis
as
select e.id , e.name , s.base + s.extra + s.reward-s.deduct as salary , s.paydate
from emp e , salary s
where e.id = s.emp_id;

go

select * from V_emp_salaryhis;



-- 查询、更新
/* 查询 员工及所属部门 */
go
select * from emp e , dept d
where e.dept_id = d.id;

/* 查询员工2022年6月份工资 */
go
select * ,(s.base + s.reward+ s.extra - s.deduct) as 实发工资 from emp e , salary s
where e.id = s.emp_id and s.paydate like '2022-06-%';

/* 查询各部门2022年6月份平均工资 */
go
select e.dept_id , avg(s.base + s.reward + s.extra - s.deduct) as avg_salary from emp e , salary s
where e.id = s.emp_id and s.paydate like '2022-06-%'
group by e.dept_id;

/* 查询编号为 emp2002 的员工的请假记录 */
go
select * from emp e , onleave l
where e.id = l.emp_id and e.id = 'emp2002';


/* 查询各个员工2022-06-15号的考勤记录，按签出时间排序 */
go
select * from emp e , worktime c
where e.id = c.emp_id and convert(varchar , c.check_in_time , 23) = '2022-06-15'
order by c.check_out_time;



/* 更新 将所有部门的普通员工的基本工资改为6500 */
go
select emp_id , base from salary where emp_id in ( select e.id  from emp e , dept d where e.dept_id = d.id and e.id <> d.manager_id);
go
update salary set base=6500 where emp_id in (

	select e.id from  emp e , dept d
	where e.dept_id = d.id and e.id <> d.manager_id
	)
go
select emp_id , base from salary where emp_id in ( select e.id  from emp e , dept d where e.dept_id = d.id and e.id <> d.manager_id);




-- 触发器
/* 当插入新数据到考勤表时，如果新数据的签出时间晚于19:00:00，在薪水表中给该员工的加班工资添加100元 */
go
create trigger trg_inserttoworktime
on worktime
instead of insert
as
declare @checkouttime datetime
declare @empid varchar(10)
select @checkouttime = check_out_time , @empid = emp_id from inserted
if(convert(varchar , @checkouttime , 8) > '19:00:00')
begin
update salary set extra = extra+10  where emp_id = @empid
select * from salary where emp_id = @empid
end

go



/* 当插入新数据到请假表时，如果该员工当月请假次数已大于等于3次，则给该员工的当月工资扣除50元 */

go
create trigger trg_inserttoleave
on onleave
instead of insert
as
declare @num int
declare @empid varchar(10)
declare @leavestarttime datetime
select @empid = emp_id , @leavestarttime = leave_start_time from inserted;
select @num = count(emp_id) from leave where emp_id = @empid and datepart(m,leave_start_time) = datepart(m,@leavestarttime)
if(@num >=3)
begin
update salary set deduct = deduct + 50 where emp_id = @empid and datepart(m,paydate) = datepart(m,@leavestarttime)
end



-- 存储过程


/* 参数add_num，给各部门领导添加add_num元奖金 */
go
create procedure pro_addreward
@add_num money
as
begin

update salary set reward = reward + @add_num where emp_id in (select * from ( select manager_id from dept group by manager_id) t)
end

go

select emp_id , reward from salary where emp_id in ( select manager_id from dept )
exec pro_addreward 200
select emp_id , reward from salary where emp_id in ( select manager_id from dept )



/* 参数a，查询a部门的工资排序 */
go
create procedure pro_querydepsal
@depid varchar(20)
as
begin
select e.id , e.name , s.base , s.reward , s.extra , s.deduct , (s.base + s.reward + s.extra - s.deduct) as actual from dept d , emp e , salary s
where e.id = s.emp_id and e.dept_id  = d.id and d.id = @depid
order by (s.base+s.reward+s.extra-s.deduct)
end

go

exec pro_querydepsal 1
exec pro_querydepsal 2
exec pro_querydepsal 3



/* 查询实发工资在参数a和参数b之间的员工信息 */
go
create procedure pro_querysalary
@a money ,
@b money
as
begin
	select * from emp e , V_emp_real_salary ac where e.id = ac.id  and ac.real_salary between @a and @b ;

end

go

exec pro_querysalary 6900 , 8000
go







