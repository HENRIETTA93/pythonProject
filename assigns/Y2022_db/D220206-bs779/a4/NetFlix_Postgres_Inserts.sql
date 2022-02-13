INSERT INTO Membership(MembershipId,MembershipType,MembershipLimitPerMonth,
        MembershipMonthlyPrice,MembershipMonthlyTax,MembershipDVDLostPrice) 
    VALUES(1,'3 DVDs at-a-time',99,17.99,1.79,25.00);
INSERT INTO Membership(MembershipId,MembershipType,MembershipLimitPerMonth,
        MembershipMonthlyPrice,MembershipMonthlyTax,MembershipDVDLostPrice) 
    VALUES(2,'2 DVDs at-a-time',4,11.99,1.19,25.00);


INSERT INTO State(StateId,StateName) VALUES (1,'California');
INSERT INTO State(StateId,StateName) VALUES (2,'Delaware');
INSERT INTO State(StateId,StateName) VALUES (3,'Florida');
INSERT INTO State(StateId,StateName) VALUES (4,'Georgia');
INSERT INTO State(StateId,StateName) VALUES (5,'Iowa');
INSERT INTO State(StateId,StateName) VALUES (6,'New Jersey');
INSERT INTO State(StateId,StateName) VALUES (7,'New York');
INSERT INTO State(StateId,StateName) VALUES (8,'Maryland');
INSERT INTO State(StateId,StateName) VALUES (9,'Pennsylvania');
INSERT INTO State(StateId,StateName) VALUES (10,'Texas');

INSERT INTO City(CityID,CityName) VALUES (1,'Sacramento');
INSERT INTO City(CityID,CityName) VALUES (2,'Ewing');
INSERT INTO City(CityID,CityName) VALUES (3,'New York');
INSERT INTO City(CityID,CityName) VALUES (4,'Palm Coast');
INSERT INTO City(CityID,CityName) VALUES (5,'Harrisburg');
INSERT INTO City(CityID,CityName) VALUES (6,'York');
INSERT INTO City(CityID,CityName) VALUES (7,'Jacksonville');
INSERT INTO City(CityID,CityName) VALUES (8,'Atlanta');
INSERT INTO City(CityID,CityName) VALUES (9,'Washington');
INSERT INTO City(CityID,CityName) VALUES (10,'Austin');
INSERT INTO City(CityID,CityName) VALUES (11,'Wilmington');
INSERT INTO City(CityID,CityName) VALUES (12,'Columbia');
INSERT INTO City(CityID,CityName) VALUES (13,'Marbury');
INSERT INTO City(CityID,CityName) VALUES (14,'Los Angeles');


INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (1,'94203',1,1);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (2,'08628',2,6);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (3,'10001',3,7);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (4,'32035',4,3);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (5,'17100',5,9);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (6,'17400',6,9);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (7,'32099',7,3);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (8,'30029',8,4);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (9,'30673',9,4);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (10,'73301',10,10);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (11,'19850',11,2);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (12,'50057',12,5);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (13,'20658',13,8);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (14,'90080',14,1);
INSERT INTO ZipCode(ZipCodeId,ZipCode,CityId,StateId) VALUES (15,'90019',14,1);


DO $$
DECLARE  
    DECLARE v_AddYears INT := Date_Part('YEAR', CURRENT_DATE) - 2005;
