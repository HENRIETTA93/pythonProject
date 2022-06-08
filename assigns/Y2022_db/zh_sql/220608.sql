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

insert into T values('TID10001','哇哈哈',13,'2022-01-04',180,'200g','5*20','哇哈哈公司');
-- 创建供应商S表
go
create table S(
SCodename Char(8) primary key,
SName Char(12) not null,
SAddress Char(16),
SFax Char(11),
STele Char(11) not null,
SDate date,
SOrder Char(8)
)
insert into S values('SID10001', '公司1','XXX市XX区XX路11号','020102321','1342942908','2022-01-10','order10001');


-- 创建员工信息Y表
go
create table Y(
YID	Char(6) primary key,
Yname Char(6) not null,
YSex Char(1) check(YSex in ('男','女')),
YAge int,
YZhichen Char(6)
)
insert into YID values('Y1001','张飞','男',24,'普通职工');

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
create table K values ('K1',100,200,20,10,'张一一');

-- 创建仓库商品KT表
go
create table KT(
KNO	char(2),
TID	Char(8),
QTY	int,
primary key(KNO,TID),
foreign key (KNO) references K(KNO),
foreign key (TID) references T(TID)
)

insert into KT values('K1', 'TID10001',100);

-- 创建员工商品YT表
go
create table YT(
YID	 char(6),
TID	 char(8),
CQTY int,
primary key(YID,TID),
foreign key(YID) references Y(YID),
foreign key(TID) references T(TID)
)
insert into YT values ('Y1001','TID10001',230);

-- 创建ST供应商商品表
go
create table ST(
SCodename Char(8),
TID	char(8),
GQTY int,
primary key (SCodename, TID),
foreign key(SCodename) references S(Scodename),
foreign key(TID) references T(TID)
)

insert into ST values ('SID10001','TID10001',200);

-- 创建供应商商品员工仓库TSYK 表
go
create table TSYK(
SCodename Char(8),
YID	Char(6),
KNO	char(2),
TID	Char(8),
WQTY int,
primary key(SCodename,YID,KNO,TID),
foreign key(SCodename) references S(Scodename),
foreign key(YID) references Y(YID),
foreign key (KNO) references K(KNO),
foreign key(TID) references T(TID)
)
go

insert into TSYK values ('SID10001','Y1001','K1','TID10001',202);

-- 加载数据



-- 建立视图


-- 建立索引


-- 记录删改

-- 约束增删



-- 查询实现

-- 无条件单关系查询

-- 有条件单关系查询

-- 分组查询

-- 排序查询


-- 模糊查询


-- 连接查询

-- 嵌套查询

-- 存储过程设计


-- 触发器设计
