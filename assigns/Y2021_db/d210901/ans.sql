create table person(
PersonId int primary key,
FirstName varchar(20),
LastName varchar(20),
BirthDate date
);

create table phone_chl(
PersonId int,
PhoneNbr varchar(20),
primary key(PersonId,PhoneNbr),
foreign key (PersonId) references person(PersonId)
);
create table email_chl(
PersonId int,
Email varchar(40),
primary key (PersonId,Email),
foreign key (PersonId) references person(PersonId)
);

create table opt_email_info(
OptId int primary key,
OptDate date,
Happens varchar(30),
OptReason varchar(60),
InOutFlag varchar(10),
SwitchId int,
PersonId int,
Email varchar(40),
foreign key (SwitchId) references opt_email_info(OptId),
foreign key (PersonId,Email) references email_chl(PersonId,Email)
);

create table opt_phone_info(
OptId int primary key,
OptDate date,
Happens varchar(30),
OptReason varchar(60),
InOutFlag varchar(10),
SwitchId int,
PersonId int,
PhoneNbr varchar(20),
foreign key (SwitchId) references opt_phone_info(OptId),
foreign key (PersonId,PhoneNbr) references phone_chl(PersonId,PhoneNbr)
);

create table account(
AccountId int primary key,
Balance float,
OpenDate date,
CloseDate date,
PersonId int,
foreign key (PersonId) references person(PersonId)
);

create table saving_account(
AccountId int primary key,
InterestRate float,
foreign key (AccountId) references account(AccountId)
);

create table term_deposit(
AccountId int primary key,
InterestRate float,
DurationMonth int,
foreign key (AccountId) references account(AccountId)
);

create table current_account(
AccountId int primary key,
CardNumber varchar(30),
OwerName varchar(30),
Flag varchar(20),
foreign key (AccountId) references account(AccountId)
);


insert into person values (1,'Colin','Morgan','1999-01-01');
insert into person values (2,'John','Morgan','1999-01-01');
insert into person values (3,'Mike','Ross','1999-01-01');
insert into person values (4,'Nathen','Smith','1999-01-01');
insert into person values (5,'Musk','Luis','1999-01-01');
insert into person values (6,'Lucy','Ross','1999-01-01');
insert into person values (7,'Frank','Morgan','1999-01-01');
insert into person values (8,'Joden','Morgan','1999-01-01');
insert into person values (9,'Sophie','Trump','1999-01-01');
insert into person values (10,'Linsay','Lee','1989-11-01');

insert into phone_chl values (1,131000121);
insert into phone_chl values (2,131001111);
insert into phone_chl values (3,13102341);
insert into phone_chl values (4,131023101);
insert into phone_chl values (5,131345171);
insert into phone_chl values (1,131000191);
insert into phone_chl values (2,176341131);
insert into phone_chl values (3,181122341);
insert into phone_chl values (7,156001111);
insert into phone_chl values (6,13802341);

insert into email_chl values (1,'131000121@gmail.com');
insert into email_chl values (2,'131001111@gmail.com');
insert into email_chl values (3,'13102341@gmail.com');
insert into email_chl values (4,'131023101@gmail.com');
insert into email_chl values (5,'131345171@gmail.com');
insert into email_chl values (1,'131000191@gmail.com');
insert into email_chl values (2,'176341131@gmail.com');
insert into email_chl values (3,'181122341@gmail.com');
insert into email_chl values (7,'156001111@gmail.com');
insert into email_chl values (6,'13802341@gmail.com');

insert into opt_email_info values(1,'2021-06-21','credit card','not interested','out',null,1,'131000121@gmail.com');
insert into opt_email_info values(2,'2021-08-21','deposit','too much communication','out',null,2,'131001111@gmail.com');
insert into opt_email_info values(3,'2021-08-22','deposit','wrong email address','out',null,4,'131023101@gmail.com');
insert into opt_email_info values(4,'2021-08-28','deposit','interested in savings','in',2,2,'131001111@gmail.com');
insert into opt_email_info values(5,'2021-08-29','repayment','contest January','in',null,3,'181122341@gmail.com');

insert into opt_phone_info values(1,'2021-06-21','credit card','not interested','out',null,5,131345171);
insert into opt_phone_info values(2,'2021-08-21','deposit','too much communication','out',null,6,13802341);
insert into opt_phone_info values(3,'2021-08-22','deposit','wrong phone number','out',null,3,13102341);
insert into opt_phone_info values(4,'2021-08-28','deposit','interested in savings','in',2,6,13802341);
insert into opt_phone_info values(5,'2021-08-29','repayment','contest January','in',4,3,13102341);


insert into account values(101,500,'2018-01-01',null,1);
insert into account values(102,15000,'2015-01-01',null,2);
insert into account values(103,5000,'2016-01-01',null,1);
insert into account values(104,12000,'2017-01-01',null,3);
insert into account values(105,5000,'2018-01-01',null,4);
insert into account values(106,5000,'2019-01-01',null,2);
insert into account values(107,80,'2017-01-01',null,4);
insert into account values(108,5000,'2018-11-01',null,5);
insert into account values(109,9000,'2018-01-11',null,6);
insert into account values(110,500,'2020-01-01',null,7);
insert into saving_account values(101,0.022);
insert into saving_account values(106,0.022);
insert into saving_account values(104,0.022);
insert into term_deposit values(102,0.025,3);
insert into term_deposit values(105,0.025,3);
insert into term_deposit values(107,0.025,4);

