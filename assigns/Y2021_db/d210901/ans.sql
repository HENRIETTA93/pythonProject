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

create table opt_in_out(
OptId int primary key,
OptDate date,
OpteReason varchar(20),
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