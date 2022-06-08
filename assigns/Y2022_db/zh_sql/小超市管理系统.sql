CREATE DATABASE xcs
ON
	( NAME =xcs_data,
	  FILENAME = 'D:\xcs_data.mdf',
	  SIZE=1MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
    ( NAME = xcs_log,
      FILENAME ='D:\xcs_data.ndf',
      SIZE=1MB,
      MAXSIZE = 10MB,
      FILEGROWTH = 10%)
GO

USE xcs
go
-- 创建商品T表
go
create table T(
TID char(8) primary key,
Tname char(14) not null,
TPrice Int not null,
Tproducedate date,
TKeepdate int,
TWeight Char(8),
TNorms Char(12),
TProducename Char(14)
)


-- 创建供应商S表
go
create table S(
SCodename Char(8) primary key,
SName varchar(12) not null,
SAddress varchar(50),
SFax varchar(11),
STele varchar(11) not null,
SDate date,
SOrder Char(8)
)


-- 创建员工信息Y表
go
create table Y(
YID	Char(6) primary key,
Yname Char(6) not null,
YSex Char(2) check(YSex in ('男','女')),
YAge int,
YZhichen varchar(16)
)


-- 创建仓库信息K表
go
create table K(
KNO	char(2)	primary key,
KNum int not null,
KHnum int,
KDnum int,
KPnum Int,
KPerson Char(8)
)


-- 创建仓库商品KT表
go
create table KT(
KNO	char(2),
TID	Char(8),
QTY	int,
primary key(KNO,TID),
constraint fk_KT_KNO foreign key (KNO) references K(KNO),
constraint fk_KT_TID foreign key (TID) references T(TID)
)



-- 创建员工商品YT表
go
create table YT(
YID	 char(6),
TID	 char(8),
CQTY int,
primary key(YID,TID),
constraint fk_YT_YID foreign key(YID) references Y(YID),
constraint fk_YT_TID foreign key(TID) references T(TID)
)


-- 创建ST供应商商品表
go
create table ST(
SCodename Char(8),
TID	char(8),
GQTY int,
primary key (SCodename, TID),
constraint fk_ST_SCodename foreign key(SCodename) references S(Scodename),
constraint fk_ST_TID foreign key(TID) references T(TID)
)



-- 创建供应商商品员工仓库TSYK 表
go
create table TSYK(
SCodename Char(8),
YID	Char(6),
KNO	char(2),
TID	Char(8),
WQTY int,
primary key(SCodename,YID,KNO,TID),
constraint fk_TSYK_SCodename foreign key(SCodename) references S(Scodename),
constraint fk_TSYK_YID foreign key(YID) references Y(YID),
constraint fk_TSYK_KNO foreign key (KNO) references K(KNO),
constraint fk_TSYK_TID foreign key(TID) references T(TID)
)
go





-- 加载数据

insert into T values('TID10001','哇哈哈',13,'2022-01-04',180,'200g','5*20','哇哈哈公司');
insert into T values('TID10002','果丹皮',23,'2022-02-14',280,'220g','9*20','果丹皮公司');
insert into T values('TID10003','小糖果',33,'2022-03-14',280,'220g','9*20','小糖果公司');
insert into T values('TID10004','小浣熊',43,'2022-04-24',280,'220g','9*20','小浣熊公司');
insert into T values('TID10005','小麻花',53,'2022-05-24',280,'220g','9*20','小麻花公司');
insert into T values('TID10006','牛皮糖',23,'2022-06-24',360,'220g','8*20','牛皮糖公司');
insert into T values('TID10007','小辣条', 3,'2022-06-04',360,'240g','8*20','小辣条公司');
insert into T values('TID10008','小蛋糕',53,'2022-02-04',360,'240g','8*20','小蛋糕公司');


insert into S values('SID10001', '公司1','XXX市XX区XX路11号','020102321','1342942358','2022-01-10','o10001');
insert into S values('SID10002', '公司2','XXX市XX区XX路11号','023782321','1349429318','2022-02-10','o10002');
insert into S values('SID10003', '公司3','XXX市XX区XX路12号','023785632','1349454328','2022-02-10','o10003');
insert into S values('SID10004', '公司4','XXX市XX区XX路13号','023785633','1349454338','2022-02-10','o10004');
insert into S values('SID10005', '公司5','XXX市XX区XX路14号','023785634','1349454348','2022-03-11','o10005');
insert into S values('SID10006', '公司6','XXX市XX区XX路15号','020785635','1349454051','2022-03-11','o10006');
insert into S values('SID10007', '公司7','XXX市XX区XX路16号','020782326','1342942968','2022-05-10','o10007');
insert into S values('SID10008', '公司8','XXX市XX区XX路17号','020102327','1342942978','2022-05-10','o10008');

insert into Y values('Y1001','张飞','男',24,'普通职工');
insert into Y values('Y1002','张1','女',24,'普通职工');
insert into Y values('Y1003','张2','女',24,'普通职工');
insert into Y values('Y1004','张3','女',24,'中级职工');
insert into Y values('Y1005','张4','男',26,'高级职工');
insert into Y values('Y1006','张5','男',26,'高级职工');
insert into Y values('Y1007','张6','男',26,'高级职工');
insert into Y values('Y1008','张7','男',26,'高级职工');

insert into K values('K1',110,210,21,11,'张一一');
insert into K values('K2',120,220,22,12,'张二二');
insert into K values('K3',130,230,23,13,'张三三');
insert into K values('K4',140,240,24,14,'四四');
insert into K values('K5',150,250,25,15,'五五');
insert into K values('K6',160,260,26,16,'六六');
insert into K values('K7',170,270,27,17,'七七');


insert into KT values('K1', 'TID10001',110);
insert into KT values('K2', 'TID10002',120);
insert into KT values('K3', 'TID10003',130);
insert into KT values('K4', 'TID10004',140);
insert into KT values('K5', 'TID10005',150);
insert into KT values('K6', 'TID10006',160);
insert into KT values('K7', 'TID10007',170);

insert into YT values ('Y1001','TID10001',231);
insert into YT values ('Y1002','TID10002',232);
insert into YT values ('Y1003','TID10003',233);
insert into YT values ('Y1004','TID10004',234);
insert into YT values ('Y1005','TID10005',235);
insert into YT values ('Y1006','TID10006',236);
insert into YT values ('Y1007','TID10007',237);
insert into YT values ('Y1008','TID10008',239);

insert into ST values ('SID10001','TID10001',210);
insert into ST values ('SID10002','TID10002',220);
insert into ST values ('SID10003','TID10003',230);
insert into ST values ('SID10004','TID10004',240);
insert into ST values ('SID10005','TID10005',250);
insert into ST values ('SID10006','TID10006',260);
insert into ST values ('SID10007','TID10007',270);
insert into ST values ('SID10008','TID10008',280);



insert into TSYK values ('SID10001','Y1001','K1','TID10001',125);
insert into TSYK values ('SID10002','Y1002','K2','TID10002',210);
insert into TSYK values ('SID10003','Y1003','K3','TID10003',210);
insert into TSYK values ('SID10004','Y1004','K4','TID10004',210);
insert into TSYK values ('SID10005','Y1005','K5','TID10005',212);
insert into TSYK values ('SID10006','Y1006','K6','TID10006',212);
insert into TSYK values ('SID10007','Y1007','K7','TID10007',250);
insert into TSYK values ('SID10008','Y1008','K7','TID10008',250);
insert into TSYK values ('SID10002','Y1001','K1','TID10001',250);
insert into TSYK values ('SID10001','Y1005','K1','TID10001',300);



-- 建立视图
go
create view vw_yuangong_sales
as
select Y.YID,y.Yname,y.YAge,y.YSex,
     T.TID,T.Tname, CQTY
from Y
join YT on Y.YID = YT.YID
join T on T.TID=YT.TID

go
select * from vw_yuangong_sales

go

create view vw_cangku_sales
as
select K.KNO, KNum, KHnum, KDnum, KPnum, KPerson, T.Tname, KT.QTY
from K
join KT on K.KNO = KT.KNO
join T on T.TID=KT.TID

go
select * from vw_cangku_sales

go

create view vw_sup_sales
as
select S.SCodename, S.SAddress, S.SOrder, T.TID,T.Tname,ST.GQTY
from S
join ST on S.SCodename=St.SCodename
join T on ST.TID = T.TID

go
select * from vw_sup_sales


-- 建立索引
go
create index idx_s_phone on S(STele)
go

create index idx_s_fax on S(SFax)


-- 记录删改
go
update ST set GQTY=GQTY+10 where SCodename='SID10001' and TID='TID10001'
go
select * from ST where SCodename='SID10001' and TID='TID10001'

go
update T set TPrice=15 where TID='TID10001'
go
select * from T where TID='TID10001'


-- 约束增删
go
alter table ST drop constraint fk_ST_SCodename

go
alter table ST drop constraint fk_ST_TID

go
alter table ST add constraint fk_ST_Scodename foreign key(SCodename) references S(Scodename)
go
alter table ST add constraint
 fk_ST_TID foreign key(TID) references T(TID)


-- 查询实现

-- 无条件单关系查询
go
select * from T

go
select * from S

go
select * from K

go
select * from ST

go

select * from KT

go
select * from YT

go
select * from TSYK

-- 有条件单关系查询
go
select * from T where TPrice>20

go
select * from Y where YSex='男'

go
select * from K where KNum>120

go
select * from YT where CQTY>=235

go
select * from KT where QTY>=150

go

select * from ST where GQTY>250

go
select * from TSYK where SCodename in ('SID10001','SID10002')

-- 分组查询
go
select T.Tname, sum(YT.CQTY)
from YT
join T  on YT.TID = T.TID
group by T.Tname

-- 排序查询
go
select KT.KNO, T.TID, T.Tname, T.TPrice, KT.QTY
from KT
join T on T.TID=KT.TID
order by KT.QTY desc, T.TPrice desc

-- 模糊查询
go
select T.TID, T.Tname,T.TPrice, K.KNO, Y.Yname, TSYK.WQTY
from T
join TSYK on T.TID=TSYK.TID
join K on TSYK.KNO = K.KNO
join Y on TSYK.YID = Y.YID
where T.Tname like '%哈%'


-- 连接查询
go
select S.SCodename, T.Tname, T.TPrice, ST.GQTY
from ST
join S on ST.SCodename = S.SCodename
join T on T.TID=ST.TID
where T.TPrice between 10 and 20

-- 嵌套查询
go
select ST.SCodename, ST.TID, ST.GQTY
from ST
where SCodename in (select SCodename from S where STele like '%3_8')

-- 存储过程设计
go
create procedure pro_find_STsell_best
as
begin
select top 1 T.Tname, sum(ST.GQTY*T.TPrice)
from ST
join T on T.TID=ST.TID
group by T.Tname
order by sum(ST.GQTY*T.TPrice)
end

go
exec pro_find_STsell_best




-- 触发器设计
go
create trigger trg_insert_TSYK
on TSYK
for insert
    as
declare @tid char(8);
declare @yid char(6);
declare @scodename char(8);
declare @kno char(2);
declare @qty int;
declare @cnt1 int;
declare @cnt2 int;
declare @cnt3 int;
begin
select @tid=TID, @yid=YID, @scodename=SCodename, @kno=KNO, @qty=WQTY from inserted;

select @cnt1=count(*) from ST where SCodename=@scodename and TID=@tid;
select @cnt2=count(*) from YT where TID=@tid and YID=@yid;
select @cnt3=count(*) from KT where TID=@tid and KNO=@kno;
if @cnt1>=1
update ST set GQTY=GQTY+@qty where SCodename=@scodename and TID=@tid;
else
insert into ST values(@scodename, @tid, @qty);
if @cnt2>=1
update YT set CQTY=CQTY+@qty where TID=@tid and YID=@yid;
else
insert into YT values(@yid, @tid, @qty);

if @cnt3>=1
update KT set QTY=QTY+@qty where TID=@tid and KNO=@kno;
else
insert into KT values(@kno,@tid, @qty);
end
go


-- test
-- before
go
select * from ST

go

select * from KT

go
select * from YT
go
insert into TSYK values('SID10005','Y1002','K1','TID10002',2);

-- after
go
select * from ST

go

select * from KT

go
select * from YT

go