begin
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (1,'Will','Smith','101 Will Street',1,'will.smith@mib.com','W1ll1m!',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/01');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (2,'John','Gore','45 5th Ave',2,'john45@yahoo.com','J0HnGoRe',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (3,'Mike','Sawicki','10 Penn Blvd',3,'mikesawicki@aol.com','Saw13ki',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/09');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (4,'Ramesh','Mandadi','9 Avelon Apt',4,'ramesh1@yahoo.com','Ram3sh',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/11');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (5,'Frank','Cruthers','1129 Jackson Rd',5,'franky@aol.com','qW1est',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (6,'Rich','Sentveld','1001 Plainsboro Rd',6,'richard@aol.com','R1chArd',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (7,'George','Lemon','29456 Upper Ferry Rd',7,'glemon@aol.com','ImG3m0n',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/14');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (8,'Haby','Tanjung','5 River Rd',8,'ht@hasby.com','T1c00l',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (9,'Cathy','Carol','59 Eaton Twon',9,'carol@hotmail.com','C9thC3ty',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (10,'Marji','Keho','2365 Merci Blvd',10,'marji.keho@merci.com','M1rjii',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (11,'Clint','Eastwood','90 Hill Rd',11,'eastwoodc@gmail.com','Clint12',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
     VALUES (12,'Bruce','Willis','1740 Erford Rd',12,'brucewillis@aol.com','YgDm3n',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/21');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
    VALUES (13,'Yong','Lee','1 Yong-Yong Park',13,'yonglee@lee1.com','Y0ngY0ng',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/28');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
     VALUES (14,'Jerald','Parekh','3434 Campus Rd',14,'jer9439@hotmail.com','C0sm0s',2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/29');
INSERT INTO Member(MemberId,MemberFirstName,MemberLastName,MemberAddress,
    MemberAddressId,MemberEMail,MemberPassword,MembershipId,MemberSinceDate)
   VALUES (15,'Kristy','Hanifin','67 Jackob Creek Rd',15,'kristine@aol.com','ImKr1sty',1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/29');

INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (1,1,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/01',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/01');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (2,2,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/02');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (3,3,13.18,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/09',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/09');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (4,4,19.98,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/11',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/11');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (5,5,13.18,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/12');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (6,6,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/12');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (7,7,13.18,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/14',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/14');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (8,8,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/15');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (9,9,13.18,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/15');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (10,10,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/19');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (11,11,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/19');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (12,12,19.98,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/21',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/21');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (13,1,25.00,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/21',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/01');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (14,13,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/28',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/28');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (15,14,13.18,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/29',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/29');
INSERT INTO Payment(PaymentId,MemberId,AmountPaid,AmountPaidDate,AmountPaidUntilDate)
    VALUES (16,15,19.78,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/29',v_AddYears * INTERVAL '1 YEAR' + date '2004/03/29');


INSERT INTO Genre(GenreId,GenreName) VALUES (1,'Action');
INSERT INTO Genre(GenreId,GenreName) VALUES (2,'Adventure');
INSERT INTO Genre(GenreId,GenreName) VALUES (3,'Comedy');
INSERT INTO Genre(GenreId,GenreName) VALUES (4,'Crime');
INSERT INTO Genre(GenreId,GenreName) VALUES (5,'Drama');
INSERT INTO Genre(GenreId,GenreName) VALUES (6,'Epics');
INSERT INTO Genre(GenreId,GenreName) VALUES (7,'Musicals');
INSERT INTO Genre(GenreId,GenreName) VALUES (8,'Science Fiction');
INSERT INTO Genre(GenreId,GenreName) VALUES (9,'War'); 
INSERT INTO Genre(GenreId,GenreName) VALUES (10,'Western'); 
INSERT INTO Genre(GenreId,GenreName) VALUES (11,'Romance'); 
INSERT INTO Genre(GenreId,GenreName) VALUES (12,'Horror'); 


INSERT INTO Rating(RatingId,RatingName,RatingDescription) VALUES (1,'G','General Audiences. All ages admitted.');
INSERT INTO Rating(RatingId,RatingName,RatingDescription) VALUES (2,'PG','Parental Guidance suggested. Some material
 may not be suitable for children.');
INSERT INTO Rating(RatingId,RatingName,RatingDescription) VALUES (3,'PG-13','Parent strongly cautioned. Some material may be inappropriate for children under 13.');
INSERT INTO Rating(RatingId,RatingName,RatingDescription) VALUES (4,'R','Restricted. Under 17 requires accompanying parent or adult guardian.');
INSERT INTO Rating(RatingId,RatingName,RatingDescription) VALUES (5,'NC-17','No one 17 and under admitted.');


INSERT INTO Role(RoleId,RoleName) VALUES (1,'Actor');
INSERT INTO Role(RoleId,RoleName) VALUES (2,'Actoress');
INSERT INTO Role(RoleId,RoleName) VALUES (3,'Director');
INSERT INTO Role(RoleId,RoleName) VALUES (4,'Producer');
INSERT INTO Role(RoleId,RoleName) VALUES (5,'Screenwriter');


INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (1,'Bill','Murry',date '1950/09/21');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (2,'Steven','Spielberg',date '1946/12/18');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (3,'Tom','Hanks',date '1956/07/09');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (4,'Leonardo','DiCaprio',date '1974/11/11');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonInitial,PersonDateOfBirth)
    VALUES (5,'Night','Shyamalan','M',date '1970/08/06');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (6,'Bruce','Willis',date '1955/03/19');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (7,'Catherine','Zeta-Zones',date '1969/09/20');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (8,'Clint','Eastwood',date '1930/05/31');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (9,'Sean','Penn',date '1960/08/17');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (10,'Kevin','Bacon',date '1958/06/29');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (11,'Irvin','Kreshner',date '1923/04/29');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (12,'Sean','Connery',date '1930/09/25');
INSERT INTO MoviePerson(PersonId,PersonFirstName,PersonLastName,PersonDateOfBirth)
    VALUES (13,'Kim','Basinger',date '1953/12/08');


INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (1,'Groundhog Day',3,2,date '2002/01/22',date '2001/01/22',9,0,1);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (2,'The Terminal',5,2,date '2003/11/23',date '2003/01/22',9,1,0);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (3,'Catch Me If You Can',5,3,date '2003/05/06',date '2002/01/04',10,0,0);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (4,'The Sixth Sense',12,4,date '2000/03/28',date '1999/05/01',9,1,0);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (5,'Pale Rider',10,4,date '1997/11/19',date '1985/11/15',0,1,0);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (6,'Mystic River',5,4,date '2004/01/08',date '2003/05/08',10,0,0);
INSERT INTO DVD(DVDId,DVDTitle,GenreId,RatingId,DVDReleaseDate,
        TheaterReleaseDate,DVDQuantityOnHand,DVDQuantityOnRent,DVDLostQuantity)
    VALUES (7,'Never Say Never Again',1,1,date '2000/10/17',date '1983/05/08',10,0,0);



INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(1,1,1);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(2,3,2);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(2,3,3);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(3,1,2);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(3,1,3);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(4,1,3);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(5,3,4);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(5,1,4);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(5,4,4);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(6,1,4);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(7,2,2);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(8,1,5);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(8,3,5);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(8,4,5);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(8,3,6);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(8,4,6);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(9,1,6);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(10,1,6);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(11,3,7);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(12,1,7);
INSERT INTO MoviePersonRole(PersonId,RoleId,DVDId) VALUES(13,2,7);



INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate,RentalReturnedDate)
 VALUES (1,1,4,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/09');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate,RentalReturnedDate)
 VALUES (2,1,6,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/09');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate,RentalReturnedDate)
 VALUES (3,1,3,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/02',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/09');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate)
 VALUES (4,5,4,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate)
 VALUES (5,5,5,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/15');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate,RentalReturnedDate)
 VALUES (6,15,1,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/12',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/21');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate)
 VALUES (7,9,2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/19');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate)
 VALUES (8,8,2,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/20',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/21');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate,RentalShippedDate)
 VALUES (9,1,4,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/20',v_AddYears * INTERVAL '1 YEAR' + date '2004/02/20');
INSERT INTO Rental(RentalId,MemberId,DVDId,RentalRequestDate)
 VALUES (10,15,7,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/29');


INSERT INTO RentalQueue(MemberId,DVDId,DateAddedInQueue)
 VALUES (12,5,v_AddYears * INTERVAL '1 YEAR' + date '2004/02/22');
end $$;
