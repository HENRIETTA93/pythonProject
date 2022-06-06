

create table book_category(
category_id int primary key,
category_name varchar(30)
);


create table authors(
author_id int primary key,
author_name varchar(20),
age int,
sex varchar(2)
);


create table books(
isbn varchar(20) primary key,
book_name varchar(40),
publisher varchar(30),
pub_year int,
author int,
price decimal(5,2),
category_id int,
foreign key (author) references authors(author_id),
foreign key (category_id) references book_category(category_id)
);


create table users(
user_id int primary key,
user_name varchar(20),
sex varchar(2),
age int,
phone varchar(11),
address varchar(100)
);


create table orders(
order_id int primary key,
order_date date,
user_id int,
foreign key(user_id) references users(user_id)
);


create table orderbooks(
order_id int,
isbn varchar(20),
quantity int,
primary key(order_id,isbn),
foreign key(order_id) references orders(order_id),
foreign key (isbn) references books(isbn)
);


insert into book_category values (1,'科普类');
insert into book_category values (2,'自然科学类');
insert into book_category values (3,'文学类');
insert into book_category values (4,'计算机');
insert into book_category values (5,'人文类');
insert into book_category values (6,'儿童文学');
insert into book_category values (7,'家居类');
insert into book_category values (8,'历史类');
insert into book_category values (9,'励志类');
insert into book_category values (10,'经济类');
insert into book_category values (11,'艺术类');
insert into book_category values (12,'管理类');
insert into book_category values (13,'医学类');

insert into authors values (1,'刘慈欣',34,'女');
insert into authors values (2,'谭浩明',54,'男');
insert into authors values (3,'张一一',34,'男');
insert into authors values (4,'张二二',74,'女');
insert into authors values (5,'张三三',34,'男');
insert into authors values (6,'张四四',64,'男');
insert into authors values (7,'张五五',36,'女');
insert into authors values (8,'张六六',56,'男');
insert into authors values (9,'张七七',67,'男');
insert into authors values (10,'张八八',44,'女');
insert into authors values (11,'张九九',45,'女');
insert into authors values (12,'王珊',45,'女');

insert into books values ('1234567890121','三体','人民邮电出版社',2010,1,66, 3);
insert into books values ('9787113242473','MySQL数据库程序设计实验教程','中国铁道出版社',2016,3,68, 4);
insert into books values ('9787040406641','数据库系统概论','高等教育出版社',2010,12,36, 4);
insert into books values ('9787115496317','SQL入门经典','人民邮电出版社',2010,3,56, 4);
insert into books values ('987412563001','Book1','人民邮电出版社',2014,1,96, 1);
insert into books values ('987412563002','Book2','中国铁道出版社',2014,1,96, 1);
insert into books values ('987412563003','Book3','中国铁道出版社',2014,1,96, 2);
insert into books values ('987412563004','Book4','中国铁道出版社',2014,1,96, 2);
insert into books values ('987412563005','Book5','人民邮电出版社',2010,1,66, 1);
insert into books values ('987412563006','Book6','人民邮电出版社',2010,1,66, 3);
insert into books values ('987412563007','Book7','人民邮电出版社',2010,1,66, 3);
insert into books values ('987412563008','Book8','人民邮电出版社',2010,1,66, 1);
insert into books values ('987412563009','Book9','人民邮电出版社',2010,1,66, 1);
insert into books values ('987412563010','Book10','高等教育出版社',2011,1,56, 8);
insert into books values ('987412563011','Book11','高等教育出版社',2012,1,56, 8);
insert into books values ('987412563012','Book12','高等教育出版社',2013,1,62, 8);
insert into books values ('987412563013','Book13','高等教育出版社',2014,1,62, 8);
insert into books values ('987412563014','Book14','高等教育出版社',2015,1,62, 8);
insert into books values ('987412563015','Book15','高等教育出版社',2016,1,46, 8);
insert into books values ('987412563016','Book16','人民邮电出版社',2012,1,46, 8);
insert into books values ('987412563017','Book17','人民邮电出版社',2010,1,46, 1);
insert into books values ('987412563018','Book18','人民邮电出版社',2010,1,66, 5);
insert into books values ('987412563019','Book19','人民邮电出版社',2010,1,66, 1);
insert into books values ('987412563020','Book20','中国铁道出版社',2010,1,66, 7);
insert into books values ('987412563021','Book21','中国铁道出版社',2010,1,66, 7);
insert into books values ('987412563022','Book22','中国铁道出版社',2010,1,66, 1);
insert into books values ('987412563023','Book23','人民邮电出版社',2010,1,66, 9);
insert into books values ('987412563024','Book24','人民邮电出版社',2010,1,66, 9);
insert into books values ('987412563025','Book25','人民邮电出版社',2010,1,66, 1);
insert into books values ('987412563026','Book26','人民邮电出版社',2010,1,106, 11);
insert into books values ('987412563027','Book27','机械工业出版社',2010,1,106, 10);
insert into books values ('987412563028','Book28','机械工业出版社',2010,1,106, 10);
insert into books values ('987412563029','Book29','机械工业出版社',2010,1,106, 13);
insert into books values ('987412563030','Book30','机械工业出版社',2010,1,106, 12);
insert into books values ('987412563031','Book31','人民邮电出版社',2010,1,106, 13);
insert into books values ('987412563032','Book32','人民邮电出版社',2010,1,106, 10);
insert into books values ('987412563033','Book33','人民邮电出版社',2010,1,106, 12);



