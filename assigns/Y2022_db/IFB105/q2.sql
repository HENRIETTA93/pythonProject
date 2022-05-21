create table Person(
pName varchar(20) primary key
);
create table Repairer(
rName varchar(20) primary key
);

create table Vehicle(
reg int primary key,
pName varchar(20),
constraint fk_owned_by foreign key (pName) references Person(pName)
);

create table Repaired(
reg int,
date date,
rName varchar(20),
cost decimal(5,2),
primary key (reg, date),
constraint fk_vehicle foreign key (reg) references Vehicle(reg),
constraint fk_repairedby foreign key (rName) references Repairer(rName)
);
