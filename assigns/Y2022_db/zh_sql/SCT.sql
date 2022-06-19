CREATE DATABASE SCT电气学院068
ON
	( NAME =SCT电气学院068_data,
	  FILENAME = 'D:\SCT电气学院068_data.mdf',
	  SIZE=5MB,
      MAXSIZE = 20MB,
      FILEGROWTH = 10%)
LOG ON
    ( NAME = SCT电气学院068_log,
      FILENAME ='D:\SCT电气学院068_log.ldf',
      SIZE=5MB,
      MAXSIZE = 15MB,
      FILEGROWTH = 1MB)
GO

use SCT电气学院068
GO

create table TEACHER电气学院068(
TNO	CHAR(5)	not null primary key ,
TNAME	CHAR(8)	not null,
TSEX	CHAR(2)	 check (TSEX in ('男','女')),
TAGE	TINYINT	check (TAGE between 1 and 100),
TDEPT	CHAR(10) not null,
TITLE	CHAR(10) check(TITLE in ('讲师','教授','副教授')),
TTEL	CHAR(11) not null,
EMAIL	VARCHAR(30)	 not null
)

GO

create table SCT电气学院068(
SNO	CHAR(9) not null,
CNO	CHAR(6) not null,
TNO	CHAR(5) not null,
GRADE TINYINT check (GRADE between 0 and 100),
primary key(SNO,CNO,TNO),
foreign key (SNO) references STUDENT电气学院068(SNO),
foreign key (CNO) references COURSE电气学院068(CNO),
foreign key (TNO) references TEACHER电气学院068(TNO)
)

GO

alter table COURSE电气学院068 add SEMESTER char(2)
go

alter table COURSE电气学院068 add constraint chk_semester check(SEMESTER in ('春','秋'))
go

alter table COURSE电气学院068 drop constraint chk_semester
go
alter table  COURSE电气学院068  drop column SEMESTER
go

create index idx_tdept on TEACHER电气学院068(TDEPT desc)
go

create index idx_title on TEACHER电气学院068(TITLE desc)
go

create index idx_grade on SCT电气学院068(GRADE desc)
go


drop index TEACHER电气学院068.idx_tdept
go


drop table SCT电气学院068
go



use SCT电气学院068
go

select * from STUDENT电气学院068 where SDEPT='计算机'

select * from STUDENT电气学院068 where SAGE between 20 and 21

select * from STUDENT电气学院068 where SNAME like '_志%'

select * from TEACHER电气学院068 where TAGE<45 and TSEX='女'

select * from COURSE电气学院068 where CNAME like '%数学%'

select * from COURSE电气学院068 where CNAME in ('数据库','操作系统','C语言')

select * from SCT电气学院068 where CNO='CS-001'

select * from SCT电气学院068 where GRADE>90

select top 2 * from SCT电气学院068 order by GRADE desc

select top 2 SNO
from SCT电气学院068
group by SNO
order by count(CNO)

select distinct CNO from SCT电气学院068

select SNO
from SCT电气学院068
group by SNO
having count(CNO)=3

select max(GRADE) as 最高分, min(GRADE) as 最低分, avg(GRADE) as 平均分
from SCT电气学院068
where CNO='CS-001'

select count(CNO) as 选课门数, avg(GRADE) as 平均分
from SCT电气学院068
where SNO='P20160421'

select CNO, max(GRADE) as 最高分, min(GRADE) as 最低分, avg(GRADE) as 平均分
from SCT电气学院068
group by CNO

select SNO, max(GRADE) as 最高分, min(GRADE) as 最低分, avg(GRADE) as 平均分
from SCT电气学院068
group by SNO



go

select s.SNAME, c.CNAME, c.CREDIT
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where s.SNAME='王红';

select s.SNO, s.SNAME
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='数据库';

select distinct t.*
from TEACHER电气学院068 t
join SCT电气学院068 sct on t.TNO=sct.TNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言';


