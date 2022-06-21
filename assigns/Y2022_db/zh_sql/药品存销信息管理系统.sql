create database 药品存销信息管理系统
ON
	( NAME =药品存销信息管理系统_data,
	  FILENAME = 'D:\药品存销信息管理系统_data.mdf',
	  SIZE=1MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
    ( NAME = 药品存销信息管理系统_log,
      FILENAME ='D:\药品存销信息管理系统_data.ldf',
      SIZE=1MB,
      MAXSIZE = 10MB,
      FILEGROWTH = 10%)

go

use 药品存销信息管理系统
go

create table 员工(
工号 int primary key,
姓名 varchar(20) not null,
性别 varchar(2) not null,
年龄 int,
学历 varchar(20),
职务 varchar(20)
);
go
alter table 员工 add constraint chk_sex check(性别 in ('男','女'));
go
insert into 员工 values (1,'李冰冰','女',45,'本科','销售');
insert into 员工 values (2,'大张伟','男',40,'本科','仓库管理');
insert into 员工 values (3,'杨幂','女',31,'本科','仓库管理');
insert into 员工 values (4,'王思聪','男',35,'硕士','售前咨询');
insert into 员工 values (5,'张靓颖','女',35,'硕士','销售');
insert into 员工 values (6,'周杰伦','男',35,'硕士','销售');
go
create table 药品(
药品编号 int primary key,
药品名称 varchar(20) not null,
生产厂家 varchar(50),
生产日期 date,
保质期 int,
用途 varchar(30),
价格 int,
数量 int,
经手人 int
);

alter table 药品 add constraint fk_jingshou foreign key (经手人) references 员工(工号);
go
insert into 药品 values (101,'六味地黄丸','江苏制药', getdate(),180,'解毒',20,20, 2);
insert into 药品 values (102,'黄芪','山东中药制药','2022-04-29',365,'降火',32,100,1);
insert into 药品 values (103,'三黄片','江苏中药局','2022-04-29',360,'降火',3 ,100,3);
insert into 药品 values (104,'解毒丸','浙江草药局','2022-04-29',360,'解毒',15,100,1);
insert into 药品 values (105,'止痛丸','安徽中药局','2022-04-29',360,'止痛',20,100,4);
insert into 药品 values (106,'金银花','河南中药局','2022-04-29',360,'解暑',12,100,1);
go
create table 客户(
客户编号 int primary key,
姓名 varchar(20) not null,
联系方式 varchar(11)
);
go
insert into 客户 values(201, '张晓北','132457852');
insert into 客户 values(202, '张一北','132457252');
insert into 客户 values(203, '张二北','133457353');
insert into 客户 values(204, '张三北','134457454');
insert into 客户 values(205, '张四北','135457555');
insert into 客户 values(206, '张五北','136457656');
go
create table 购买(
购买编号 int primary key,
客户编号 int,
药品编号 int,
购买时间 date,
销售员 int,
数量 int
);
go
alter table 购买 add constraint fk_kehu foreign key (客户编号) references 客户(客户编号);
alter table 购买 add constraint fk_yaopin foreign key (药品编号) references 药品(药品编号);
alter table 购买 add constraint fk_xiaoshou foreign key (销售员) references 员工(工号);
go
insert into 购买 values(1,201, 104,getdate(),1, 2);
insert into 购买 values(2,201, 101,getdate(),2, 1);
insert into 购买 values(3,201, 102,getdate(), 1,1);
insert into 购买 values(4,202, 103,'2022-06-19', 2,2);
insert into 购买 values(5,203, 104,'2022-06-19', 3,5);
insert into 购买 values(6,204, 105,'2022-06-19', 4,5);
insert into 购买 values(7,205, 106,'2022-06-19', 4,5);
insert into 购买 values(8,206, 102,'2022-06-19', 2,4);
insert into 购买 values(9,202, 104,'2022-06-19', 3,4);
insert into 购买 values(10,201, 103,getdate(), 3,2);

go
create table 入库信息(
入库编号 int primary key,
药品编号 int not null,
入库日期 date not null default (getdate()),
入库位置 varchar(20),
入库数量 int not null,
constraint fk_yaopinrk foreign key (药品编号) references 药品(药品编号)
);

go
insert into 入库信息 values (101001,101,'2022-06-07','位置1',20);
insert into 入库信息 values (101002,101,'2022-06-07','位置1',10);
insert into 入库信息 values (102001,102,'2022-06-07','位置2',15);
insert into 入库信息 values (103001,103,'2022-06-17','位置3',26);
insert into 入库信息 values (104001,104,'2022-06-17','位置4',28);
insert into 入库信息 values (105001,105,'2022-06-17','位置5',20);
insert into 入库信息 values (106001,106,'2022-06-17','位置6',200);


go
create table 出库信息(
出库编号 int not null,
药品编号 int not null,
数量 int not null,
出库日期 date not null default (getdate()),
primary key(出库编号),
constraint fk_yaopinck foreign key (药品编号) references 药品(药品编号)
);



go
insert into 出库信息 values (101001,101,30,getdate());
insert into 出库信息 values (101002,102,35,getdate());
insert into 出库信息 values (101003,103,32,getdate());
insert into 出库信息 values (102001,101,15,getdate());
insert into 出库信息 values (103001,104,20,getdate());

-- 创建触发器，当药品入库时，同时更新药品的数量。
go
create trigger trig_update_yaopin
on 入库信息
after insert
as
begin
declare @yaopin int
declare @num int
select @yaopin=药品编号,@num=入库数量 from inserted
update 药品 set 数量=数量+@num where 药品编号=@yaopin

end


-- 创建触发器，当药品被销售出去时，统计出库数据。
go
create trigger trig_update_chuku
on 购买
after insert
as
begin
declare @yaopin int
declare @num int
declare @chuku int
select @yaopin=药品编号,@num=数量 from inserted
select @chuku=max(出库编号)+1 from 出库信息
insert into 出库信息 values (@chuku,@yaopin,@num, getdate())

end



/* 分析一：创建员工与其所销售的药品的数量和时间 */
go
create view xiaoshou_view
as
select t1.*, t2.数量,t2.购买时间
from 员工 t1, 购买 t2
where t1.工号=t2.销售员;
go
select * from xiaoshou_view;

/* 分析二：创建入库药品的详细信息视图 */

go
create view ruku_view
as
select t1.*, t2.入库编号,t2.入库日期, t2.入库位置,t2.入库数量
from  药品 t1
join 入库信息 t2
on t1.药品编号=t2.药品编号;
go
select * from ruku_view;

-- 分析三：添加新的进货信息，即插入数据到进货表中

go
use 药品存销信息管理系统
go
create procedure insert_rk
@rknum int,
@ypnum int,
@rkdate date,
@location varchar(20),
@num int
as
begin
insert into 入库信息 values(@rknum,@ypnum,@rkdate,@location,@num);
end

-- 分析四：当药品入库时，实时更新药品的数量

go
select * from 药品 where 药品名称='六味地黄丸';
go
insert into 入库信息 values(107001,101,'2022-06-17','位置1',20);
go
select * from 药品 where 药品名称='六味地黄丸';
go

-- 分析五：当药品被销售出去时，统计出库数据
go
select * from 出库信息 where 药品编号=101;
go
insert into 购买 values (11,201,101,getdate(),2,2);
go
select * from 出库信息 where 药品编号=101;

-- 分析六：分组统计每个客户的购买的总药品数并计算购买总价

select 客户.客户编号,客户.姓名, sum(购买.数量) 总数, sum(购买.数量*药品.价格) as 总价
from 客户, 购买, 药品
where 客户.客户编号=购买.客户编号
and 药品.药品编号=购买.药品编号
group by 客户.客户编号,客户.姓名


-- 分析七：分组查询每个员工销售的每种药品数量，并按照销售量由大到小排序

select 员工.工号,员工.姓名, sum(购买.数量) 总数
from 员工, 购买, 药品
where 员工.工号=购买.销售员
and 药品.药品编号=购买.药品编号
group by 员工.工号,员工.姓名
order by 总数 desc

-- 分析八：统计每种药品在2022年六月的出库量，包含所有药品信息

select 药品.药品编号,药品.药品名称, sum(出库信息.数量) as 总出库量
from 药品
left join 出库信息 on 药品.药品编号=出库信息.药品编号
where year(出库日期)=2022 and MONTH(出库日期)=6
group by 药品.药品编号,药品.药品名称