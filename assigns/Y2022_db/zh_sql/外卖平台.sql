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
insert into 外卖类别 values (1,'叶菜');
insert into 外卖类别 values (2,'茄果瓜');
insert into 外卖类别 values (3,'根茎');
insert into 外卖类别 values (4,'豆制品');
insert into 外卖类别 values (5,'菌菇');
insert into 外卖类别 values (6,'水果');
go
create table 蔬果产品(
蔬果ID varchar(12) primary key,
蔬果名称 varchar(30) not null,
产地 varchar(20) ,
单价 float,
重量 varchar(20)
外卖类别 int
)

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


1
2
3
4
5
6
7
8
9
10

go
create table 顾客(
顾客ID varchar(10) primary key,
姓名 varchar(20) not null,
年龄 int,
性别 varchar(2),
电话 varchar(11),
地址 text
)

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

go
create table 购物车条目(
顾客ID varchar(10),
蔬果ID varchar(12),
数量 int,
primary key (顾客ID, 蔬果ID)
)
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

go
create table 订单(
订单ID varchar(11) primary key,
下单时间 datetime,
订单金额 float,
预计送达时间 datetime,
配送时间 datetime,
送达时间 datetime,
顾客ID varchar(10)
)

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
insert into 订单 values('D0014','2022-05-14 11:00:00',null, null, '2022-05-14 13:00:00', '2022-05-14 13:40:00','GK0006');
insert into 订单 values('D0015','2022-05-15 11:00:00',null, null, '2022-05-15 13:00:00', '2022-05-15 13:40:00','GK0007');


go
create table 订单条目(
订单ID varchar(11),
蔬果ID varchar(12),
数量 int,
折扣 float,
primary key (订单ID,蔬果ID)
)

insert into 订单条目 values('D0001','SC011001',2, null);
insert into 订单条目 values('D0001','SC011002',2, null);
insert into 订单条目 values('D0002','SC011003',3, null);
insert into 订单条目 values('D0002','SC011004',4, null);
insert into 订单条目 values('D0003','SC011005',5, null);
insert into 订单条目 values('D0003','SC011006',6, null);
insert into 订单条目 values('D0003','SC011007',1, null);
insert into 订单条目 values('D0003','SC011008',1, null);
insert into 订单条目 values('D0004','SC011009',1, null);
insert into 订单条目 values('D0004','SC011010',1, null);
insert into 订单条目 values('D0005','SC011011',1, null);
insert into 订单条目 values('D0006','SC011012',5, null);
insert into 订单条目 values('D0007','SC011013',5, null);
insert into 订单条目 values('D0008','SC011014',5, null);
insert into 订单条目 values('D0009','SC011001',5, null);
insert into 订单条目 values('D0010','SC011002',5, null);
insert into 订单条目 values('D0011','SC011003',5, null);
insert into 订单条目 values('D0012','SC011004',3, null);
insert into 订单条目 values('D0013','SC011005',3, null);
insert into 订单条目 values('D0014','SC011006',3, null);
insert into 订单条目 values('D0015','SC011007',3, null);




