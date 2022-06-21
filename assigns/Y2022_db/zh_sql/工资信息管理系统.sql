create table dep (
	id int not null  primary key ,
	name varchar(20) not null ,
	manager_id varchar(10) not null ,
	foreign key (emp_id) references emp(id)
);

insert into dep values(1,'信息部','emp1001');
insert into dep values(2,'销售部','emp1002');
insert into dep values(3,'财务部','emp1003');

create table emp(
	id varchar(10) primary key not null ,
	name varchar(20) not null ,
	sex varchar(5) check( sex in ( '男', '女')) ,
	birth date ,
	tel varchar(20) ,
	education varchar(20) ,
	dep_id int not null ,
 	foreign key (dep_id) references dep(id)
);

insert into emp values('emp1001' , '李晓波' ,'男' , '1998-01-01' , '13900000000' , '本科' , '1') ,
('emp1002' , '刘慈欣' ,'女' , '1998-03-02' , '13526457801' , '硕士' , '2') ,
('emp1003' , '谭浩明' ,'男' , '1998-02-02' , '13530107801' , '本科' , '3') ,
('emp2001' , '张一一' ,'女' , '1998-11-01' , '13530117801' , '本科' , '1') ,
('emp2002' , '张二二' ,'女' , '1998-07-02' , '13530127801' , '本科' , '2') ,
('emp2003' , '张三三' ,'男' , '1999-08-02' , '13530137801' , '本科' , '3') ,
('emp2004' , '张四四' ,'男' , '1999-12-01' , '13530147801' , '硕士' , '1') ,
('emp2005' , '李五五' ,'男' , '1999-06-02' , '13530157801' , '硕士' , '2') ,
('emp2006' , '张菲菲' ,'女' , '1999-06-03' , '13530167801' , '本科' , '3') ;

create table salary(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	jiben money ,
	jiaban money ,
	jiangjin money ,
	kouchu money ,
	paytime date ,
	foreign key (id) references emp(id)
);

insert into salary values('SA10068emp1001','emp1001',8000,500,1000,0,'2020-07-28'),
('SA10068emp2001','emp2001',6000,500,800,0,'2020-07-30'),
('SA10068emp2004','emp2004',6000,500,800,100,'2020-07-30'),

('SA100681001004','emp1002',8000,100,1000,0,'2020-07-28'),
('SA100681001005','emp2002',6500,0,600,50,'2020-07-30'),
('SA100681001006','emp2005',6500,200,100,0,'2020-07-30'),

('SA100681001007','emp1003',8000,0,1000,0,'2020-07-28'),
('SA100681001008','emp2003',7000,300,200,0,'2020-07-30'),
('SA100681001009','emp2006',6000,200,200,0,'2020-07-30')；

create table checkon(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	check_in_time datetime ,
	check_out_time datetime ,
	foreign key (emp_id) references emp(id)

);

insert into checkon values ( 'CK100860001' , 'emp1001' , '2020-07-15 09:00:00' , '2020-07-15 17:20:00' ) ,
 ( 'CK100860002' , 'emp1002' , '2020-07-15 09:00:00' , '2020-07-15 17:15:00' ) ,
 ( 'CK100860003' , 'emp1003' , '2020-07-15 09:00:00' , '2020-07-15 18:10:00' ) ,
 ( 'CK100860004' , 'emp2001' , '2020-07-15 09:00:00' , '2020-07-15 17:02:00' ) ,
 ( 'CK100860005' , 'emp2002' , '2020-07-15 09:00:00' , '2020-07-15 18:03:00' ) ,
 ( 'CK100860006' , 'emp2003' , '2020-07-15 09:10:00' , '2020-07-15 17:04:00' ) ,
 ( 'CK100860007' , 'emp2004' , '2020-07-15 09:00:00' , '2020-07-15 17:05:00' ) ,
 ( 'CK100860008' , 'emp2005' , '2020-07-15 09:00:00' , '2020-07-15 17:06:00' ) ,
 ( 'CK100860009' , 'emp2006' , '2020-07-15 09:20:00' , '2020-07-15 19:17:00' ) ;

create table leave(
	id varchar(20) primary key not null ,
	emp_id varchar(10) not null ,
	leave_start_time datetime ,
	leave_end_time datetime,
	foreign key (emp_id) references emp(id)
);

insert into leave values ('LE1001230001' , 'emp2004' , '2020-07-18 09:00:00' , '2020-07-20 14:00:00'),
('LE1001230001' , 'emp2002' , '2020-07-20 14:00:00' , '2020-07-21 14:00:00');


====视图======
create view V_dep_manage_info
as
select d.id as dep_id , d.name as dep_name , e.name as emp_name , e.sex as emp_sex , e.birth as emp_birth , e.tel as emp_tel , e.edu as emp_edu
from dep d , emp e
where d.emp_id = e.id;

go

select * from V_dep_manage_info





create view V_emp_actualsalary
as
select e.id , e.name , (s.jiben + s.jiaban + s.jiangjin - s.kouchu ) as actual_salary
from emp e , salary s
where e.id = s.emp_id;

go

select * from V_emp_actualsalary;





create view V_emp_kaoqin
as
select e.id , e.name , c.check_in_time , c.check_out_time , (c.check_out_time - c.check_in_time ) as 在勤时间
from emp e , checkon c
where e.id = c.emp_id;

go

