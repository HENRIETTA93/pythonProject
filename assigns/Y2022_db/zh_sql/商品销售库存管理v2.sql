create table warehouse(
warehouse_id int primary key,
warehouse_name varchar(50)  not null,
address text
);


create table store(
store_id int primary key,
store_name varchar(50) not null,
address text
);


create table goods(
good_id int primary key,
good_name varchar(50) not null,
price float
);


create table stock(
stock_id int primary key,
good_id int,
warehouse_id int,
date date,
quantity int,
foreign key (good_id) references goods(good_id),
foreign key (warehouse_id) references warehouse(warehouse_id)
);

create table sales(
sales_id int primary key,
good_id int,
store_id int,
month varchar(10),
quantity int,
foreign key (good_id) references goods(good_id),
foreign key (store_id) references store(store_id)
);


create table supply(
supply_id int primary key,
good_id int,
store_id int,
warehouse_id int,
month varchar(10),
quantity int,
foreign key (good_id) references goods(good_id),
foreign key (store_id) references store(store_id),
foreign key (warehouse_id) references warehouse(warehouse_id)
);

insert into warehouse values (1,'1号仓库','1号仓库');
insert into warehouse values (2,'2号仓库','2号仓库');
insert into warehouse values (3,'3号仓库','3号仓库');

insert into store values (1,'商店1','天津市XXX路1号');
insert into store values (2,'商店2','天津市XXX路2号');
insert into store values (3,'商店3','天津市XXX路3号');
insert into store values (4,'商店4','天津市XXX路4号');

insert into goods values(1,'铅笔',2);
insert into goods values(2,'橡皮',2);
insert into goods values(3,'钢笔',60);
insert into goods values(4,'彩色笔',30);
insert into goods values(5,'素描纸',20);
insert into goods values(6,'尺子',2);
insert into goods values(7,'卷笔刀',2);

insert into stock values (1,1,1, '2022-05-10',50);
insert into stock values (2,2,2, '2022-04-10',50);
insert into stock values (3,3,3, '2022-03-10',50);
insert into stock values (4,4,1, '2022-02-10',50);
insert into stock values (5,5,2, '2022-01-11',50);
insert into stock values (6,6,3, '2022-05-11',70);
insert into stock values (7,7,1, '2022-05-11',70);
insert into stock values (8,1,2, '2022-05-11',70);
insert into stock values (9,2,3, '2022-05-11',70);
insert into stock values (10,1,1, '2022-06-03',80);
insert into stock values (11,2,2, '2022-06-03',80);
insert into stock values (12,3,3, '2022-06-03',80);

insert into sales values (1,1,1,'2022-6',100);
insert into sales values (2,2,2,'2022-5',100);
insert into sales values (3,3,3,'2022-4',100);
insert into sales values (4,4,4,'2022-3',100);
insert into sales values (5,5,1,'2022-2',100);
insert into sales values (6,6,2,'2022-5',100);
insert into sales values (7,7,3,'2022-5',100);
insert into sales values (8,1,4,'2022-5',100);
insert into sales values (9,2,1,'2022-5',100);
insert into sales values (10,1,2,'2022-4',100);
insert into sales values (11,2,3,'2022-4',100);
insert into sales values (12,3,4,'2022-4',100);




insert into supply values (1,1,1,2,'2022-6',80);
insert into supply values (2,1,1,2,'2022-5',300);
insert into supply values (3,1,1,2,'2022-4',300);
insert into supply values (4,1,1,2,'2022-3',300);
insert into supply values (5,1,1,2,'2022-2',300);
insert into supply values (6,1,1,2,'2022-5',300);
insert into supply values (7,1,1,2,'2022-5',300);
insert into supply values (8,1,1,2,'2022-5',300);
insert into supply values (9,1,1,2,'2022-5',300);
insert into supply values (10,1,1,2,'2022-4',400);
insert into supply values (11,1,1,2,'2022-4',400);
insert into supply values (12,1,1,2,'2022-4',400);






-- 更新1号仓库的地址为"天津市滨海新区1号仓库"
update warehouse set address='天津市滨海新区1号仓库' where warehouse_id=1;

-- 更新橡皮的价格为1
update goods set price=1 where good_name='橡皮';

-- 更新商店编号为1的商店名称为"快乐商店"
update store set store_name='快乐商店' where store_id=1;