select s.SNO, s.SNAME, sct.GRADE
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言'
order by sct.GRADE desc;



select top 3 s.SNAME, s.SPROF, sct.GRADE
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言'
order by sct.GRADE desc;


select max(sct.GRADE) as 最高分,min(sct.GRADE) as 最低分, avg(sct.GRADE) as 平均分
from  SCT电气学院068 sct
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言';


select count(c.CNO) as 门数,max(sct.GRADE) as 最高分,min(sct.GRADE) as 最低分, avg(sct.GRADE) as 平均分
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where s.SNAME='林美';


select c.CNAME, c.CREDIT
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where s.SNAME='王平' and sct.GRADE>=60;



select c.CNAME, s.SNO, s.SNAME, sct.GRADE
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言' and sct.GRADE<60;


select c.CNAME, s.SNAME,t.TNAME, sct.GRADE
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
join TEACHER电气学院068 t on t.TNO=sct.TNO
where sct.GRADE<60
order by c.CNAME asc;


select c.CNAME, count(sct.SNO) as 选课人数
from COURSE电气学院068 c
left join SCT电气学院068 sct on c.CNO=sct.CNO
group by c.CNAME
order by count(sct.SNO) desc;



go

select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
where sct.CNO =(select CNO from COURSE电气学院068 where CNAME='数据库');


select sct.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
where s.SDEPT = (select SDEPT from STUDENT电气学院068 where SNAME='李维');


select SNO,CNO,GRADE
from SCT电气学院068
where GRADE in
	(select MAX(GRADE)
		from SCT电气学院068
		group by SNO
	)


select *
from TEACHER电气学院068
where TSEX='女' and TITLE= (select TITLE from TEACHER电气学院068 where TNAME='王丽')
and TNAME!='王丽';


select sct.*
from SCT电气学院068 sct
join TEACHER电气学院068 t on t.TNO=sct.TNO
where t.TNAME in ('周小平', '王建宁')
order by sct.TNO asc;

/*

select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
where sct.CNO = any(
select sct.CNO
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
where s.SNAME='李维')
and s.SNAME!='李维'
*/

select *
from STUDENT电气学院068
where SNO in
(
	select distinct SNO
	from SCT电气学院068 sct
	where not exists
		(select *
			from SCT电气学院068 sct2
			where sct2.SNO =(select SNO
				from STUDENT电气学院068
				where SNAME = '李维'
			)
			and
				not exists
				(select *
					from SCT电气学院068 sct3
					where sct3.SNO = sct.SNO and
						sct3.CNO = sct2.CNO))
)
and SNAME!='李维';



select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='数据库'
intersect
select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言';



select *
from STUDENT电气学院068
where SSEX = '女' and SDEPT = '电子'
union
select *
from STUDENT电气学院068
where SSEX = '女' and SDEPT = '计算机'
;



-- (9)	查询选修了“C语言”但是未选修“数据库”课程的学生信息；

select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='C语言'
except
select s.*
from STUDENT电气学院068 s
join SCT电气学院068 sct on s.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='数据库'



-- (10)	查询学分是3或4的课程信息；
select c.*
from COURSE电气学院068 c
where c.CREDIT =3
union
select c.*
from COURSE电气学院068 c
where c.CREDIT =4





-- (11)	查询无人选修的课程的详细信息；

select *
from COURSE电气学院068
where CNO in(
	select CNO
	from COURSE电气学院068
	except
	select distinct CNO
	from SCT电气学院068
)



-- (12)	查询选修了教师“丁伟力”所授课程的学生的成绩单，结果包括学号、课程号、成绩。

select SNO,CNO, GRADE
from SCT电气学院068
where TNO=(select TNO from TEACHER电气学院068 where TNAME='丁伟力')


go



insert into STUDENT电气学院068 values('E20180001', '张成','男','软件','计算机',19,'12700000010','zc@dbs.com');

insert into COURSE电气学院068 values ('CS-005','计算机网络',3,'选修');