select * from V_emp_kaoqin;



create view V_emp_leavenum
as
select e.id , min(e.name) as name , count(l.id) as leave_num
from emp e , leave l
where e.id = l.emp_id
group by e.id

go

select * from V_emp_leavenum;






create view V_emp_salaryhis
as
select e.id , e.name , s.jiben , s.jiaban , s.kouchu , s.paytime
from emp e , salary s
where e.id = s.emp_id;

go

select * from V_emp_salaryhis;



===查询、更新===
/* 查询 员工及所属部门 */
select * from emp e , dep d
where e.dep_id = d.id;

/* 查询员工7月份工资 */
select * ,(s.jiben + s.jiangjin + s.jiaban - s.kouchu) as 实发工资 from emp e , salary s
where e.id = s.emp_id and s.paytime like '%-07-%';

/* 查询各部门7月份平均工资 */
select e.dep_id , avg(s.jiben + s.jiangjin + s.jiaban - s.kouchu) from emp e , salary s
where e.id = s.emp_id and s.paytime like '%-07-%'
group by e.dep_id;

/* 查询编号为 emp2004 的员工的请假记录 */

select * from emp e , leave l
where e.id = l.emp_id and e.id = 'emp2004';


/* 查询各个员工2020-07-15号的考勤记录，按签出时间排序 */

select * from emp e , checkon c
where e.id = c.emp_id and convert(varchar , c.check_in_time , 23) = '2020-07-15'
order by c.check_out_time;



/* 更新 将所有部门的普通员工的基本工资改为6500 */

select emp_id , jiben from salary where emp_id in ( select e.id  from emp e , dep d where e.dep_id = d.id and e.id <> d.emp_id);

update salary set jiben=6500 where emp_id in (

	select e.id from  emp e , dep d
	where e.dep_id = d.id and e.id <> d.emp_id
	)

select emp_id , jiben from salary where emp_id in ( select e.id  from emp e , dep d where e.dep_id = d.id and e.id <> d.emp_id);




===触发器===
/* 当插入新数据到考勤表时，如果新数据的签出时间晚于19:00:00，在薪水表中给该员工的加班工资添加100元 */

create trigger T_inserttocheckon
on checkon
instead of insert
as
declare @checkouttime datetime
declare @empid varchar(10)
select @checkouttime = check_out_time , @empid = emp_id from inserted
if(convert(varchar , @checkouttime , 8) > '19:00:00')
begin
update salary set jiaban = jiaban+10  where emp_id = @empid
select * from salary where emp_id = @empid
end

go



/* 当插入新数据到请假表时，如果该员工当月请假次数已大于等于3次，则给该员工的当月工资扣除50元 */


create trigger T_inserttoleave
on leave
instead of insert
as
declare @num int
declare @empid varchar(10)
declare @leavestarttime datetime
select @empid = emp_id , @leavestarttime = leave_start_time from inserted;
select @num = count(emp_id) from leave where emp_id = @empid and datepart(m,leave_start_time) = datepart(m,@leavestarttime)
if(@num >=3)
begin
update salary set kouchu = kouchu + 50 where emp_id = @empid and datepart(m,paytime) = datepart(m,@leavestarttime)
end



===存储过程===


/* 参数a，给各部门领导添加a元奖金 */

create procedure P_addjiangjin
@jj money
as
begin
with a as ( select emp_id  from dep group by emp_id )
update salary set jiangjin = jiangjin + @jj where emp_id in (select * from a)
end

go

select emp_id , jiangjin from salary where emp_id in ( select emp_id from dep )
exec P_addjiangjin 200
select emp_id , jiangjin from salary where emp_id in ( select emp_id from dep )



/* 参数a，查询a部门的工资排序 */

create procedure P_querydepsal
@depid varchar(20)
as
begin
select e.id , e.name , s.jiben , s.jiangjin , s.jiaban , s.kouchu , (s.jiben + s.jiangjin + s.jiaban - s.kouchu) as actual from dep d , emp e , salary s
where e.id = s.emp_id and e.dep_id  = d.id and d.id = @depid
order by (s.jiben+s.jiangjin+s.jiaban-s.kouchu)
end

go

exec P_querydepsal 1
exec P_querydepsal 2
exec P_querydepsal 3



/* 查询实发工资在参数a和参数b之间的员工信息 */

create procedure P_querysalary
@a money ,
@b money
as
begin
	select * from emp e , V_emp_actualsalary ac where e.id = ac.id  and ac.actual_salary between @a and @b ;

end

go

exec P_querysalary 6900 , 8000
go


===用户及权限===
/* 创建普通员工用户 */
Create login GZ2020emp with PASSWORD=’123456’
GO
Create USER GZemp FOR LOGIN GZ2020emp
Go
/* 授权 */
GRANT SELECT ON checkon to GZemp
GRANT SELECT ON leave to GZemp
GRANT SELECT ON salary to GZemp
GO

/* 创建主管用户 */
Create login GZ2020man with PASSWORD=’123456’
GO
Create user GZman FOR LOGIN GZ2020man
GO

/* 授权 */
GRANT SELECT ON checkon to GZman
GRANT SELECT ON leave to GZman
GRANT SELECT ON salary to GZman
GRANT SELECT ON dep to GZman
GRANT SELECT ON emp to GZman
GO


/* 收回权限 */
REVOKE SELECT ON leave from GZemp





