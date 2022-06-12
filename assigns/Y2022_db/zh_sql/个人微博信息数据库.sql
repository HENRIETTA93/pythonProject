
create database bloginfo
go


use bloginfo
go

create table users(
ID char(10) primary key not null,
username varchar(30) not null,
nickname varchar(30) not null,
passsword varchar(30) not null,
email varchar(30),
regdate date
)
go


create table follows(
userID char(10),
followID char(10),
followdate date,
primary key (userID,followID),
foreign key (userID) references users(ID),
foreign key (followID) references users(ID),
check ( userID!=followID )
)
go


create table category(
ID int primary key not null,
catename varchar(20) not null,
description text
)
go


create table blog(
ID int primary key,
header varchar(20) not null,
content text,
pubdate date,
viewnum int,
agreenum int,
commentnum int,
userID char(10),
foreign key (userID) references users(ID)
)
go




create table blog_category(
blogID int not null,
cateID int not null,
primary key (blogID,cateID),
foreign key (blogID) references blog(ID),
foreign key (cateID) references category(ID)
)
go





create table view_blog(
blogID int not null,
userID char(10) not null,
view_time datetime,
primary key(blogID,userID),
foreign key (blogID) references blog(ID),
foreign key (userID) references users(ID)
)
go


create table agree_blog(
blogID int not null,
userID char(10) not null,
agree_time datetime,
primary key(blogID,userID),
foreign key (blogID) references blog(ID),
foreign key (userID) references users(ID)
)
go



create table comment(
ID int primary key,
commentdate datetime,
content text,
blogID int not null,
commentID int,
userID char(10) not null,
foreign key (blogID) references blog(ID),
foreign key (commentID) references comment(ID),
foreign key (userID) references users(ID)
)
go





insert into users values('u10001','xiaoli','dabaicai','123456','u10001@qq.com','2021-10-10');
insert into users values('u10002','u10002','datudou@','123456','u10002@qq.com','2020-10-10');
insert into users values('u10003','u10003','pigpigpig','13456','u10003@qq.com','2011-10-10');
insert into users values('u10004','u10004','cowcow@@','123456','u10004@qq.com','2022-01-10');
insert into users values('u10005','u10005','lucyhahh','123456','u10005@qq.com','2022-01-10');
insert into users values('u10006','u10006','u10006','u10006','u10006','2018-01-01');


insert into follows values('u10001','u10002','2022-05-29');
insert into follows values('u10002','u10003','2022-05-29');
insert into follows values('u10003','u10004','2022-05-29');
insert into follows values('u10004','u10005','2022-05-29');
insert into follows values('u10005','u10001','2022-05-29');
insert into follows values('u10002','u10001','2022-05-29');
insert into follows values('u10003','u10002','2022-05-29');
insert into follows values('u10004','u10001','2022-05-29');
insert into follows values('u10005','u10002','2022-05-29');
insert into follows values('u10003','u10005','2022-05-29');
insert into follows values('u10004','u10002','2022-05-29');

insert into category values(1,'旅游','旅游旅游');
insert into category values(2,'母婴','母婴母婴');
insert into category values(3,'金融','金融金融');
insert into category values(4,'烘焙','烘焙烘焙');
insert into category values(5,'美容','美容美容');
insert into category values(6,'科普','科普科普');


insert into blog values (1,'上海旅游攻略','陆家嘴xxxxx','2022-05-04',null,null,null,'u10001');
insert into blog values (2,'南京旅游攻略','夫子庙xxxxx','2021-05-04',null,null,null,'u10001');
insert into blog values (3,'如何学习SQL','SQL语言的语法','2020-01-04',null,null,null,'u10002');
insert into blog values (4,'小孩的纸尿裤','小孩的纸尿裤','2022-05-03',null,null,null,'u10003');
insert into blog values (5,'懂金融也懂法','懂法的重要性','2022-05-04',null,null,null,'u10003');
insert into blog values (6,'怎么做蛋糕?','怎么做蛋糕?','2022-05-05',null,null,null,'u10004');
insert into blog values (7,'怎么存钱最快','怎么存钱最快','2022-05-06',null,null,null,'u10005');
insert into blog values (8,'五一旅行&化妆','美美地出去玩','2022-05-07',null,null,null,'u10005');
insert into blog values (9,'北京旅游攻略','北京旅游攻略','2022-05-08',null,null,null,'u10001');
insert into blog values (10,'股市揭秘XX','股市揭秘XXx','2022-05-10',null,null,null,'u10001');


insert into blog_category values (1,1);
insert into blog_category values (2,1);
insert into blog_category values (3,6);
insert into blog_category values (5,6);
insert into blog_category values (4,2);
insert into blog_category values (5,3);
insert into blog_category values (6,4);
insert into blog_category values (7,3);
insert into blog_category values (8,1);
insert into blog_category values (8,5);
insert into blog_category values (9,1);
insert into blog_category values (10,3);