insert into users values (1,'王一一','男',23,'13526457801','地址A');
insert into users values (2,'王二二','男',23,'13530107801','地址A');
insert into users values (3,'王三三','女',23,'13530117801','地址B');
insert into users values (4,'王四四','男',23,'13530127801','地址C');
insert into users values (5,'王五五','男',23,'13530137801','地址D');
insert into users values (6,'王六六','女',23,'13530147801','地址D');
insert into users values (7,'王七七','男',23,'13530157801','地址A');
insert into users values (8,'王八八','男',23,'13530167801','地址D');
insert into users values (9,'王九九','女',23,'13530177801','地址C');
insert into users values (10,'小明','男',23,'13530187801','地址D');
insert into users values (11,'小华','男',23,'13530197801','地址D');
insert into users values (12,'小莉','女',23,'13530207801','地址A');
insert into users values (13,'小元','女',23,'13530217801','地址D');
insert into users values (14,'小美','女',23,'13530227801','地址B');
insert into users values (15,'小牛','男',23,'13530237801','地址C');
insert into users values (16,'小武','男',23,'13530247801','地址D');
insert into users values (17,'小文','女',23,'13530257801','地址D');
insert into users values (18,'小斌','男',23,'13530267801','地址A');
insert into users values (19,'小天','女',23,'13530277801','地址A');
insert into users values (20,'王强','男',23,'13530287801','地址A');
insert into users values (21,'王杨','女',23,'13530297801','地址B');
insert into users values (22,'王刚','男',23,'13530307801','地址B');
insert into users values (23,'李华','男',23,'13530317801','地址E');



insert into orders values(101, '2021-09-11',1);
insert into orders values(102, '2021-11-11',3);
insert into orders values(103, '2021-12-11',3);
insert into orders values(104, '2022-01-11',13);
insert into orders values(105, '2022-02-11',3);
insert into orders values(106, '2022-03-11',13);
insert into orders values(107, '2022-04-11',21);
insert into orders values(108, '2022-05-11',2);
insert into orders values(109, '2022-05-11',2);
insert into orders values(110, '2022-03-11',15);
insert into orders values(111, '2022-01-11',16);
insert into orders values(112, '2022-02-11',1);
insert into orders values(113, '2022-03-11',1);
insert into orders values(114, '2022-04-11',4);
insert into orders values(115, '2022-05-11',4);
insert into orders values(116, '2022-01-11',5);
insert into orders values(117, '2022-02-21',5);
insert into orders values(118, '2022-03-21',1);
insert into orders values(119, '2022-04-21',6);
insert into orders values(120, '2022-05-21',8);
insert into orders values(121, '2022-02-21',1);
insert into orders values(122, '2022-02-11',10);
insert into orders values(123, '2022-02-21',11);