insert into SCT电气学院068 values ('E20180001','CS-005', '92001',null);

insert into SCT电气学院068
select distinct  'E20180001','CS-001',TNO, null from SCT电气学院068 where CNO='CS-001';

insert into SCT电气学院068
select distinct  'E20160120',CNO,'92001', null from COURSE电气学院068 where CNAME='计算机网络';


update STUDENT电气学院068 set SAGE=SAGE+1 where SDEPT='计算机';

update COURSE电气学院068 set CREDIT=2 where CNAME='数据库';

update SCT电气学院068 set GRADE=GRADE+10 where GRADE<60;


update STUDENT电气学院068 set SNAME='王红', SSEX='女' where SNO='E20180001';

update TEACHER电气学院068 set TITLE='教授' where TNAME='王建宁';

delete from SCT电气学院068 where SNO='E20160120' and CNO=(select CNO from COURSE电气学院068 where CNAME='计算机网络');

delete from SCT电气学院068 where CNO =(select CNO from COURSE电气学院068 where CNAME='计算机网络');


delete from COURSE电气学院068 where CNAME='计算机网络';


delete from SCT电气学院068 where SNO ='E20180001';

delete from STUDENT电气学院068 where SNO='E20180001';

create table AVG电气学院068
(
SNO char(9) primary key,
SNAME char(8),
AVG_GRADE int
);


insert into AVG电气学院068
select s.SNO,s.SNAME, avg(sct.GRADE)
from STUDENT电气学院068 s
left join SCT电气学院068 sct
on s.SNO=sct.SNO
group by s.SNO,s.SNAME;



create table C_GRADE电气学院068(
CNO char(6) primary key,
CNAME char(20),
MAX_GRADE int,
MIN_GRADE int,
AVG_GRADE int
);

insert into C_GRADE电气学院068
select c.CNO, c.CNAME, max(sct.GRADE),min(sct.GRADE), avg(sct.GRADE)
from COURSE电气学院068 c
left join SCT电气学院068 sct
on c.CNO=sct.CNO
group by c.CNO, c.CNAME;


go
create view CS_S
as
select *
from STUDENT电气学院068
where SDEPT='计算机'
go

select * from CS_S;

go
create view CS_S1
as
select *
from STUDENT电气学院068
where SDEPT='计算机' and SSEX='女'
go

select * from CS_S1
go
update CS_S1 set SAGE=SAGE+1
go
select * from CS_S1


go
create view PR_S
as
select *
from TEACHER电气学院068
where TITLE='教授'

go
select * from PR_S


go
create view TE_T
as
select *
from TEACHER电气学院068
where TNO not in (
select TNO
from SCT电气学院068)

go
select * from TE_T


go

create view CS_S3
as
select CS_S.SNO, SNAME, sct.GRADE
from CS_S
join SCT电气学院068 sct on CS_S.SNO=sct.SNO
join COURSE电气学院068 c on c.CNO=sct.CNO
where c.CNAME='数据库'

go
select * from CS_S3


go

select PR_S.TNO, TNAME, s.SNO, sct.CNO, sct.GRADE
from PR_S
join SCT电气学院068 sct on PR_S.TNO=sct.TNO
join STUDENT电气学院068 s on s.SNO=sct.SNO


go
select * from CS_S1
go
update CS_S1 set SAGE=SAGE+1
go
select * from CS_S1
go
select * from STUDENT电气学院068


go
insert into CS_S values ('D20220001','张小华', '男','通信','电子',20,'12345678901','zxh@qq.com')
go
select * from STUDENT电气学院068
go
select * from CS_S


go
insert into CS_S1 values ('D20220002','张华', '女','通信','电子',20,'12345678910','zh@qq.com')
go
select * from STUDENT电气学院068
go
select * from CS_S1

drop view CS_S;



-- delete from SCT电气学院068;
--
-- delete from TEACHER电气学院068
--
-- delete from COURSE电气学院068
--
-- delete from STUDENT电气学院068
