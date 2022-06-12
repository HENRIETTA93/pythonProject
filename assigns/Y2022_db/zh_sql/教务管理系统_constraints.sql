
use 教务管理
go

-- 约束
alter table [部门] add constraint pk_部门 primary key([部门号])
go

alter table [专业] add constraint pk_专业 primary key([专业号])
go
alter table [专业] add constraint fk_专业_部门 FOREIGN KEY ([部门号]) REFERENCES [部门]([部门号])
go


alter table [课程] add constraint pk_课程 primary key([课程编号])
go
alter table [课程] add constraint fk_课程_专业  FOREIGN KEY ([专业号]) REFERENCES [专业]([专业号])
go

alter table [班级] add constraint pk_班级 primary key([班号])
go
alter table [班级] add constraint fk_班级_专业  FOREIGN KEY ([专业]) REFERENCES [专业]([专业号])
go


alter table [学生] add constraint pk_学生 primary key([学号])
go
alter table [学生] add constraint fk_学生_班号  FOREIGN KEY ([班号]) REFERENCES [班级]([班号])
go


alter table [教师] add constraint pk_教师 primary key([职工编号])
go
alter table [教师] add constraint fk_教师_部门号  FOREIGN KEY ([部门号]) REFERENCES [部门]([部门号])
go

alter table [授课] add constraint  pk_授课  PRIMARY KEY ([职工编号],[课程编号])
go
alter table [授课] add constraint  fk_授课_课程编号   FOREIGN KEY ([课程编号]) REFERENCES [课程]([课程编号])
go

alter table [授课] add constraint  fk_授课_职工编号  FOREIGN KEY ([职工编号]) REFERENCES [教师]([职工编号])
go


alter table [选课] add constraint  pk_选课  PRIMARY KEY ([学号],[课程编号])
go

alter table [选课] add constraint  fk_选课_课程编号  FOREIGN KEY ([课程编号]) REFERENCES [课程]([课程编号])
go

alter table [选课] add constraint  fk_选课_学号   FOREIGN KEY ([学号]) REFERENCES [学生]([学号])
go


alter table [成绩] add constraint  pk_成绩  PRIMARY KEY ([学号],[课程编号])
go
alter table [成绩] add constraint  fk_成绩_选课  FOREIGN KEY ([学号],[课程编号]) REFERENCES [选课]([学号],[课程编号])
go


alter table [用户] add constraint pk_用户 PRIMARY KEY([用户ID])
go

-- 检查约束

alter table [专业] add constraint chk_学制  check ([学制] in (2,3,4))
go

alter table [课程] add constraint chk_学分 check ([学分]<6)
go

alter table [课程] add constraint chk_总课时 check ([总课时]<120)
go

alter table [学生] add constraint chk_学生性别  check([性别] in('男','女'))
go

alter table [教师] add constraint chk_教师性别  check([性别] in('男','女'))
go



alter table [用户] add constraint chk_启用时间 check([启用日期]<getdate())
go


