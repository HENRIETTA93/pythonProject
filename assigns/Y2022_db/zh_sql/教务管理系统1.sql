use 教务管理系统
go

-- 部门(部门号,部门名称,电话)
--
-- 专业(专业号,专业名,部门,学制)
--
-- 班级(班号,班名,年级,专业)
-- 课程(课程编号,课程名称,学分,总课时,专业号)
--
-- 学生(学号,姓名,性别,年龄,手机号,邮箱,班号)
-- 职工(职工编号,姓名,性别,年龄,手机号,邮箱,部门号)
--
-- 选课(学号,课程编号)
--
-- 授课(职工编号,课程编号)
--
-- 成绩(学号,课程编号,成绩,考试次数,是否补修,是否重考,成绩确定)
--
-- 用户(用户ID,用户名,启用日期)




CREATE TABLE [部门] (
  [部门号] varchar(10) PRIMARY KEY NOT NULL,
  [部门名称] varchar(20) NULL,
  [电话] varchar(11)
)
GO

CREATE TABLE [专业] (
  [专业号] varchar(10) PRIMARY KEY NOT NULL,
  [专业名] varchar(30),
  [部门号] varchar(10),
  [学制] int NOT NULL DEFAULT 4 check ([学制] in (2,3,4)),
    FOREIGN KEY ([部门号]) REFERENCES [部门]([部门号])
)
GO

CREATE TABLE [课程] (
  [课程编号] varchar(10) PRIMARY KEY NOT NULL,
  [课程名称] varchar(30) ,
  [学分] int  check ([学分]<6),
  [总课时] int check ([总课时]<120),
  [专业号] varchar(10),
     FOREIGN KEY ([专业号]) REFERENCES [专业]([专业号])
)
GO

CREATE TABLE [班级] (
  [班号] varchar(10) PRIMARY KEY,
  [班名] varchar(30) ,
  [年级] int ,
  [专业] varchar(10),
     FOREIGN KEY ([专业]) REFERENCES [专业]([专业号])
)
GO


CREATE TABLE [学生] (
  [学号] varchar(20)  PRIMARY KEY NOT NULL,
  [姓名] varchar(30),
  [性别] varchar(2)  check([性别] in('男','女')),
  [年龄] int,
  [手机号] varchar(11),
  [邮箱] varchar(30),
  [班号] varchar(10),
    FOREIGN KEY ([班号]) REFERENCES [班级]([班号])
)
GO



CREATE TABLE [教师] (
  [职工编号] varchar(20) PRIMARY KEY  NOT NULL,
  [姓名] varchar(30) not null,
  [性别] varchar(2) check([性别] in('男','女')),
  [年龄] int,
  [手机号] varchar(11),
  [邮箱] varchar(30),
  [部门号] varchar(10),
    FOREIGN KEY ([部门号]) REFERENCES [部门]([部门号])
)
GO


CREATE TABLE [授课] (
  [职工编号] varchar(20)  NOT NULL,
  [课程编号] varchar(10)  NOT NULL,
    PRIMARY KEY ([职工编号],[课程编号]),
    FOREIGN KEY ([职工编号]) REFERENCES [教师]([职工编号]),
    FOREIGN KEY ([课程编号]) REFERENCES [课程]([课程编号])
)
GO

CREATE TABLE [选课] (
  [学号] varchar(20)   NOT NULL,
  [课程编号] varchar(10)    NOT NULL,
    PRIMARY KEY([学号],[课程编号]),
    FOREIGN KEY ([学号]) REFERENCES [学生]([学号]),
    FOREIGN KEY ([课程编号]) REFERENCES [课程]([课程编号])
)
GO

CREATE TABLE [成绩] (
  [学号] varchar(20)  NOT NULL,
  [课程编号] varchar(10)  NOT NULL,
  [成绩] int ,
  [考试次数] int  DEFAULT 1,
  [是否补修] varchar(10) DEFAULT 'FALSE',
  [是否重考] varchar(10)  DEFAULT 'FALSE',
  [成绩确定] varchar(10)  DEFAULT 'FALSE',
    PRIMARY KEY([学号],[课程编号]),
    FOREIGN KEY ([学号]) REFERENCES [学生]([学号]),
    FOREIGN KEY ([课程编号]) REFERENCES [课程]([课程编号])
)
GO

CREATE TABLE [用户] (
  [用户ID] int PRIMARY KEY identity,
  [用户名] varchar(30),
  [启用日期] DATE check([启用日期]<getdate())
)
GO