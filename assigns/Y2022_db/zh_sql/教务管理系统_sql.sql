
use 教务管理
go

-- 查询

select [课程编号], [课程名称], [学分]
from [课程]
go

-- (2)
select [学号], [课程编号], [成绩]
from [成绩]
go


-- (3)
select k.[课程编号],k.[课程名称], avg(c.[成绩])
from [成绩] c
join [课程] k on c.[课程编号]=k.[课程编号]
group by k.[课程编号],k.[课程名称]
go


-- (4)
select j.[职工编号], j.[姓名],k.[课程名称]
from [课程] k
join [授课] s on s.[课程编号]=k.[课程编号]
join [教师] j on s.[职工编号]=j.[职工编号]
go

-- (5)
select x.[学号], x.[姓名],k.[课程名称], c.[成绩]
from [成绩] c
join [课程] k on c.[课程编号]=k.[课程编号]
join [学生] x on x.[学号]=c.[学号]

go

-- 函数
create function getSpecialityName(@speciality varchar(10)) returns varchar(30)
as
begin
declare @sname varchar(30)
select @sname=
(
select [专业名]
from [专业]
where [专业号]=@speciality
)
return @sname
end
go

declare @sname varchar(30)
select @sname=dbo.getSpecialityName('Z001')
select @sname
go


create function getScore(@cno varchar(10)) returns table
as
return
    (
    select 学号,课程编号,成绩
    from [成绩]
    where [课程编号]=@cno
    )
go

select * from getScore('C001')
go

-- 存储过程
create procedure getCourseInfo01(@name varchar(30))
as
begin
select k.[课程编号],k.[课程名称]
from [选课] c
join [课程] k on c.[课程编号]=k.[课程编号]
join [学生] x on x.[学号]=c.[学号]
where x.[姓名]=@name;
end
go

exec getCourseInfo01 @name='赵四'
go

create procedure getCourseInfo02(@cno varchar(10), @credit int output, @total int output)
as
begin
select @credit=[学分],@total=[总课时]
from [课程]
where [课程编号]=@cno;
end
go


declare @credit int
declare @total int
exec getCourseInfo02 'C001',@credit output, @total output

select @credit,@total
go


-- 触发器
create trigger student_insert
    on [学生] after insert
    as
    begin
    declare @msg varchar(30)
    set @msg='已成功插入记录'
    print @msg
    end
go

create trigger database_ddl
    on database
    after drop_table, alter_table
    as
    print '不能删除或修改表'
    rollback transaction


-- 创建用户
create login SQLUser01
with password='abc@123',
 default_database=[教务管理]
go

create user jwdb_user01
for login SQLUser01
with default_schema=dbo
go

-- 创建角色
create role role_成绩01
go

exec sp_addrolemember 'role_成绩01','jwdb_user01'
go

grant insert, update, select, delete on 学生
to jwdb_user01
go