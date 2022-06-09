create database 叮咚买菜外卖平台
ON
	( NAME =叮咚买菜外卖平台_data,
	  FILENAME = 'D:\叮咚买菜外卖平台_data.mdf',
	  SIZE=1MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
    ( NAME = 叮咚买菜外卖平台_log,
      FILENAME ='D:\叮咚买菜外卖平台_data.ndf',
      SIZE=1MB,
      MAXSIZE = 10MB,
      FILEGROWTH = 10%)

go

use 叮咚买菜外卖平台
go
create table 外卖类别(
类别ID int primary key,
类别名称 varchar(20) not null
)

go
create table 蔬果产品(
蔬果ID varchar(12) primary key,
蔬果名称 varchar(30) not null,
产地 varchar(20) ,
单价 float,
重量 varchar(20),
外卖类别 int
foreign key (外卖类别) references 外卖类别(类别ID)
)




go
create table 顾客(
顾客ID varchar(10) primary key,
姓名 varchar(20) not null,
年龄 int,
性别 varchar(2),
电话 varchar(11),
地址 text
)


go
create table 购物车条目(
顾客ID varchar(10),
蔬果ID varchar(12),
数量 int,
primary key (顾客ID, 蔬果ID),
foreign key (顾客ID)　references 顾客(顾客ID),
foreign key (蔬果ID) references 蔬果产品(蔬果ID)
)


go
create table 订单(
订单ID varchar(11) primary key,
下单时间 datetime,
订单金额 float,
预计送达时间 datetime,
配送时间 datetime,
送达时间 datetime,
顾客ID varchar(10),
foreign key (顾客ID)　references 顾客(顾客ID)
)



go
create table 订单条目(
订单ID varchar(11),
蔬果ID varchar(12),
数量 int,
折扣 float not null,
primary key (订单ID,蔬果ID),
foreign key (订单ID) references 订单(订单ID),
foreign key (蔬果ID) references 蔬果产品(蔬果ID)
)




go



insert into 外卖类别 values (1,'叶菜');
insert into 外卖类别 values (2,'茄果瓜');
insert into 外卖类别 values (3,'根茎');
insert into 外卖类别 values (4,'豆制品');
insert into 外卖类别 values (5,'菌菇');
insert into 外卖类别 values (6,'水果');



insert into 蔬果产品 values ('SC011001','白菜','河北','15','1000g',1);
insert into 蔬果产品 values ('SC011002','番茄','山东','16','1000g',2);
insert into 蔬果产品 values ('SC011003','莲藕','山东','17','1000g',3);
insert into 蔬果产品 values ('SC011004','豆腐','山东','18','1000g',4);
insert into 蔬果产品 values ('SC011005','苹果','山东','19','1000g',5);
insert into 蔬果产品 values ('SC011006','生菜','山东','10','500g',1);
insert into 蔬果产品 values ('SC011007','茄子','山东','12','500g',2);
insert into 蔬果产品 values ('SC011008','土豆','北京','15','500g',3);
insert into 蔬果产品 values ('SC011009','豆皮','北京','20','500g',4);
insert into 蔬果产品 values ('SC011010','西瓜','北京','25','2000g',5);
insert into 蔬果产品 values ('SC011011','菠菜','北京','20','500g',1);
insert into 蔬果产品 values ('SC011012','西葫芦','河南','15','400g',2);
insert into 蔬果产品 values ('SC011013','红薯','河北','40','2000g',3);
insert into 蔬果产品 values ('SC011014','葡萄','新疆','40','500g',5);


insert into 顾客 values ('GK0001','顾客01',20,'女','1880001234','XX市XX区XX街道11号');
insert into 顾客 values ('GK0002','顾客02',21,'女','1880001221','XX市XX区XX街道12号');
insert into 顾客 values ('GK0003','顾客03',22,'男','1880001222','XX市XX区XX街道13号');
insert into 顾客 values ('GK0004','顾客04',23,'男','1880001223','XX市XX区XX街道14号');
insert into 顾客 values ('GK0005','顾客05',24,'男','1880001224','XX市XX区XX街道15号');
insert into 顾客 values ('GK0006','顾客06',25,'男','1880001225','XX市XX区XX街道16号');
insert into 顾客 values ('GK0007','顾客07',26,'男','1880001231','XX市XX区XX街道17号');
insert into 顾客 values ('GK0008','顾客08',27,'女','1880001232','XX市XX区XX街道18号');
insert into 顾客 values ('GK0009','顾客09',28,'女','1880001233','XX市XX区XX街道19号');
insert into 顾客 values ('GK0010','顾客10',29,'女','1880001234','XX市XX区XX街道11号');
insert into 顾客 values ('GK0011','顾客11',20,'男','1880001235','XX市XX区XX街道12号');
insert into 顾客 values ('GK0012','顾客11',31,'男','1880001236','XX市XX区XX街道13号');
insert into 顾客 values ('GK0013','顾客12',31,'女','1880001237','XX市XX区XX街道14号');
insert into 顾客 values ('GK0014','顾客13',32,'女','1880001238','XX市XX区XX街道15号');




insert into 购物车条目 values ('GK0001','SC011001',1);
insert into 购物车条目 values ('GK0002','SC011002',2);
insert into 购物车条目 values ('GK0003','SC011003',3);
insert into 购物车条目 values ('GK0004','SC011004',4);
insert into 购物车条目 values ('GK0005','SC011005',5);
insert into 购物车条目 values ('GK0006','SC011006',6);
insert into 购物车条目 values ('GK0007','SC011007',7);
insert into 购物车条目 values ('GK0008','SC011008',8);
insert into 购物车条目 values ('GK0009','SC011009',1);
insert into 购物车条目 values ('GK0010','SC011010',1);
insert into 购物车条目 values ('GK0011','SC011011',2);
insert into 购物车条目 values ('GK0012','SC011012',3);
insert into 购物车条目 values ('GK0013','SC011013',4);
insert into 购物车条目 values ('GK0014','SC011014',5);
insert into 购物车条目 values ('GK0001','SC011002',6);
insert into 购物车条目 values ('GK0002','SC011003',1);
insert into 购物车条目 values ('GK0003','SC011004',2);
insert into 购物车条目 values ('GK0004','SC011005',3);
insert into 购物车条目 values ('GK0005','SC011006',4);
insert into 购物车条目 values ('GK0006','SC011002',5);
insert into 购物车条目 values ('GK0007','SC011003',6);
insert into 购物车条目 values ('GK0008','SC011004',7);
insert into 购物车条目 values ('GK0009','SC011005',8);


insert into 订单 values('D0001','2022-05-01 10:00:00',null, null, '2022-05-01 11:00:00', '2022-05-01 11:30:00','GK0007');
insert into 订单 values('D0002','2022-05-02 10:00:00',null, null, '2022-05-02 11:00:00', '2022-05-02 11:30:00','GK0008');
insert into 订单 values('D0003','2022-05-03 10:00:00',null, null, '2022-05-04 10:00:00', '2022-05-04 10:30:00','GK0009');
insert into 订单 values('D0004','2022-06-04 10:00:00',null, null, '2022-06-05 10:00:00', '2022-06-05 10:30:00','GK0010');
insert into 订单 values('D0005','2022-06-05 10:00:00',null, null, '2022-06-06 10:00:00', '2022-06-06 10:30:00','GK0011');
insert into 订单 values('D0006','2022-06-06 11:00:00',null, null, '2022-06-06 12:00:00', '2022-06-06 12:30:00','GK0012');
insert into 订单 values('D0007','2022-06-07 12:00:00',null, null, '2022-06-07 13:00:00', '2022-06-07 13:30:00','GK0013');
insert into 订单 values('D0008','2022-06-08 13:00:00',null, null, '2022-06-08 14:00:00', '2022-06-08 14:40:00','GK0013');
insert into 订单 values('D0009','2022-05-09 14:00:00',null, null, '2022-05-09 15:00:00', '2022-05-09 15:40:00','GK0001');
insert into 订单 values('D0010','2022-05-10 15:00:00',null, null, '2022-05-10 16:00:00', '2022-05-10 16:40:00','GK0002');
insert into 订单 values('D0011','2022-05-11 16:00:00',null, null, '2022-05-11 17:00:00', '2022-05-11 17:40:00','GK0003');
insert into 订单 values('D0012','2022-05-12 17:00:00',null, null, '2022-05-12 19:00:00', '2022-05-12 19:40:00','GK0004');
insert into 订单 values('D0013','2022-05-13 18:00:00',null, null, '2022-05-13 20:00:00', '2022-05-13 20:40:00','GK0005');
insert into 订单 values('D0014','2022-05-14 11:00:00',null, null, '2022-05-14 13:00:00', null,'GK0006');
insert into 订单 values('D0015','2022-05-15 11:00:00',null, null, '2022-05-15 13:00:00', '2022-05-15 13:40:00','GK0007');




insert into 订单条目 values('D0001','SC011001',2, 1);
insert into 订单条目 values('D0001','SC011002',2, 1);
insert into 订单条目 values('D0002','SC011003',3, 1);
insert into 订单条目 values('D0002','SC011004',4, 1);
insert into 订单条目 values('D0003','SC011005',5, 1);
insert into 订单条目 values('D0003','SC011006',6, 1);
insert into 订单条目 values('D0003','SC011007',1, 1);
insert into 订单条目 values('D0003','SC011008',1, 1);
insert into 订单条目 values('D0004','SC011009',1, 1);
insert into 订单条目 values('D0004','SC011010',1, 1);
insert into 订单条目 values('D0005','SC011011',1, 1);
insert into 订单条目 values('D0006','SC011012',5, 1);
insert into 订单条目 values('D0007','SC011013',5, 1);
insert into 订单条目 values('D0008','SC011014',5, 1);
insert into 订单条目 values('D0009','SC011001',5, 1);
insert into 订单条目 values('D0010','SC011002',5, 1);
insert into 订单条目 values('D0011','SC011003',5, 1);
insert into 订单条目 values('D0012','SC011004',3, 1);
insert into 订单条目 values('D0013','SC011005',3, 1);
insert into 订单条目 values('D0014','SC011006',3, 1);
insert into 订单条目 values('D0015','SC011007',3, 1);

go


-- 修改
-- 1. 修改所有的订单信息的预计送达时间为下单后24小时
go
update 订单 set 预计送达时间=dateadd("day",1,下单时间)

-- 2. 修改订单条目中订单尾号为奇数的订单折扣为0.9
go
update 订单条目 set 折扣=0.9 where convert(int,right(订单ID,1))%2=1

-- 删除操作
-- 删除订单D0015的订单信息和订单条目信息
go
delete from 订单条目 where 订单ID='D0015'
go
delete from 订单 where 订单ID='D0015'



-- --查询类操作

-- 单表查询
-- 1. 查询叮咚买菜的所有产品信息
go
select * from 蔬果产品

-- 2. 查询所有订单信息

go
select * from 订单


-- 条件查询
-- 3. 查询价格在15-20范围内的蔬果产品信息
    -- between...and ...范围查询
go
select 蔬果ID,蔬果名称,产地, 单价,重量
from 蔬果产品
where 单价 between 15 and 20;

-- 4. 查询蔬果产品中包含'菜'的叶菜信息,并按照价格排序
    -- like
    -- 多重条件
    -- order by
go
select s.*, lb.类别名称
from 蔬果产品  s
join 外卖类别 lb on s.外卖类别=lb.类别ID
where lb.类别名称='叶菜类' and s.蔬果名称 like '%菜%'
order by s.单价

-- 5. 查询没有收到订单的信息
    -- null 条件
go
select *
from 订单
where 送达时间 is null

-- 连接查询
-- 4. 查询叮咚买菜平台所售卖的蔬果信息及其所属类别
    --等值连接查询
go
select s.*, lb.类别名称
from 蔬果产品 s
join 外卖类别 lb on s.外卖类别=lb.类别ID

-- 5. 查询价格比西瓜便宜的所有蔬果产品信息
    -- 自连接、非等值连接查询
    -- 比较大小<
go
select s1.*
from 蔬果产品 s1
join 蔬果产品 s2
on s1.单价<s2.单价
where s2.蔬果名称='西瓜'

-- 6.查询所有的顾客购买的订单蔬果信息，包含从未购买的顾客信息
    --外连接(左外连接)
go
select g.*, s.蔬果名称
from 顾客 g
left join 订单 d on g.顾客ID=g.顾客ID
left join 订单条目 dt on d.订单ID=dt.订单ID
left join 蔬果产品 s on s.蔬果ID=dt.蔬果ID

-- 7.

-- 嵌套查询
-- 7 查询购买了来自苹果和白菜的产地所生产的蔬果信息的顾客和购买总件数、购买总价,筛选购买总价大于等于500的
    -- IN子查询
    -- join 连接
    -- 聚集函数sum
    -- group by
    -- having
go
select g.姓名, sum(dt.数量) as 购买总件数, sum(s.单价*dt.数量*dt.折扣) as  购买总价
from 订单 d
join 顾客 g on g.顾客ID=g.顾客ID
join 订单条目 dt on d.订单ID=dt.订单ID
join 蔬果产品 s on s.蔬果ID=dt.蔬果ID
where s.产地 in (select distinct 产地 from 蔬果产品 where 蔬果名称 in ('苹果','白菜'))
group by g.姓名
having sum(s.单价*dt.数量*dt.折扣)>=500

-- 9 - 查询购买的蔬果数量比所有购买过叶菜类顾客的平均购买数量大的顾客信息，以及他购买过的蔬果信息
    -- all 子查询
    -- group by
    -- join 连接
    -- having 子句
    -- 聚合函数
go
select g.姓名
from 顾客 g
join 订单 d on g.顾客ID=d.顾客ID
join 订单条目 dt on d.订单ID=dt.订单ID
join 蔬果产品 s on s.蔬果ID=dt.蔬果ID
group by g.姓名
having sum(dt.数量)>
all
(
select sum(dt.数量) / count(d.订单ID) as avg_num
from 顾客 g
join 订单 d on g.顾客ID=d.顾客ID
join 订单条目 dt on d.订单ID=dt.订单ID
join 蔬果产品 s on s.蔬果ID=dt.蔬果ID
join 外卖类别 lb on s.外卖类别=lb.类别ID
where lb.类别名称='叶菜类'
group by g.顾客ID
)


-- 9 - 查询购买的蔬果数量比所有购买过叶菜类顾客的平均购买数量大的顾客信息，以及他购买过的蔬果信息
    -- any 子查询
go
select g.姓名
from 顾客 g
join 订单 d on g.顾客ID=d.顾客ID
join 订单条目 dt on d.订单ID=dt.订单ID
join 蔬果产品 s on s.蔬果ID=dt.蔬果ID
group by g.姓名
having sum(dt.数量)>
any
(
select sum(dt.数量) / count(d.订单ID) as avg_num
from 顾客 g
join 订单 d on g.顾客ID=d.顾客ID
join 订单条目 dt on d.订单ID=dt.订单ID
join 蔬果产品 s on s.蔬果ID=dt.蔬果ID
join 外卖类别 lb on s.外卖类别=lb.类别ID
where lb.类别名称='叶菜类'
group by g.顾客ID
)

-- 10 查询比苹果售价高的所有蔬果信息 和所属类别
    -- 带有比较范围的子查询
select s.*, lb.类别名称
from 蔬果产品 s
join 外卖类别 lb on s.外卖类别=lb.类别ID
where s.单价>(select 单价 from 蔬果产品 where 蔬果名称='苹果')

--