insert into view_blog values (1,'u10001','2022-06-01 20:00:00');
insert into view_blog values (2,'u10001','2022-06-01 20:00:00');
insert into view_blog values (3,'u10001','2022-06-01 20:00:00');
insert into view_blog values (5,'u10001','2022-06-01 20:00:00');
insert into view_blog values (4,'u10001','2022-06-01 20:00:00');
insert into view_blog values (6,'u10001','2022-06-01 20:00:00');
insert into view_blog values (1,'u10002','2022-06-01 20:00:00');
insert into view_blog values (2,'u10002','2022-06-01 20:00:00');
insert into view_blog values (3,'u10002','2022-06-01 20:00:00');
insert into view_blog values (5,'u10002','2022-06-01 20:00:00');
insert into view_blog values (4,'u10002','2022-06-01 20:00:00');
insert into view_blog values (6,'u10002','2022-06-01 20:00:00');
insert into view_blog values (7,'u10002','2022-06-02 20:00:00');
insert into view_blog values (8,'u10002','2022-06-02 20:00:00');
insert into view_blog values (8,'u10004','2022-06-02 20:00:00');

insert into agree_blog values (1,'u10003','2022-06-01 20:00:00');
insert into agree_blog values (2,'u10003','2022-06-01 20:00:00');
insert into agree_blog values (3,'u10003','2022-06-01 20:00:00');
insert into agree_blog values (5,'u10003','2022-06-01 20:00:00');
insert into agree_blog values (4,'u10001','2022-06-01 20:00:00');
insert into agree_blog values (6,'u10001','2022-06-01 20:00:00');
insert into agree_blog values (1,'u10002','2022-06-01 20:00:00');
insert into agree_blog values (2,'u10002','2022-06-01 20:00:00');
insert into agree_blog values (3,'u10004','2022-06-01 20:00:00');
insert into agree_blog values (5,'u10004','2022-06-01 20:00:00');
insert into agree_blog values (4,'u10004','2022-06-01 20:00:00');
insert into agree_blog values (6,'u10004','2022-06-01 20:00:00');
insert into agree_blog values (7,'u10002','2022-06-02 20:00:00');
insert into agree_blog values (8,'u10001','2022-06-02 20:00:00');
insert into agree_blog values (8,'u10005','2022-06-02 20:00:00');



insert into comment values (1, '2022-06-05 10:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (2, '2022-06-04 11:00:00','好啊，非常棒',2,1   , 'u10001');
insert into comment values (3, '2022-06-04 11:00:00','好啊，非常棒',3,null, 'u10001');
insert into comment values (5, '2022-06-04 11:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (4, '2022-06-03 10:00:00','好啊，非常棒',5,5   , 'u10001');
insert into comment values (6, '2022-06-03 12:00:00','好啊，非常棒',3,null, 'u10001');
insert into comment values (7, '2022-06-03 12:00:00','好啊，非常棒',3,null, 'u10001');
insert into comment values (8, '2022-06-02 10:00:00','好啊，非常棒',3,null, 'u10001');
insert into comment values (9, '2022-06-02 10:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (10, '2022-06-07 20:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (11, '2022-06-07 20:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (12, '2022-06-07 20:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (13, '2022-06-07 20:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (14, '2022-06-07 20:00:00','好啊，非常棒',1,null, 'u10001');
insert into comment values (15, '2022-06-02 10:00:00','好啊，非常棒',1,null, 'u10001');



go


update blog set viewnum=(select count(*) from view_blog where blogID=blog.ID);

update blog set agreenum=(select count(*) from agree_blog where blogID=blog.ID);

update blog set commentnum=(select count(*) from comment where blogID=blog.ID);


go


-- 删除数据

delete from users where ID not in (select userID from blog);




-- 1. 查询评论数大于5条的博文信息
--
-- 2. 查询互相关注的用户信息，列出用户名和昵称
--
-- 3. 查询点赞数和查看数的均大于等于2的博文和发博的博主信息，列出博文类别、博文主题和博主昵称
--
-- 4. 查询注册时间早于2020年的用户信息
--
--
-- 5. 查询博文属于旅游类别的博文信息。




select ID, header,content,pubdate,viewnum,agreenum,commentnum,userID
from blog where commentnum>5;


select u1.ID, u2.ID
from users u1 join follows f on u1.ID = f.userID
join users u2 on u2.ID=f.followID
intersect
select u1.ID, u2.ID
from users u1 join follows f on u1.ID = f.followID
join users u2 on u2.ID=f.userID


select c.catename, blog.header, u.nickname
from blog join blog_category bc on blog.ID = bc.blogID
join category c on bc.cateID = c.ID
join users u on blog.userID = u.ID
where blog.agreenum>=2 and blog.viewnum>=2


select ID,username, regdate
from users
where regdate<'2020-01-01'


select c.catename, blog.header
from blog join blog_category bc on blog.ID = bc.blogID
join category c on bc.cateID = c.ID
where c.catename='旅游'