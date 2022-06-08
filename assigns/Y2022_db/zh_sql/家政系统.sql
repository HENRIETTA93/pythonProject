create database 家政系统;

use 家政系统;



create table 会员(
会员ID int primary key,
登陆密码 varchar(20) not null,
姓名 varchar(20),
手机号 varchar(11) unique,
地址 varchar(50),
账号状态 varchar(4)
);

create table 阿姨(
阿姨ID int primary key,
登陆密码 varchar(20) not null,
姓名 varchar(20),
手机号 varchar(11) unique,
地址 varchar(50)
);

create table 请假(
请假ID int primary key,
阿姨ID int,
开始时间 date,
结束时间 date,
事由 text
);

create table 订单类型(
类型ID int primary key,
类型名称 varchar(20) unique,
价格 decimal(5,2)
);

create table 订单(
订单ID int primary key,
订单类型 int,
预约时间 date,
订单状态 varchar(10),
预约会员 int,
服务阿姨 int,
服务开始时间 datetime,
服务结束时间 datetime,
结算价格 decimal(5,2)
);

create table 评价(
订单ID int primary key,
评分 int,
评价内容 text,
评价时间 datetime
);

alter table 请假 add constraint fk_dayoff foreign key (阿姨ID) references 阿姨(阿姨ID);
alter table 订单 add constraint fk_ordertype foreign key (订单类型) references 订单类型(类型ID);
alter table 订单 add constraint fk_member foreign key (预约会员) references 会员(会员ID);
alter table 订单 add constraint fk_aunt foreign key (服务阿姨) references 阿姨(阿姨ID);
alter table 评价 add constraint fk_order foreign key (订单ID) references 订单(订单ID);

alter table 会员 add constraint chk_state check(账号状态 in ('正常','锁定'));
alter table 订单 add constraint chk_order check(订单状态 in ('已下单','已取消','已完成'));

--==
insert into 会员 values (1,'123456','王小非','1352478965','北京XXX社区','正常');
insert into 会员 values (2,'356781','张大郎','1353254522','上海AAA社区','正常');
insert into 会员 values (3,'abcdef','古爱零','1353254523','广州BBB社区','正常');
insert into 会员 values (4,'246801','张三三','1353254524','北京BBB社区','正常');
insert into 会员 values (5,'fffdff','李思思','1353254525','上海BBB社区','正常');
insert into 会员 values (6,'fdfdds','李小明','1351117411','广州AAA社区','正常');
insert into 会员 values (7,'sssdds','王小化','1351117412','北京AAA社区','正常');
insert into 会员 values (8,'ffadff','刘姥姥','1351117413','上海AAA社区','正常');
insert into 会员 values (9,'234523','李小莉','1351117414','广州AAA社区','锁定');

insert into 阿姨 values (1,'123456','阿姨A','13874562131','北京');
insert into 阿姨 values (2,'123456','阿姨B','13874562132','北京');
insert into 阿姨 values (3,'123456','阿姨C','13874562133','北京');
insert into 阿姨 values (4,'123456','阿姨D','13874562134','上海');
insert into 阿姨 values (5,'356781','阿姨E','13874562135','上海');
insert into 阿姨 values (6,'abcdef','阿姨F','13874562136','广州');
insert into 阿姨 values (7,'246801','阿姨G','13874562137','广州');
insert into 阿姨 values (8,'fffdff','阿姨H','13874562138','上海');
insert into 阿姨 values (9,'fdfdds','阿姨I','13874562139','北京');



insert into 请假 values (1,1,'2022-01-10','2022-01-11','家里有事');
insert into 请假 values (2,1,'2022-02-10','2022-02-11','接孩子放学');
insert into 请假 values (3,1,'2022-02-15','2022-02-17','家里有事');
insert into 请假 values (4,2,'2022-02-10','2022-02-11','家里有事');
insert into 请假 values (5,2,'2022-05-10','2022-05-11','家里有事');
insert into 请假 values (6,2,'2022-05-15','2022-05-16','回家探望父母');
insert into 请假 values (7,1,'2022-05-10','2022-05-11','家里有事');
insert into 请假 values (8,1,'2022-04-10','2022-04-11','生病');
insert into 请假 values (9,1,'2022-04-10','2022-04-11','家里有事');


