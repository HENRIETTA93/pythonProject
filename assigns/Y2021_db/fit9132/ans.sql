set echo on;

spool output.txt

drop table ClassStaff;
drop table MemberAttend;
drop table ClassMember;
drop table CentreClass;
drop table Class;
drop table Centre;
drop table StaffMember;
drop table Address;

create table Address(
Postcode varchar2(20) primary key,
Town varchar2(50),
Street varchar2(50)
);

create table Centre(
CentreID Number(5) primary key,
CentreName varchar2(50),
Postcode varchar2(20),
foreign key(Postcode) references Address(Postcode)
);

create table Class(
ClassNumber Number(5) primary key,
ClassType varchar2(20),
ClassDescription varchar2(40),
FacilityRoomNo Number(5),
StartDate Date,
StartTime Timestamp,
NoofSessions Number(5)
);

create table CentreClass(
CentreID Number(5),
ClassNumber Number(5),
primary key (CentreID, ClassNumber),
foreign key(CentreID) references Centre(CentreID),
foreign key(ClassNumber) references Class(ClassNumber)
);

create table ClassMember(
ClassNumber Number(5),
MemberNo Number(5),
PaymentDate Date,
TotalAttendance Number(5),
primary key(ClassNumber,MemberNo),
foreign key(ClassNumber) references Class(ClassNumber)
);



create table MemberAttend(
ClassNumber Number(5),
MemberNo Number(5),
SessionDate Date,
Attendance varchar2(20),
primary key(ClassNumber,MemberNo,SessionDate),
foreign key(ClassNumber,MemberNo) references ClassMember(ClassNumber,MemberNo)
);


create table StaffMember(
StaffID Number(5) primary key,
StaffName varchar2(20),
ClassLeader varchar2(5),
FirstAidCertified varchar2(5)
);

create table ClassStaff(
ClassNumber Number(5),
StaffID Number(5),
primary key(ClassNumber,StaffID),
foreign key(ClassNumber) references Class(ClassNumber),
foreign key(StaffID) references StaffMember(StaffID)
);




spool off;

set echo off;