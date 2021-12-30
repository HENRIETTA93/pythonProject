
create table Address (
AddressID int primary key,
Address varchar(50) not null,
City varchar(30),
State varchar(30),
PostalCode char(10),
Country varchar(30)
);

create table Applicant (
CandidateID int primary key,
NationalID varchar(25) not null,
Name varchar(40) not null,
Religion varchar(30),
AddressID int,
DaytimePhone varchar(12),
NightPhone varchar(12),
EmailAddress varchar(30),
DateOfBirth date,
Gender char(1),
foreign key (AddressID) references Address(AddressID),
unique (NationalID),
check(Gender in ('F', 'M'))
);

create table Application (
ApplicationID int primary key,
CandidateID int,
EssayName text,
Photo varchar(100),
VideoID varchar(100),
Ratings int,
Producer varchar(40),
Director varchar (40),
foreign key (CandidateID) references Applicant(CandidateID)
);

create table ApplicantMedications (
CandidateID int,
Medication varchar(30),
Reason text,
primary key (CandidateID, Medication),
foreign key (CandidateID) references Applicant(CandidateID)
);

create table ApplicantJobs (
CandidateID int,
Job varchar(30),
Start date,
End date,
Description text,
primary key (CandidateID,Job),
foreign key (CandidateID) references Applicant(CandidateID)
);


create table BackgroundCheck (
CheckID int primary key,
CandidateID int,
AppearanceRating int,
StrengthRating int,
foreign key (CandidateID) references Applicant(CandidateID)
);

create table BackEmployer (
EmployerID int,
CandidateID int,
Employer varchar(40) not null,
Phone varchar(12),
Comments text,
primary key (EmployerID, CandidateID),
foreign key (CandidateID) references Applicant(CandidateID)
);

create table BackEducation (
EducationID int,
CandidateID int,
Education varchar(50),
Contact varchar(12),
Degree varchar(50),
Comments text,
primary key (EducationID, CandidateID),
foreign key (CandidateID) references Applicant(CandidateID)
);

create table BackPoliceJudicialRecords (
CandidateID int,
RecordID int,
Date date,
Category varchar(40),
Description text,
Outcome text,
primary key(CandidateID,RecordID),
foreign key (CandidateID) references Applicant(CandidateID)
);


create table Episodes (
EpisodeID int primary key,
EpisodeTitle varchar(100) not null,
EpisodeAirDate date
);
create table Events (
EventID int primary key,
EpisodeID int,
EventTitle varchar(100) not null,
Description text,
EstimatedTime int,
EstimatedDanger int check(EstimatedDanger>=1 and EstimatedDanger<=10),
Producer varchar(40),
Director varchar(40),
foreign key(EpisodeID) references Episodes(EpisodeID)
);

create table Tasks (
TaskID int primary key,
EventID int not null,
TaskName varchar(100),
foreign key (EventID) references Events(EventID)
);
create table Actions (
SeqID int primary key,
TaskID int,
Description text,
Cameras text,
EstTime int,
foreign key(TaskID) references Tasks(TaskID)
);
create table ContestantTask (
TaskID int,
CandidateID int,
Result varchar(30),
Points int check (Points>=-10 and Points<=10),
Prize varchar(20),
primary key (TaskID, CandidateID),
foreign key (TaskID) references Tasks(TaskID),
foreign key (CandidateID) references Applicant(CandidateID)
);

create table Voting (
VotingID int primary key,
EpisodeID int,
foreign key(EpisodeID) references Episodes(EpisodeID)
);

create table ContestantVoting (
VotingID int,
CandidateID int,
Region varchar(20),
Method varchar(50),
TotalVotes int,
primary key (VotingID, CandidateID,Region, Method),
foreign key (VotingID) references Voting(VotingID),
foreign key (CandidateID) references Applicant(CandidateID)
);



