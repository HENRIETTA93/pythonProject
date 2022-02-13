CREATE TABLE City(
CityId      numeric(10) NOT NULL,
CityName    varchar(32) NOT NULL,
CONSTRAINT City_CityId_PK PRIMARY KEY (CityId));

CREATE TABLE State(
StateId     numeric(2)  NOT NULL,
StateName   varchar(20) NOT NULL,
CONSTRAINT State_StateId_PK PRIMARY KEY (StateId));

CREATE TABLE ZipCode(
ZipCodeId   numeric(10) NOT NULL,
ZipCode     varchar(5)  NOT NULL,
StateId     numeric(2),
CityId      numeric(10),
CONSTRAINT ZipCode_ZipCodeId_PK PRIMARY KEY (ZipCodeId),
CONSTRAINT ZipCode_StateId_FK FOREIGN KEY (StateId) REFERENCES State(StateId),
CONSTRAINT ZipCode_CityId_FK FOREIGN KEY (CityId) REFERENCES City(CityId));


CREATE TABLE Membership(
MembershipId        numeric(10) NOT NULL,
MembershipType      varchar(128)    NOT NULL,
MembershipLimitPerMonth numeric(2)  NOT NULL,
MembershipMonthlyPrice  numeric(5,2)    NOT NULL,
MembershipMonthlyTax    numeric(5,2)    NOT NULL,
MembershipDVDLostPrice  numeric(5,2)    NOT NULL,
CONSTRAINT Membership_MembershipId_PK PRIMARY KEY (MembershipId));

CREATE TABLE Member(
MemberId        numeric(12) NOT NULL,
MemberFirstName     varchar(32) NOT NULL,
MemberLastName      varchar(32) NOT NULL,
MemberInitial       varchar(32),
MemberAddress       varchar(100)    NOT NULL,
MemberAddressId     numeric(10) NOT NULL,
MemberPhone     varchar(14),
MemberEMail     varchar(32) NOT NULL,
MemberPassword      varchar(32) NOT NULL,
MembershipId        numeric(10) NOT NULL,
MemberSinceDate     TIMESTAMP(3)        NOT NULL,
CONSTRAINT Member_MemberId_PK PRIMARY KEY (MemberId),
CONSTRAINT Member_MemberAddId_FK 
    FOREIGN KEY (MemberAddressId) REFERENCES ZipCode(ZipCodeId),
CONSTRAINT Member_MembershipId_FK
    FOREIGN KEY (MembershipId) REFERENCES Membership);

CREATE TABLE Payment(
PaymentId       numeric(16) NOT NULL,
MemberId        numeric(12) NOT NULL,
AmountPaid      numeric(8,2)    NOT NULL,
AmountPaidDate      TIMESTAMP(3)        NOT NULL,
AmountPaidUntilDate TIMESTAMP(3)        NOT NULL,
CONSTRAINT Payment_PaymentId_PK PRIMARY KEY (PaymentId),
CONSTRAINT Payment_MemberId_FK FOREIGN KEY (MemberId) REFERENCES Member(MemberId));

CREATE TABLE Genre(
GenreId         numeric(2)  NOT NULL,
GenreName       varchar(20) NOT NULL,
CONSTRAINT Genre_GenreId_PK PRIMARY KEY (GenreId));


CREATE TABLE Rating(
RatingId        numeric(2)  NOT NULL,
RatingName      varchar(10) NOT NULL,
RatingDescription   varchar(255)    NOT NULL,
CONSTRAINT Rating_RatingId_PK PRIMARY KEY (RatingId));


CREATE TABLE Role(
RoleId          numeric(2)  NOT NULL,
RoleName        varchar(20) NOT NULL,
CONSTRAINT Role_RoleId_PK PRIMARY KEY (RoleId));


CREATE TABLE MoviePerson(
PersonId        numeric(12) NOT NULL,
PersonFirstName     varchar(32) NOT NULL,
PersonLastName      varchar(32) NOT NULL,
PersonInitial       varchar(32),        
PersonDateOfBirth   TIMESTAMP(3),
CONSTRAINT MoviePerson_PersonId_PK PRIMARY KEY (PersonId));

CREATE TABLE DVD(
DVDId           numeric(16) NOT NULL,
DVDTitle        varchar(32) NOT NULL,
GenreId         numeric(2)  NOT NULL,
RatingId        numeric(2)  NOT NULL,
DVDReleaseDate      TIMESTAMP(3)        NOT NULL,
TheaterReleaseDate  TIMESTAMP(3),
DVDQuantityOnHand   numeric(8)  NOT NULL,
DVDQuantityOnRent   numeric(8)  NOT NULL,
DVDLostQuantity     numeric(8)  NOT NULL,
CONSTRAINT DVD_DVDId_PK PRIMARY KEY (DVDId),
CONSTRAINT DVD_GenreId_FK FOREIGN KEY (GenreId) REFERENCES Genre(GenreId),
CONSTRAINT DVD_RatingId FOREIGN KEY (RatingId) REFERENCES Rating(RatingId));

CREATE TABLE RentalQueue(
MemberId        numeric(12) NOT NULL,
DVDId           numeric(16) NOT NULL,
DateAddedInQueue    TIMESTAMP(3)        NOT NULL,
CONSTRAINT RentalQueue_MemberId_DVDId_PK PRIMARY KEY (MemberId,DVDId),
CONSTRAINT RentalQueue_MemberId_FK FOREIGN KEY (MemberId) REFERENCES Member(MemberId),
CONSTRAINT RentalQueue_DVDId_FK FOREIGN KEY (DVDId) REFERENCES DVD(DVDId));

CREATE TABLE MoviePersonRole(
PersonId        numeric(12) NOT NULL,
RoleId          numeric(2)  NOT NULL,
DVDId           numeric(16) NOT NULL,
CONSTRAINT MoviePersonRole_PK PRIMARY KEY (PersonId,DVDId,RoleId),
CONSTRAINT MoviePersonRole_PersonId_FK FOREIGN KEY (PersonId) REFERENCES MoviePerson(PersonId),
CONSTRAINT MoviePersonRole_DVDId_FK FOREIGN KEY (DVDId) REFERENCES DVD(DVDId),
CONSTRAINT MoviePersonRole_RoleId_FK FOREIGN KEY (RoleId) REFERENCES Role(RoleId));

CREATE TABLE Rental(
RentalId        numeric(16) NOT NULL,
MemberId        numeric(12) NOT NULL,
DVDId           numeric(16) NOT NULL,
RentalRequestDate   TIMESTAMP(3)        NOT NULL,
RentalShippedDate   TIMESTAMP(3),
RentalReturnedDate  TIMESTAMP(3),
CONSTRAINT Rental_RentalId_PK PRIMARY KEY (RentalId),
CONSTRAINT Rental_MemberId_FK FOREIGN KEY (MemberId) REFERENCES Member(MemberId),
CONSTRAINT Rental_DVDId_FK FOREIGN KEY (DVDId) REFERENCES DVD(DVDId));
