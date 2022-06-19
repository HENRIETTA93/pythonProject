create database GXXJGL;

use GXXJGL;


create table Department(
dept_id int primary key,
dept_name varchar(20) not null
);
create table Class(
class_id int primary key,
class_name varchar(20),
dept_id int,
stu_num int,
constraint class_dept foreign key (dept_id) references Department(dept_id)
);

create table Student(
stu_id int primary key,
stu_name varchar(20) not null,
stu_gender int not null,
stu_class int,
stu_addr varchar(20),
constraint class_stu foreign key (stu_class) references Class(class_id),
constraint stu_gen_chk check (stu_gender in (0,1))
);

create table Teacher(
teach_id int primary key,
teach_name varchar(20) not null,
teach_gender int
);

create table Course(
course_id int primary key,
course_name varchar(20) not null,
course_studynum int,
teach_id int,
constraint course_teach foreign key (teach_id) references Teacher(teach_id)
);

create table Course_Selection(
stu_id int,
course_id int,
grade int,
studynum int,
choose_time int,
primary key(stu_id,course_id),
constraint course_stu foreign key (stu_id) references Student(stu_id),
constraint course_course foreign key (course_id) references Course(course_id)
);


create table Reward_Penalty(
stu_id int,
name varchar(20),
content varchar(50),
get_time date,
primary key(stu_id,name,get_time),
constraint rp_stu foreign key (stu_id) references Student(stu_id)
);


insert into Teacher values(1001,'��֮��',1);
insert into Teacher values(1002,'��С��',1);         
insert into Teacher values(1003,'��־ǿ',1);  
insert into Teacher values(1004,'������',0);

insert into Course values(1,'C���Գ������',20,1001);   
insert into Course values(2,'Java���Գ������',30,1002);
insert into Course values(3,'���ݿ�ԭ��',32,1003);        
insert into Course values(4,'���ݿ�ʵ��',32,1003);  

insert into Department values(11,'�����');
insert into Department values(12,'����');

insert into Class values(1101,'�ƿ�һ��',11,0);     
insert into Class values(1102,'�ƿƶ���',11,0); 
insert into Class values(1103,'�������',11,0); 
insert into Class values(1104,'��������',11,0); 
                                                               
insert into Student values(2001,'����',1,1102,'�����ѧԺ����01');      
insert into Student values(2002,'����',1,1102,'�����ѧԺ����01');      
insert into Student values(2003,'����',1,1102,'�����ѧԺ����01');      
insert into Student values(2004,'����',1,1102,'�����ѧԺ����01');      
insert into Student values(2005,'��һһ',0,1102,'�����ѧԺ����02');    
insert into Student values(2006,'�����',0,1102,'�����ѧԺ����02');    
insert into Student values(2007,'������',0,1102,'�����ѧԺ����02');    
insert into Student values(2008,'������',0,1101,'�����ѧԺ����02');    
insert into Student values(2009,'������',0,1101,'�����ѧԺ����02');    
insert into Student values(2010,'������',0,1101,'�����ѧԺ����02');   
insert into Student values(2011,'����',1,1101,'�����ѧԺ����01');     
                                              
                                                               
insert into Course_Selection values(2001,1,89,20,1);             
insert into Course_Selection values(2001,2,89,30,1);             
insert into Course_Selection values(2001,3,89,32,1);             
insert into Course_Selection values(2002,1,89,20,1);             
insert into Course_Selection values(2002,2,89,30,1);             
insert into Course_Selection values(2002,3,89,32,1);             
insert into Course_Selection values(2002,4,89,32,1);             
insert into Course_Selection values(2003,3,89,32,1);             
insert into Course_Selection values(2003,4,89,32,1);             
insert into Course_Selection values(2004,3,89,32,1); 
insert into Course_Selection values(2005,3,79,32,1);            
insert into Course_Selection values(2006,3,79,32,1);
insert into Course_Selection values(2007,3,79,32,1);
insert into Course_Selection values(2008,3,79,32,1);
insert into Course_Selection values(2009,3,59,0,1);
insert into Course_Selection values(2010,3,59,0,1);

insert into Reward_Penalty values(2001,'Ժϵ��ѧ��','����1000','2020-01-03');
insert into Reward_Penalty values(2002,'Ժϵ��ѧ��','����2000','2020-01-03');
insert into Reward_Penalty values(2003,'ѧУ��ѧ��','����5000','2020-01-03');
insert into Reward_Penalty values(2002,'Ժϵ��ѧ��','����1000','2020-07-03');
insert into Reward_Penalty values(2001,'Υ��У��','�ͷ�������','2020-03-03');
insert into Reward_Penalty values(2004,'Ժϵ��ѧ��','����1000','2020-01-03');


create view stu_info_vw as
select s.stu_name,c.class_name,d.dept_name
from Student s,Class c,Department d
where s.stu_class=c.class_id and c.dept_id=d.dept_id;

select * from stu_info_vw;


go
create procedure Student_grade @stu_id int
as
select s.stu_id,s.stu_name,c.course_name,sc.grade
from Student s,Course_Selection sc, Course c
where s.stu_id=sc.stu_id and s.stu_id=@stu_id
and sc.course_id=c.course_id;

exec Student_grade @stu_id=2001;


GO
create trigger tri_update_class
on Student
for insert 
as
begin
    declare @class_id int
 declare @course_id int
 select @class_id=stu_class from Student 
 begin
     update Class set stu_num=stu_num+1 where class_id=@class_id
 end
end  


insert into Student values(2012,'XXX',1,1101,'�����ѧԺ����01');  