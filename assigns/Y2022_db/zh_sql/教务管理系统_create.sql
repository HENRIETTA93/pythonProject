create database 教务管理
go

use 教务管理
go


CREATE TABLE [部门] (
  [部门号] varchar(10) NOT NULL,
  [部门名称] varchar(20),
  [电话] varchar(11)
)
GO


CREATE TABLE [专业] (
  [专业号] varchar(10)  NOT NULL,
  [专业名] varchar(30),
  [部门号] varchar(10),
  [学制] int NOT NULL DEFAULT 4
)
GO



CREATE TABLE [课程] (
  [课程编号] varchar(10) NOT NULL,
  [课程名称] varchar(30) ,
  [学分] int ,
  [总课时] int ,
  [专业号] varchar(10)
)
GO


CREATE TABLE [班级] (
  [班号] varchar(10) not null,
  [班名] varchar(30) ,
  [年级] int ,
  [专业] varchar(10)
)
GO


CREATE TABLE [学生] (
  [学号] varchar(20) NOT NULL,
  [姓名] varchar(30),
  [性别] varchar(5) ,
  [年龄] int,
  [手机号] varchar(11),
  [邮箱] varchar(30),
  [班号] varchar(10)
)
GO

CREATE TABLE [教师] (
  [职工编号] varchar(20) NOT NULL,
  [姓名] varchar(30) not null,
  [性别] varchar(5),
  [年龄] int,
  [手机号] varchar(11),
  [邮箱] varchar(30),
  [部门号] varchar(10)
)
GO


CREATE TABLE [授课] (
  [职工编号] varchar(20)  NOT NULL,
  [课程编号] varchar(10)  NOT NULL
)
GO

CREATE TABLE [选课] (
  [学号] varchar(20)   NOT NULL,
  [课程编号] varchar(10)  NOT NULL
)
GO

CREATE TABLE [成绩] (
  [学号] varchar(20)  NOT NULL,
  [课程编号] varchar(10)  NOT NULL,
  [成绩] int ,
  [考试次数] int  DEFAULT 1,
  [是否补修] varchar(10) DEFAULT 'FALSE',
  [是否重考] varchar(10)  DEFAULT 'FALSE',
  [成绩确定] varchar(10)  DEFAULT 'FALSE'
)
GO



CREATE TABLE [用户] (
  [用户ID] int not null identity,
  [用户名] varchar(30),
  [启用日期] DATE
)
GO