insert into current_account values(103,'C1002341','XAF','Debit');
insert into current_account values(108,'C10234W','XAF','Credit');
insert into current_account values(109,'C1342231','XAF','Credit');


-- queries
-- 1
select distinct ec.Email
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
where oei.OptReason like '%too much communication%' and timestampdiff(MONTH,oei.OptDate,now())<=6;

-- 2

select p.*, pc.PhoneNbr
from person p join account a on p.PersonId = a.PersonId
join phone_chl pc on a.PersonId = pc.PersonId
join opt_phone_info opi on pc.PersonId = opi.PersonId and pc.PhoneNbr = opi.PhoneNbr
left join saving_account sa on a.AccountId = sa.AccountId
left join term_deposit td on a.AccountId = td.AccountId
where a.Balance>10000 and td.InterestRate is null and sa.InterestRate is not null
and opi.InOutFlag='in';

-- 3
select p.FirstName,p.LastName,monthname(p.BirthDate) as monthBirth,
case when a.Balance>=1000 and a.Balance<5000 then 'Light saver'
when a.Balance>=5000 and a.Balance<25000 then 'Medium saver'
when a.Balance>25000 then 'Heavy saver' end as balanceCategory
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
join account a on p.PersonId = a.PersonId
left join saving_account sa on a.AccountId = sa.AccountId
left join current_account ca on a.AccountId = ca.AccountId
where year(now())-year(p.BirthDate)>18 and a.Balance>1000
and oei.InOutFlag='in'
and sa.InterestRate is not null and (ca.Flag!='Credit' or ca.Flag is null);






-- sql server queries
-- 1
select distinct ec.Email
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
where oei.OptReason like '%too much communication%' and datediff(MONTH,oei.OptDate,getdate())<=6;

-- 2

select p.*, pc.PhoneNbr
from person p join account a on p.PersonId = a.PersonId
join phone_chl pc on a.PersonId = pc.PersonId
join opt_phone_info opi on pc.PersonId = opi.PersonId and pc.PhoneNbr = opi.PhoneNbr
left join saving_account sa on a.AccountId = sa.AccountId
left join term_deposit td on a.AccountId = td.AccountId
where a.Balance>10000 and td.InterestRate is null and sa.InterestRate is not null
and opi.InOutFlag='in';

-- 3
select p.FirstName,p.LastName,datename(month,p.BirthDate) as monthBirth,
case when a.Balance>=1000 and a.Balance<5000 then 'Light saver'
when a.Balance>=5000 and a.Balance<25000 then 'Medium saver'
when a.Balance>25000 then 'Heavy saver' end as balanceCategory
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
join account a on p.PersonId = a.PersonId
left join saving_account sa on a.AccountId = sa.AccountId
left join current_account ca on a.AccountId = ca.AccountId
where year(getdate())-year(p.BirthDate)>18 and a.Balance>1000
and oei.InOutFlag='in'
and sa.InterestRate is not null and (ca.Flag!='Credit' or ca.Flag is null);




-- below draft--
-- queries
-- 1
select distinct ec.Email
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
where oei.OptReason like '%too much communication%' and timestampdiff(MONTH,oei.OptDate,now())<=6;

-- 2
select p.*, a.*
from person p join account a on p.PersonId = a.PersonId
join email_chl ec on a.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
left join saving_account sa on a.AccountId = sa.AccountId
left join term_deposit td on a.AccountId = td.AccountId
where a.Balance>=10000 and td.InterestRate is null and sa.InterestRate is not null
and oei.InOutFlag='in'
union
select p.*, a.*
from person p join account a on p.PersonId = a.PersonId
join saving_account sa on a.AccountId = sa.AccountId
join phone_chl pc on a.PersonId = pc.PersonId
join opt_phone_info opi on pc.PersonId = opi.PersonId and pc.PhoneNbr = opi.PhoneNbr
left join term_deposit td on a.AccountId = td.AccountId
where a.Balance>=10000 and td.InterestRate is null
and opi.InOutFlag='in';

-- 3
select p.FirstName,p.LastName,monthname(p.BirthDate) as monthBirth,
case when a.Balance>=1000 and a.Balance<5000 then 'Light saver'
when a.Balance>=5000 and a.Balance<25000 then 'Medium saver'
when a.Balance>25000 then 'Heavy saver' end as balanceCategory
from person p join email_chl ec on p.PersonId = ec.PersonId
join opt_email_info oei on ec.PersonId = oei.PersonId and ec.Email = oei.Email
join account a on p.PersonId = a.PersonId
left join saving_account sa on a.AccountId = sa.AccountId
left join current_account ca on a.AccountId = ca.AccountId
where year(now())-year(p.BirthDate)>18 and a.Balance>1000
and oei.InOutFlag='in'
and sa.InterestRate is not null and (ca.Flag!='Credit' or ca.Flag is null);