insert into 订单类型 values (1,'日常保洁',100);
insert into 订单类型 values (2,'大扫除',200);
insert into 订单类型 values (3,'真皮沙发保养',200);
insert into 订单类型 values (4,'地板打蜡',150);


insert into 订单 values (1,1,'2022-04-20','已完成',1,2,'2022-04-20 10:00:00','2022-04-20 11:00:00',null);
insert into 订单 values (2,2,'2022-04-21','已完成',3,2,'2022-04-21 10:00:00','2022-04-21 11:00:00',null);
insert into 订单 values (3,3,'2022-05-22','已完成',4,2,'2022-05-22 10:00:00','2022-05-22 11:00:00',null);
insert into 订单 values (4,4,'2022-05-23','已完成',5,1,'2022-05-23 10:00:00','2022-05-23 11:00:00',null);
insert into 订单 values (5,1,'2022-05-24','已完成',6,4,'2022-05-24 10:00:00','2022-05-24 11:00:00',null);
insert into 订单 values (6,2,'2022-05-22','已完成',7,5,'2022-05-22 10:00:00','2022-05-22 11:00:00',null);
insert into 订单 values (7,3,'2022-05-21','已完成',1,6,'2022-05-21 10:00:00','2022-05-21 11:00:00',null);
insert into 订单 values (8,3,'2022-05-22','已完成',2,7,'2022-05-22 10:00:00','2022-05-22 11:00:00',null);
insert into 订单 values (9,3,'2022-05-23','已完成',3,1,'2022-05-23 10:00:00','2022-05-23 11:00:00',null);


insert into 订单 values (10,1,'2022-03-21','已完成',1,2,'2022-03-21 10:00:00','2022-03-21 11:00:00',null);
insert into 订单 values (11,1,'2022-03-20','已完成',1,3,'2022-03-20 10:00:00','2022-03-20 11:00:00',null);
insert into 订单 values (12,2,'2022-03-21','已完成',3,2,'2022-03-21 10:00:00','2022-03-21 11:00:00',null);
insert into 订单 values (13,3,'2022-04-22','已完成',4,4,'2022-04-22 10:00:00','2022-04-22 11:00:00',null);
insert into 订单 values (14,4,'2022-04-23','已完成',5,8,'2022-04-23 10:00:00','2022-04-23 11:00:00',null);
insert into 订单 values (15,1,'2022-04-24','已完成',6,4,'2022-04-24 10:00:00','2022-04-24 11:00:00',null);
insert into 订单 values (16,2,'2022-04-22','已完成',7,5,'2022-04-22 10:00:00','2022-04-22 11:00:00',null);
insert into 订单 values (17,3,'2022-05-11','已完成',1,6,'2022-05-11 10:00:00','2022-05-11 11:00:00',null);
insert into 订单 values (18,3,'2022-05-12','已完成',2,7,'2022-05-12 10:00:00','2022-05-12 11:00:00',null);
insert into 订单 values (19,3,'2022-05-31','已下单',3,9,null,null,null);

insert into 评价 values (1,8,'很好',getdate());
insert into 评价 values (3,10,'非常好',getdate());
insert into 评价 values (4,7,'很不错',getdate());
insert into 评价 values (5,7,'很好',getdate());
insert into 评价 values (6,7,'很好',getdate());
insert into 评价 values (2,9,'很好',getdate());
insert into 评价 values (11,7,'很好',getdate());
insert into 评价 values (12,5,'很好',getdate());
insert into 评价 values (13,4,'服务不是很好',getdate());



--