INSERT INTO orderbooks VALUES (101, '9787115496317',2);
INSERT INTO orderbooks VALUES (101, '987412563001', 1);
INSERT INTO orderbooks VALUES (103, '987412563002', 1);
INSERT INTO orderbooks VALUES (106, '987412563001', 1);
INSERT INTO orderbooks VALUES (106, '987412563016', 1);
INSERT INTO orderbooks VALUES (102, '987412563017', 3);
INSERT INTO orderbooks VALUES (104, '987412563018', 1);
INSERT INTO orderbooks VALUES (105, '987412563019', 2);
INSERT INTO orderbooks VALUES (106, '987412563020', 1);
INSERT INTO orderbooks VALUES (107, '987412563021', 1);
INSERT INTO orderbooks VALUES (108, '987412563022', 5);
INSERT INTO orderbooks VALUES (109, '987412563023', 3);
INSERT INTO orderbooks VALUES (109, '987412563024', 1);
INSERT INTO orderbooks VALUES (110, '987412563025', 1);
INSERT INTO orderbooks VALUES (111, '987412563026', 1);
INSERT INTO orderbooks VALUES (111, '987412563027', 1);
INSERT INTO orderbooks VALUES (112, '987412563028', 1);
INSERT INTO orderbooks VALUES (113, '987412563029', 1);
INSERT INTO orderbooks VALUES (114, '987412563030', 1);
INSERT INTO orderbooks VALUES (114, '1234567890121', 1);
INSERT INTO orderbooks VALUES (115, '9787113242473', 1);
INSERT INTO orderbooks VALUES (115, '9787040406641', 1);
INSERT INTO orderbooks VALUES (116, '9787115496317', 1);
INSERT INTO orderbooks VALUES (117, '1234567890121', 1);
INSERT INTO orderbooks VALUES (118, '9787113242473', 1);
INSERT INTO orderbooks VALUES (119, '9787040406641', 1);
INSERT INTO orderbooks VALUES (119, '9787115496317', 1);
INSERT INTO orderbooks VALUES (120, '1234567890121', 1);
INSERT INTO orderbooks VALUES (121, '9787113242473', 1);
INSERT INTO orderbooks VALUES (122, '9787040406641', 1);
INSERT INTO orderbooks VALUES (123, '9787115496317', 1);




-- crud
alter table orders add total_price decimal(6,2);

alter table orders drop column total_price;

alter table books alter column price decimal(6,2);


-- 修改 Book2的出版社为机械工业出版社

update books set publisher='机械工业出版社' where book_name='Book2';

delete from books where book_name like '%新增%';


-- query

-- 查询book的isbn,书名,出版社和出版年份
select isbn, book_name,publisher,pub_year
from books;

-- 查询在2010年到2019年之间出版的书籍的书名，出版社、出版年份以及作者及书籍类别。
select book_name,publisher,pub_year, a.author_name, bc.category_name
from books
join authors a on books.author = a.author_id
join book_category bc on books.category_id = bc.category_id
where pub_year between 2010 and 2019
order by pub_year desc;


-- 查询地址A的用户所购买过的图书种类以及购买过图书的总价,列出用户名，购买图书类目数，总购买价，结果按照总价降序排列。

select users.user_name, count(distinct b.category_id) , sum(b.price*o2.quantity)
from users
join orders o on users.user_id = o.user_id
join orderbooks o2 on o.order_id = o2.order_id
join books b on o2.isbn = b.isbn
where users.address like '%A%'
group by users.user_name
order by sum(b.price*o2.quantity) desc;

-- 查询购买过至少两种图书的用户信息。
select *
from users
where users.user_id in (
select o.user_id
from orders o
join orderbooks o2 on o.order_id = o2.order_id
join books b on o2.isbn = b.isbn
group by o.user_id
having count(distinct b.category_id)>=2
);

-- 查询购买过计算机类书籍的用户信息和购买过文学类书籍的用户信息。
select users.*
from users
join orders o on users.user_id = o.user_id
join orderbooks o2 on o.order_id = o2.order_id
join books b on o2.isbn = b.isbn
join book_category bc on b.category_id = bc.category_id
where bc.category_name like '计算机%'
union
select users.*
from users
join orders o on users.user_id = o.user_id
join orderbooks o2 on o.order_id = o2.order_id
join books b on o2.isbn = b.isbn
join book_category bc on b.category_id = bc.category_id
where bc.category_name like '文学%';