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

create table 药品(
药品编号 int primary key,
药品类别 varchar(20) not null,
药品名称 varchar(20) not null,
产地 varchar(20)
);

alter table 药品 add constraint chk_leibie check(药品类别 in('中药','草药','中成药'));

create table 进货信息(
进货编号 int primary key,
药品编号 int not null,
进货日期 date not null default (getdate()),
生产日期 date,
有效期 date,
进货单价 decimal not null,
进货数量 int not null,
constraint fk_yaopin foreign key (药品编号) references 药品(药品编号)
);

alter table 进货信息 add constraint chk_danjia check(进货单价>0);
alter table 进货信息 add constraint chk_shuliang check(进货数量>0);
alter table 进货信息 add constraint chk_youxiao check(进货日期<有效期);

create table 销售员(
工号 int primary key,
姓名 varchar(20) not null,
性别 varchar(2) not null,
住址 varchar(30)
);


create table 销售信息(
进货编号 int not null,
工号 int not null,
销售单价 decimal,
柜台号 varchar(20) not null,
数量 int not null,
销售日期 datetime not null default (getdate()),
primary key(进货编号,工号,销售日期),
constraint fk_gonghao foreign key (工号) references 销售员(工号),
constraint fk_yaop foreign key (进货编号) references 进货信息(进货编号)
);


create table 库存(
进货编号 int primary key,
库存数量 int,
constraint fk_yp foreign key (进货编号) references 进货信息(进货编号)
);


insert into 药品 values (101,'中药','六味地黄丸','江苏');
insert into 药品 values (102,'草药','黄芪','山东');
insert into 药品 values (103,'中成药','三黄片','江苏');
insert into 药品 values (104,'中药','解毒丸','浙江');
insert into 药品 values (105,'中药','止痛丸','安徽');
insert into 药品 values (106,'草药','金银花','河南');

insert into 销售员 values (1,'李冰冰','女','xxx1');
insert into 销售员 values (2,'张伟','男','xfffxx1');
insert into 销售员 values (3,'杨幂','女','11132号院');
insert into 销售员 values (4,'徐聪','男','xxx2234');
insert into 销售员 values (5,'孙逸凡','男','xxx343');
insert into 销售员 values (6,'李一笑','女','xxx543');

insert into 进货信息 values (101001,101,DEFAULT,'2020-01-07','2023-07-01',20,100);
insert into 进货信息 values (101002,101,DEFAULT,'2020-03-07','2023-08-01',10,140);
insert into 进货信息 values (102001,102,DEFAULT,'2020-01-07','2023-07-01',15,150);
insert into 进货信息 values (103001,103,DEFAULT,'2020-01-07','2023-07-01',26,180);
insert into 进货信息 values (104001,104,DEFAULT,'2020-01-07','2023-07-01',28,200);
insert into 进货信息 values (105001,105,DEFAULT,'2020-01-07','2023-07-01',20,10);
insert into 进货信息 values (106001,106,DEFAULT,'2020-01-07','2023-07-01',20,120);

insert into 销售信息 values (101001,1,30,'G001',5,default);
insert into 销售信息 values (101001,2,35,'G001',3,default);
insert into 销售信息 values (101001,3,32,'G002',4,default);
insert into 销售信息 values (102001,1,15,'G003',5,default);
insert into 销售信息 values (103001,1,20,'G004',5,default);


/* 测试一：创建销售员与其所销售的药品的详细信息的视图 */

create view xiaoshou_view
as
select t1.*, t2.柜台号,t2.进货编号,t2.数量,t2.销售单价,t2.销售日期
from 销售员 t1, 销售信息 t2
where t1.工号=t2.工号;

select * from xiaoshou_view;

/* 测试二：创建进货药品的详细信息视图 */

create view jinhuo_view
as
select t1.*, t2.进货编号,t2.进货单价,t2.进货日期,t2.进货数量,t2.生产日期,t2.有效期
from  药品 t1,进货信息 t2
where t1.药品编号=t2.药品编号;

select * from jinhuo_view;

-- 添加新的进货信息，即插入数据到进货表中

use 中草药销售管理系统
go
create procedure insert_jh
@jhnum int,
@ypnum int,
@scdate date,
@yxdate date,
@price decimal,
@num int
as
begin
insert into 进货信息 values(@jhnum,@ypnum,default,@scdate,@yxdate,@price,@num);
end