update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=1) where 订单ID=1;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=2) where 订单ID=2;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=3) where 订单ID=3;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=4) where 订单ID=4;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=5) where 订单ID=5;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=6) where 订单ID=6;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=7) where 订单ID=7;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=8) where 订单ID=8;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=9) where 订单ID=9;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=10) where 订单ID=10;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=11) where 订单ID=11;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=12) where 订单ID=12;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=13) where 订单ID=13;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=14) where 订单ID=14;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=15) where 订单ID=15;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=16) where 订单ID=16;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=17) where 订单ID=17;
update 订单 set 结算价格 =DATEDIFF("hh",服务开始时间,服务结束时间)*(select 价格 from 订单类型 a join 订单 b on a.类型ID=b.订单类型 where 订单ID=18) where 订单ID=18;


--
delete from 评价;
delete from 订单 where 订单ID=1;


-- ==

-- １.	题目：查询地点在北京的会员下单的订单号，订单状态和会员信息，不包含已取消的订单信息。
-- 代码：
--
-- 思路：
-- 该查询题目包含：
-- ２.	题目：查询服务过3个以上会员的阿姨的信息，按照服务总会员数倒序排列，并按照阿姨的姓名升序排列。
-- 代码：
--
-- 思路：
-- 该查询题目包含：
--
-- ３.	题目：查询下过５次订单以上的会员信息，按照总价倒序排列。
-- 代码：
--
-- 思路：
-- 该查询题目包含：
-- ４.	题目：查询在２０２２年请假次数超过３次的阿姨信息。
-- 代码：
--
-- 思路：
-- 该查询题目包含：
-- ５.	题目：查询从未请假的以及收到的评分大于5的阿姨信息。
-- 代码：
--
-- 思路：
-- 该查询题目包含：

select b.*,a.订单ID, a.订单状态
from 订单 a
join 会员 b
on a.预约会员=b.会员ID
and b.地址 like '%北京%'
and a.订单状态 !='已取消';

select b.阿姨ID, b.姓名, count(distinct a.预约会员) as 服务会员人数
from 订单 a
join 阿姨 b on a.服务阿姨=b.阿姨ID
group by b.阿姨ID, b.姓名
having count(distinct a.预约会员)>=2
order by count(distinct a.预约会员) desc, b.姓名 asc;



select b.会员ID, b.姓名, sum(a.结算价格) as 总价
from 订单 a
join 会员 b
on a.预约会员=b.会员ID
group by b.会员ID, b.姓名
having count(a.订单ID)>=5
order by sum(a.结算价格) desc;


select a.阿姨ID,a.姓名, a.手机号
from 阿姨 a
join 请假 b on a.阿姨ID=b.阿姨ID
where 开始时间 between '2022-01-01' and '2022-12-31'
group by a.阿姨ID,a.姓名, a.手机号
having count(b.请假ID)>=3;


select t2.*
from
(
select t.阿姨ID, t.姓名
from 阿姨 t
where t.阿姨ID not in (select distinct 请假.阿姨ID from 请假)
) t1,
(
select b.阿姨ID, b.姓名,avg(c.评分) as 平均评分
from 订单 a
join 阿姨 b on a.服务阿姨=b.阿姨ID
join 评价 c on a.订单ID = c.订单ID
group by b.阿姨ID, b.姓名
having avg(c.评分)>5
) t2 where t1.阿姨ID=t2.阿姨ID;



--
create view vw_订单
as
select a.订单ID, b.姓名 as 会员, c.姓名 as 阿姨, d.类型名称
from 订单 a
join 会员 b on a.预约会员=b.会员ID
join 阿姨 c on a.服务阿姨=c.阿姨ID
join 订单类型 d on a.订单类型=d.类型ID;

select * from vw_订单;


create index idx_ayiphone on 阿姨(手机号);

create index idx_hyphone on 会员(手机号);


-- ==
exec sp_addrole role1;

grant select on vw_订单 to role1;