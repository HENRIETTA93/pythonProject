create table 商品(
商品号 int primary key,
商品名 varchar(20) not null,
单价 decimal(5,2)
);
create table 仓库(
仓库号 int primary key,
仓库名 varchar(20)  not null,
地址 varchar(100)
);
create table 商店(
商店号 int primary key,
商店名 varchar(20) not null,
地址 varchar(20)
);
create table 销售(
商品号 int,
商店号 int,
月份 varchar(10),
月销量 int,
primary key(商品号,商店号,月份),
foreign key (商品号) references 商品(商品号),
foreign key (商店号) references 商店(商店号),
);
create table 库存(
商品号 int,
仓库号 int,
日期 date,
存储量 int,
primary key (商品号,仓库号,日期),
foreign key (商品号) references 商品(商品号),
foreign key (仓库号) references 仓库(仓库号)
);
create table 供应(
商品号 int,
商店号 int,
仓库号 int,
月份 varchar(10),
供应量 int,
primary key (商品号,商店号,仓库号,月份),
foreign key (商品号) references 商品(商品号),
foreign key (商店号) references 商店(商店号),
foreign key (仓库号) references 仓库(仓库号)
);




insert into 商品 values (1,'哇哈哈',10);
insert into 商品 values (2,'可口可乐',4);
insert into 商品 values (3,'汽水',5);
insert into 商品 values (4,'雪人冰淇凌',8);
insert into 商品 values (5,'芒果汁',20);



insert into 仓库 values (1,'仓库1','地址1');
insert into 仓库 values (2,'仓库2','地址2');
insert into 仓库 values (3,'仓库3','地址3');
insert into 仓库 values (4,'仓库4','地址4');
insert into 仓库 values (5,'仓库5','地址5');

insert into 商店 values (1,'商店1','地址1');
insert into 商店 values (2,'商店2','地址2');
insert into 商店 values (3,'商店3','地址3');
insert into 商店 values (4,'商店4','地址4');
insert into 商店 values (5,'商店5','地址5');
insert into 商店 values (6,'商店6','地址6');
insert into 商店 values (7,'商店7','地址7');


insert into 销售 values (1,1,'2022年1月',100);
insert into 销售 values (2,2,'2022年1月',101);
insert into 销售 values (3,3,'2022年1月',102);
insert into 销售 values (4,4,'2022年1月',113);
insert into 销售 values (5,5,'2022年1月',124);
insert into 销售 values (1,6,'2022年1月',135);
insert into 销售 values (2,7,'2022年1月',141);
insert into 销售 values (3,1,'2022年1月',152);
insert into 销售 values (4,2,'2022年4月',113);
insert into 销售 values (5,3,'2022年4月',124);
insert into 销售 values (1,4,'2022年4月',135);
insert into 销售 values (2,5,'2022年5月',141);
insert into 销售 values (3,6,'2022年5月',152);
insert into 销售 values (4,7,'2022年5月',113);
insert into 销售 values (5,1,'2022年5月',124);
insert into 销售 values (1,2,'2022年5月',135);
insert into 销售 values (1,3,'2022年5月',140);


insert into 库存 values (1,1,'2022-01-09',100);
insert into 库存 values (2,2,'2022-01-09',100);
insert into 库存 values (3,3,'2022-01-09',110);
insert into 库存 values (4,4,'2022-01-09',120);
insert into 库存 values (5,5,'2022-01-09',130);
insert into 库存 values (1,2,'2022-01-09',140);
insert into 库存 values (2,2,'2022-01-19',150);
insert into 库存 values (3,1,'2022-01-19',110);
insert into 库存 values (4,2,'2022-04-19',120);
insert into 库存 values (5,3,'2022-04-19',130);
insert into 库存 values (1,4,'2022-04-19',140);
insert into 库存 values (2,5,'2022-05-19',150);
insert into 库存 values (3,3,'2022-05-19',110);
insert into 库存 values (4,3,'2022-05-19',120);
insert into 库存 values (5,1,'2022-05-19',130);
insert into 库存 values (1,2,'2022-05-19',140);
insert into 库存 values (1,3,'2022-05-19',150);


insert into 供应 values (1,1,1,'2022年1月',100);
insert into 供应 values (2,2,2,'2022年1月',100);
insert into 供应 values (3,3,3,'2022年1月',100);
insert into 供应 values (4,4,4,'2022年1月',110);
insert into 供应 values (5,5,5,'2022年1月',120);
insert into 供应 values (1,6,2,'2022年1月',130);
insert into 供应 values (2,7,1,'2022年1月',140);
insert into 供应 values (3,1,1,'2022年1月',150);
insert into 供应 values (4,2,2,'2022年4月',110);
insert into 供应 values (5,3,3,'2022年4月',120);
insert into 供应 values (1,4,4,'2022年4月',130);
insert into 供应 values (2,5,5,'2022年5月',140);
insert into 供应 values (3,6,5,'2022年5月',150);
insert into 供应 values (4,7,1,'2022年5月',110);
insert into 供应 values (5,1,1,'2022年5月',120);
insert into 供应 values (1,2,2,'2022年5月',130);
insert into 供应 values (1,3,3,'2022年5月',140);



-- （7） 修改库存操作-修改2022年1月9日商品编号1入仓库1的库存量为150.

update 库存 set 存储量=150 where 日期='2022-01-09' and 商品号=1 and 仓库号=1;

-- （8） 修改供应操作-修改编号为3的商品为每个仓库和每个商店供应量统一为200.

update 供应 set 供应量=300 where 商品号=3;

-- （9） 删除销售操作-删除月销量小于等于100的记录。
delete from 销售 where 月销量<=100;


-- （10） 查询操作
-- 1）查询2022年5月份哇哈哈商品销售情况，按照销售量倒序排列。（排序）

select  t2.商品名, t1.月份, t3.商店名, t1.月销量
from 销售 t1
join 商品 t2 on t1.商品号 = t2.商品号
join 商店 t3 on t1.商店号 = t3.商店号
where t2.商品名='哇哈哈' and t1.月份='2022年5月'
order by  t1.月销量 desc;
-- 2）分组查询每个商品在每个商店的总销售量。（分组查询）

select  t2.商品名, t3.商店名, sum(t1.月销量) as 总销量
from 销售 t1
join 商品 t2 on t1.商品号 = t2.商品号
join 商店 t3 on t1.商店号 = t3.商店号
group by  t2.商品名, t3.商店名;


-- 3）查询没有在2022年4月份入库的商品的名称和价格。（子查询）

select 商品名,单价
from 商品
where 商品号 not in (select 商品号 from 库存 where 日期 between '2022-04-01' and '2022-04-30');