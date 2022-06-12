


create database 停车管理
go
use 停车管理
go
create table 用户(
ID int primary key,
用户名 varchar(20) not null,
姓名 varchar(20) not null,
密码 varchar(20) not null ,
用户类别 varchar(20) check ( 用户类别 in ('业主','临时用户') ),
手机号  varchar(11)
);
create table 停车场(
ID int primary key ,
停车场名称 varchar(20) not null,
地点 varchar(50)
);
create table 停车位(
车位号 char(10) primary key ,
地点 varchar(50),
月租价格 int,
收费单价 int,
车场ID int,
用户ID int,
foreign key (用户ID) references 用户(ID),
foreign key (车场ID) references 停车场(ID)
);
create table 临时停车(
临时停车ID int primary key ,
用户ID int,
车位号 char(10),
停车时长 int,
价格 int,
foreign key (用户ID) references 用户(ID),
foreign key (车位号) references 停车位(车位号)
);

create table 租用车位(
租用ID int primary key ,
用户ID int,
车位号 char(10),
租用开始时间 date,
租用结束时间 date,
foreign key (用户ID) references 用户(ID),
foreign key (车位号) references 停车位(车位号)
);


create table 通知(
ID int primary key,
标题 varchar(100),
内容 text
);


create table 管理员(
ID int primary key ,
管理员用户名 varchar(20),
管理员类别 varchar(20)
);



insert into 用户 values(1,'user1','李白','@WSX1QAZ','业主','1324562369');

update 用户 set 手机号='14785236985' where ID=1;

delete from 用户 where ID=1;


-- 查询
-- 查询所有的临时停车记录
select * from 临时停车;

-- 查询一共有多少个停车位
select count(*) from 停车位;

-- 查询在2022年6月至7月租用车位的记录
select * from 租用车位 where 租用开始时间 between '2022-06-01' and '2022-07-01';

-- 查询姓名为AA的用户
select * from 用户 where 姓名='AA';

-- 查询所有的用户租用车位情况，列出用户ID，姓名和租用开始时间
select t2.ID,t2.姓名, t1.车位号, t1.租用开始时间
from 租用车位 t1
join 用户 t2 on t1.用户ID = t2.ID;


-- 查询每次临时停车的计费单价和总价
select t2.姓名, t3.车位号, t3.收费单价, t1.停车时长* t3.收费单价 as 总价
from 临时停车 t1
join 用户 t2 on t1.用户ID = t2.ID
join 停车位 t3 on t1.车位号 = t3.车位号;


-- 查询租用次数大于2次且临时停车且总停车的总价大于100元的用户姓名
select t2.姓名,  sum(t1.停车时长* t3.收费单价) as 总价
from 临时停车 t1
join 用户 t2 on t1.用户ID = t2.ID
join 停车位 t3 on t1.车位号 = t3.车位号
group by t2.姓名
having  sum(t1.停车时长* t3.收费单价) >100 and count(t1.临时停车ID)>2;

-- 查询从没有临时停车的用户信息

select *
from 用户
where ID not in (select distinct 用户ID from 临时停车);


-- 创建存储过程根据给定的用户信息，查询他的租用车位情况

create procedure getCourseInfo01(@name varchar(30))
as
begin
select t2.ID,t2.姓名, t1.车位号, t1.租用开始时间
from 租用车位 t1
join 用户 t2 on t1.用户ID = t2.ID
where t2.[姓名]=@name;
end
go

exec getCourseInfo01 @name='张三'
go


-- 创建触发器 当向临时停车表中插入一条记录时，输出已成功插入记录
create trigger linshi_insert
    on [临时停车] after insert
    as
    begin
    declare @msg varchar(30)
    set @msg='已成功插入记录'
    print @msg
    end
go


-- 创建视图-租用次数大于2次且临时停车且总停车的总价在100~200元的用户姓名和总价
create view v1
as
select t2.ID, t2.姓名, sum(t1.停车时长* t3.收费单价) as 总价
from 临时停车 t1
join 用户 t2 on t1.用户ID = t2.ID
join 停车位 t3 on t1.车位号 = t3.车位号
group by  t2.ID,t2.姓名
having  sum(t1.停车时长* t3.收费单价) between 100 and 200 and count(t1.临时停车ID)>2;


-- 创建视图，列出所有使用了临时停车并租用过车位的用户和临时或租用的车位号
create view v2
as
select t2.姓名,t1.车位号
from 临时停车 t1
join 用户 t2 on t1.用户ID = t2.ID
intersect
select t2.姓名,t1.车位号
from 租用车位 t1
join 用户 t2 on t1.用户ID = t2.ID