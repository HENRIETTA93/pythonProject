--CSE2/4DBF Assignment 2 - 2021
--Schema Definition
--Archie's Luxury Motors

DROP TABLE Manufacturer cascade constraints;
DROP TABLE Model cascade constraints;
DROP TABLE Car cascade constraints;
DROP TABLE Feature cascade constraints;
DROP TABLE CarFeature cascade constraints;
DROP TABLE Customer cascade constraints;
DROP TABLE CustomerPreference cascade constraints;
DROP TABLE SalesAgent cascade constraints;
DROP TABLE SeniorAgent cascade constraints;
DROP TABLE JuniorAgent cascade constraints;
DROP TABLE SalesTransaction cascade constraints;
DROP TABLE ViewingParty cascade constraints;
DROP TABLE Organisation cascade constraints;
DROP TABLE InternationalGuests cascade constraints;
DROP TABLE CarsViewed cascade constraints;

--PURGE RECYCLEBIN;

----- CREATE TABLE STATEMENTS -----

CREATE TABLE Manufacturer(
manufacturerID    VARCHAR2(10)  NOT NULL,
name     VARCHAR2(20),
region   VARCHAR2(20) CHECK(region IN('ASIA', 'AFRICA', 'NORTH AMERICA', 'SOUTH AMERICA', 'EUROPE', 'OCEANIA')),
PRIMARY KEY(manufacturerID));


CREATE TABLE Model(
modelNo      VARCHAR2(10)  NOT NULL,
name   VARCHAR2(20),
type VARCHAR2(20) CHECK(type IN('CONVERTIBLE', 'HYBRID', 'LUXURY', 'SUV', 'VAN', 'COUPE', 'SEDAN', 'WAGON', 'HATCH', 'SPORTS', 'ROADSTER')),
previousModel VARCHAR2(10),
manufacturerID VARCHAR2(10),
PRIMARY KEY(modelNo),
FOREIGN KEY(previousModel) REFERENCES Model(modelNo),
FOREIGN KEY(manufacturerID) REFERENCES Manufacturer(manufacturerID));


CREATE TABLE Car(
VIN      VARCHAR2(17)  NOT NULL,
dateAcquired   DATE,
yearBuilt  NUMBER(4) CHECK(yearBuilt >1980),
purchasedPrice  NUMBER(10,2),
askingPrice NUMBER(10,2),
currentMileage NUMBER(7),
color VARCHAR2(20),
modelNo VARCHAR2(10),
PRIMARY KEY(VIN),
FOREIGN KEY(modelNo) REFERENCES Model(modelNo));


CREATE TABLE Feature(
featureID VARCHAR2(10) NOT NULL,
description VARCHAR2(50),
category VARCHAR2(20) CHECK(category IN('TRANSMISSION', 'AV', 'COMFORT', 'ENGINE','EXTERIOR', 'ELECTRONICS', 'INTERIOR', 'LIGHTS', 'SAFETY', 'SECURITY', 'SEATING', 'STEERING', 'SUSPENSION')),
PRIMARY KEY(featureID));


CREATE TABLE CarFeature(
VIN VARCHAR2(17) NOT NULL,
featureID VARCHAR2(10) NOT NULL,
PRIMARY KEY(VIN, featureID),
FOREIGN KEY(VIN) REFERENCES CAR(VIN),
FOREIGN KEY(featureID) REFERENCES Feature(featureID));


CREATE TABLE Customer(
custID    VARCHAR2(10)  NOT NULL,
name     VARCHAR2(20),
DOB DATE,
streetAddress   VARCHAR2(50),
suburb      VARCHAR2(20),
postcode    NUMBER(4),
gender      CHAR(1)   CHECK(gender IN('M','m','F','f')),
phoneNo		VARCHAR2(20),
email      VARCHAR2(50),
type    VARCHAR2(7) CHECK(type IN('VIP', 'REGULAR')),
PRIMARY KEY(custID));


CREATE TABLE CustomerPreference(
custID VARCHAR2(10) NOT NULL,
featureID VARCHAR2(10) NOT NULL,
PRIMARY KEY(custID, featureID),
FOREIGN KEY(custID) REFERENCES Customer(custID),
FOREIGN KEY(featureID) REFERENCES Feature(featureID));


CREATE TABLE SalesAgent(
agentID    VARCHAR2(10)  NOT NULL,
name     VARCHAR2(50),
DOB DATE,
PRIMARY KEY(agentID));


CREATE TABLE SeniorAgent(
agentID    VARCHAR2(10)  NOT NULL,
yearPromoted   DATE,
PRIMARY KEY(agentID),
FOREIGN KEY(agentID) REFERENCES SalesAgent(agentID));


CREATE TABLE JuniorAgent(
agentID    VARCHAR2(10)  NOT NULL,
supervisor   VARCHAR2(10) NOT NULL,
PRIMARY KEY(agentID),
FOREIGN KEY(agentID) REFERENCES SalesAgent(agentID),
FOREIGN KEY(supervisor) REFERENCES SeniorAgent(agentID));


CREATE TABLE SalesTransaction(
VIN    VARCHAR2(17)  NOT NULL,
custID   VARCHAR2(10) NOT NULL,
agentID   VARCHAR2(10) NOT NULL,
dateOfSale DATE,
agreedPrice NUMBER(10,2),
PRIMARY KEY(VIN, custID, agentID),
FOREIGN KEY(VIN) REFERENCES Car(VIN),
FOREIGN KEY(custID) REFERENCES Customer(custID),
FOREIGN KEY(agentID) REFERENCES SalesAgent(agentID));


CREATE TABLE ViewingParty(
viewingPartyID    VARCHAR2(10)  NOT NULL,
contactNo   VARCHAR2(20),
email VARCHAR2(50),
PRIMARY KEY(viewingPartyID));


CREATE TABLE Organisation(
viewingPartyID    VARCHAR2(10)  NOT NULL,
name   VARCHAR2(20),
PRIMARY KEY(viewingPartyID),
FOREIGN KEY(viewingPartyID) REFERENCES ViewingParty(viewingPartyID));


CREATE TABLE InternationalGuests(
viewingPartyID    VARCHAR2(10)  NOT NULL,
country   VARCHAR2(20),
PRIMARY KEY(viewingPartyID),
FOREIGN KEY(viewingPartyID) REFERENCES ViewingParty(viewingPartyID));


CREATE TABLE CarsViewed(
VIN    VARCHAR2(17)  NOT NULL,
viewingPartyID    VARCHAR2(10)  NOT NULL,
dateViewed DATE  NOT NULL,
amountPaid NUMBER(10,2) NOT NULL,
PRIMARY KEY(VIN, viewingPartyID, dateViewed),
FOREIGN KEY(VIN) REFERENCES Car(VIN),
FOREIGN KEY(viewingPartyID) REFERENCES ViewingParty(viewingPartyID));

-----END CREATE TABLE STATEMENTS-----



-----INSERT STATEMENTS FOR MANUFACTURER-----

INSERT INTO Manufacturer
VALUES
('1', 'Audi', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('2', 'BMW', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('3', 'Mazda', 'ASIA');

INSERT INTO Manufacturer
VALUES
('4', 'Mercedes-Benz', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('5', 'Nissan', 'ASIA');

INSERT INTO Manufacturer
VALUES
('6', 'Holden', 'OCEANIA');

INSERT INTO Manufacturer
VALUES
('7', 'Toyota', 'ASIA');

INSERT INTO Manufacturer
VALUES
('8', 'Ferrari', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('9', 'Lamborghini', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('10', 'Bugatti', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('11', 'Jaguar', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('12', 'Porsche', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('13', 'Maserati', 'EUROPE');

INSERT INTO Manufacturer
VALUES
('14', 'Tesla Motors', 'NORTH AMERICA');

INSERT INTO Manufacturer
VALUES
('15', 'Chevrolet', 'NORTH AMERICA');


-----INSERT STATEMENTS FOR MODEL-----

INSERT INTO Model
VALUES
('1', '350Z', 'COUPE', null, '5');

INSERT INTO Model
VALUES
('2', '370Z', 'COUPE', '1', '5');

INSERT INTO Model
VALUES
('3', 'R8', 'COUPE', null, '1');

INSERT INTO Model
VALUES
('4', 'V8', 'SEDAN', null, '1');

INSERT INTO Model
VALUES
('5', 'A8', 'SEDAN', '4', '1');

INSERT INTO Model
VALUES
('6', 'A3', 'HATCH', null, '1');

INSERT INTO Model
VALUES
('7', 'TT', 'COUPE', null, '1');

INSERT INTO Model
VALUES
('8', 'A4', 'SEDAN', null, '1');

INSERT INTO Model
VALUES
('9', 'Skyline GTR R-32', 'COUPE', null, '5');

INSERT INTO Model
VALUES
('10', 'Skyline GTR R-33', 'COUPE', '9', '5');

INSERT INTO Model
VALUES
('11', 'Skyline GTR R-34', 'COUPE', '10', '5');

INSERT INTO Model
VALUES
('12', 'Skyline R-34 25GT', 'COUPE', null, '5');

INSERT INTO Model
VALUES
('13', 'GT-R R35', 'COUPE', '11', '5');

INSERT INTO Model
VALUES
('14', 'Pulsar', 'SEDAN', null, '5');

INSERT INTO Model
VALUES
('15', '456', 'COUPE', null, '8');

INSERT INTO Model
VALUES
('16', '612 Scaglietti', 'COUPE', '15', '8');

INSERT INTO Model
VALUES
('17', 'FF', 'COUPE', '16', '8');

INSERT INTO Model
VALUES
('18', 'F40', 'COUPE', null, '8');

INSERT INTO Model
VALUES
('19', 'F50', 'SPORTS', '18', '8');

INSERT INTO Model
VALUES
('20', 'Enzo Ferrari', 'SPORTS', '19', '8');

INSERT INTO Model
VALUES
('21', 'LaFerrari', 'SPORTS', '20', '8');

INSERT INTO Model
VALUES
('22', '328', 'SPORTS', null, '8');

INSERT INTO Model
VALUES
('23', '348', 'SPORTS', '22', '8');

INSERT INTO Model
VALUES
('24', 'F355', 'SPORTS', '23', '8');

INSERT INTO Model
VALUES
('25', '360', 'SPORTS', '24', '8');

INSERT INTO Model
VALUES
('26', 'F430', 'SPORTS', '25', '8');

INSERT INTO Model
VALUES
('27', '458', 'SPORTS', '26', '8');

INSERT INTO Model
VALUES
('28', 'California', 'SPORTS', null, '8');

INSERT INTO Model
VALUES
('29', 'California T', 'SPORTS', '28', '8');

INSERT INTO Model
VALUES
('30', 'Gallardo', 'SPORTS', null, '9');

INSERT INTO Model
VALUES
('31', 'Huracan', 'SPORTS', '30', '9');

INSERT INTO Model
VALUES
('32', 'Countach', 'SPORTS', null, '9');

INSERT INTO Model
VALUES
('33', 'Diablo', 'SPORTS', '32', '9');

INSERT INTO Model
VALUES
('34', 'Murcielago', 'SPORTS', '33', '9');

INSERT INTO Model
VALUES
('35', 'Aventador', 'SPORTS', '34', '9');

INSERT INTO Model
VALUES
('36', 'Reventon', 'SPORTS', null, '9');

INSERT INTO Model
VALUES
('37', 'VT Commodore', 'SEDAN', null, '6');

INSERT INTO Model
VALUES
('38', 'VX Commodore', 'SEDAN', '37', '6');

INSERT INTO Model
VALUES
('39', 'VY Commodore', 'SEDAN', '38', '6');

INSERT INTO Model
VALUES
('40', 'VZ Commodore', 'SEDAN', '39', '6');

INSERT INTO Model
VALUES
('41', 'VE Commodore', 'SEDAN', '40', '6');

INSERT INTO Model
VALUES
('42', 'VF Commodore', 'SEDAN', '41', '6');

INSERT INTO Model
VALUES
('43', 'E30 M3', 'COUPE', null, '2');

INSERT INTO Model
VALUES
('44', 'E36 M3', 'COUPE', '43', '2');

INSERT INTO Model
VALUES
('45', 'E46 M3', 'COUPE', '44', '2');

INSERT INTO Model
VALUES
('46', 'E90 M3', 'SEDAN', '45', '2');

INSERT INTO Model
VALUES
('47', 'E92 M3', 'COUPE', '45', '2');

INSERT INTO Model
VALUES
('48', 'Z1', 'ROADSTER', null, '2');

INSERT INTO Model
VALUES
('49', 'Z3', 'ROADSTER', '48', '2');

INSERT INTO Model
VALUES
('50', 'Z4', 'ROADSTER', '49', '2');

INSERT INTO Model
VALUES
('51', 'E89 (Z4)', 'CONVERTIBLE', '50', '2');

INSERT INTO Model
VALUES
('52', 'X5 (E53)', 'SUV', null, '2');

INSERT INTO Model
VALUES
('53', 'X5 (E70)', 'SUV', '52', '2');

INSERT INTO Model
VALUES
('54', 'X5 (F15)', 'SUV', '53', '2');

INSERT INTO Model
VALUES
('55', 'MX-5', 'ROADSTER', null, '3');

INSERT INTO Model
VALUES
('56', 'RX-7', 'COUPE', null, '3');

INSERT INTO Model
VALUES
('57', 'RX-8', 'COUPE', '56', '3');

INSERT INTO Model
VALUES
('58', 'Sprinter', 'VAN', null, '4');

INSERT INTO Model
VALUES
('59', 'C-Class (W203)', 'SEDAN', null, '4');

INSERT INTO Model
VALUES
('60', 'C-Class (W204)', 'SEDAN', '59', '4');

INSERT INTO Model
VALUES
('61', 'C-Class (W205)', 'SEDAN', '60', '4');

INSERT INTO Model
VALUES
('62', 'SLR McLaren', 'COUPE', null, '4');

INSERT INTO Model
VALUES
('63', 'SLS AMG', 'COUPE', '62', '4');

INSERT INTO Model
VALUES
('64', 'AMG GT', 'COUPE', '63', '4');

INSERT INTO Model
VALUES
('65', 'Corolla', 'SEDAN', null, '7');

INSERT INTO Model
VALUES
('66', '86', 'COUPE', null, '7');

INSERT INTO Model
VALUES
('67', 'Prius', 'HYBRID', null, '7');

INSERT INTO Model
VALUES
('68', 'Supra', 'COUPE', null, '7');

INSERT INTO Model
VALUES
('69', 'Veyron 16.4', 'COUPE', null, '10');

INSERT INTO Model
VALUES
('70', 'Roadster', 'ROADSTER', null, '14');

INSERT INTO Model
VALUES
('71', 'Model S', 'SEDAN', null, '14');

INSERT INTO Model
VALUES
('72', 'Boxter (986)', 'ROADSTER', null, '12');

INSERT INTO Model
VALUES
('73', 'Boxter (987)', 'ROADSTER', '72', '12');

INSERT INTO Model
VALUES
('74', 'Boxter (981)', 'ROADSTER', '73', '12');

INSERT INTO Model
VALUES
('75', 'Cayman (987)', 'COUPE', null, '12');

INSERT INTO Model
VALUES
('76', 'Cayman (981)', 'COUPE', '75', '12');

INSERT INTO Model
VALUES
('77', '911 (964)', 'COUPE', null, '12');

INSERT INTO Model
VALUES
('78', '911 (993)', 'COUPE', '77', '12');

INSERT INTO Model
VALUES
('79', '911 (996)', 'COUPE', '78', '12');

INSERT INTO Model
VALUES
('80', '911 (997)', 'COUPE', '79', '12');

INSERT INTO Model
VALUES
('81', '911 (991)', 'COUPE', '80', '12');

INSERT INTO Model
VALUES
('82', 'Corvette (C5)', 'COUPE', null, '15');

INSERT INTO Model
VALUES
('83', 'Corvette (C6)', 'COUPE', '82', '15');

INSERT INTO Model
VALUES
('84', 'Corvette (C7)', 'COUPE', '83', '15');


 

-----INSERT STATEMENTS FOR CAR-----

--check #4 2B7JB33R9CK683376, 1GTJC39U03E743638, 1GTHC29D56E184231, 1GTEK39JX9Z328709, 1GCEC19T11Z986314

INSERT INTO Car
VALUES
('WBADM6340XG841967', to_date('01-01-2019', 'dd-mm-yyyy'), 2006, 24000, 28000, 135000, 'Silver', '1');

INSERT INTO Car
VALUES
('1GCHC29123E214349', to_date('01-01-2019', 'dd-mm-yyyy'), 2003, 18000, 21000, 150000, 'Golden', '1');

INSERT INTO Car
VALUES
('1FAFP45X91F287510', to_date('03-01-2019', 'dd-mm-yyyy'), 2011, 40000, 45000, 30000, 'Red', '2');

INSERT INTO Car
VALUES
('2B7JB33R9CK683376', to_date('07-01-2019', 'dd-mm-yyyy'), 2010, 400000, 405000, 6000, 'White', '27');

INSERT INTO Car
VALUES
('1GTJC39U03E743638', to_date('10-01-2019', 'dd-mm-yyyy'), 2007, 235000, 240000, 24000, 'Blue', '26');

INSERT INTO Car
VALUES
('1FMZU65E41U986493', to_date('20-01-2019', 'dd-mm-yyyy'), 2007, 230000, 235000, 30000, 'Grey', '26');

INSERT INTO Car
VALUES
('1GTHC29D56E184231', to_date('05-02-2019', 'dd-mm-yyyy'), 2010, 295000, 299000, 11000, 'Grey', '28');

INSERT INTO Car
VALUES
('WD2PD644445546424', to_date('10-02-2019', 'dd-mm-yyyy'), 2010, 395000, 398000, 17000, 'Silver', '27');

INSERT INTO Car
VALUES
('WVWCK93C56E785032', to_date('15-02-2019', 'dd-mm-yyyy'), 2004, 195000, 197000, 20000, 'Blue', '16');

INSERT INTO Car
VALUES
('1N4BL21EX8C213155', to_date('17-02-2019', 'dd-mm-yyyy'), 2001, 115000, 119000, 38000, 'Silver', '25');

INSERT INTO Car
VALUES
('1FMDU62K64U247828', to_date('21-02-2019', 'dd-mm-yyyy'), 1994, 85000, 89000, 74000, 'White', '22');

INSERT INTO Car
VALUES
('1FMFK16589E458228', to_date('28-02-2019', 'dd-mm-yyyy'), 1991, 87000, 91000, 37000, 'Blue', '22');

INSERT INTO Car
VALUES
('1GNKRGED1BJ543168', to_date('03-03-2019', 'dd-mm-yyyy'), 1993, 92000, 95000, 22000, 'Silver', '22');

INSERT INTO Car
VALUES
('2A4RR5DXXAR310241', to_date('10-03-2019', 'dd-mm-yyyy'), 2013, 30000, 32000, 9000, 'Golden', '66');

INSERT INTO Car
VALUES
('2GCEC13VX71423242', to_date('11-03-2019', 'dd-mm-yyyy'), 2012, 25000, 28000, 37000, 'Blue', '66');

INSERT INTO Car
VALUES
('JA3AY11A62U002517', to_date('15-03-2019', 'dd-mm-yyyy'), 2014, 37000, 39000, 5000, 'Silver', '66');

INSERT INTO Car
VALUES
('1G2HZ541314942552', to_date('19-04-2019', 'dd-mm-yyyy'), 2012, 31000, 32000, 12000, 'Black', '66');

INSERT INTO Car
VALUES
('KMHFC4DD2AA414636', to_date('21-04-2019', 'dd-mm-yyyy'), 2012, 30000, 32000, 12000, 'Silver', '66');

INSERT INTO Car
VALUES
('1FTNF21L34E377534', to_date('24-04-2019', 'dd-mm-yyyy'), 2003, 230000, 233000, 23000, 'Black', '34');

INSERT INTO Car
VALUES
('1FDAX46Y49E421321', to_date('26-04-2019', 'dd-mm-yyyy'), 2012, 355000, 358000, 22000, 'Silver', '30');

INSERT INTO Car
VALUES
('2GCEC332091873678', to_date('28-04-2019', 'dd-mm-yyyy'), 2004, 155000, 157000, 18000, 'Golden', '30');

INSERT INTO Car
VALUES
('YS3FC5CY4B1651489', to_date('01-05-2019', 'dd-mm-yyyy'), 2006, 197000, 199000, 25000, 'Silver', '30');

INSERT INTO Car
VALUES
('1GNDU23L86D436112', to_date('05-05-2019', 'dd-mm-yyyy'), 2014, 475000, 478000, 380, 'Blue', '31');

INSERT INTO Car
VALUES
('1GTEC14X55Z433813', to_date('09-05-2019', 'dd-mm-yyyy'), 2005, 220000, 223000, 27000, 'Silver', '34');

INSERT INTO Car
VALUES
('JM3ER4D34B0765424', to_date('11-05-2019', 'dd-mm-yyyy'), 2012, 635000, 638000, 2000, 'Black', '35');

INSERT INTO Car
VALUES
('5YMGZ0C53AL593212', to_date('14-05-2019', 'dd-mm-yyyy'), 2011, 185000, 187000, 30000, 'Black', '30');

INSERT INTO Car
VALUES
('1B3HB28C07D934185', to_date('20-05-2019', 'dd-mm-yyyy'), 2004, 145000, 147000, 48000, 'Silver', '30');

INSERT INTO Car
VALUES
('1GCPKPEA9AZ921133', to_date('21-05-2019', 'dd-mm-yyyy'), 2001, 32000, 35000, 57000, 'Golden', '56');

INSERT INTO Car
VALUES
('4T1BE30K95U945182', to_date('25-05-2019', 'dd-mm-yyyy'), 1994, 15000, 17000, 75000, 'Silver', '56');

INSERT INTO Car
VALUES
('1FAHP55S13A516345', to_date('30-05-2019', 'dd-mm-yyyy'), 2002, 25000, 28000, 94000, 'Golden', '56');

INSERT INTO Car
VALUES
('4S3BMCB61A3600784', to_date('30-05-2019', 'dd-mm-yyyy'), 2008, 19000, 21000, 91000, 'Blue', '57');

INSERT INTO Car
VALUES
('WAUMFAFL0BA713336', to_date('03-06-2019', 'dd-mm-yyyy'), 2004, 9000, 11000, 151000, 'Black', '57');

INSERT INTO Car
VALUES
('3GKFK16Z86G493290', to_date('05-06-2019', 'dd-mm-yyyy'), 2003, 11000, 12000, 125000, 'Silver', '57');

INSERT INTO Car
VALUES
('2B7KB31Z5YK094713', to_date('06-06-2019', 'dd-mm-yyyy'), 2006, 162000, 164000, 20000, 'Golden', '80');

INSERT INTO Car
VALUES
('JTMZD31VX75674242', to_date('06-06-2019', 'dd-mm-yyyy'), 2009, 255000, 257000, 27000, 'Black', '80');

INSERT INTO Car
VALUES
('JS2YB417595416339', to_date('10-07-2019', 'dd-mm-yyyy'), 2001, 106000, 108000, 43000, 'Silver', '79');

INSERT INTO Car
VALUES
('1GDJC33U17F123255', to_date('11-07-2019', 'dd-mm-yyyy'), 2014, 368000, 371000, 10000, 'Blue', '81');

INSERT INTO Car
VALUES
('1FMNE31P36H372214', to_date('15-07-2019', 'dd-mm-yyyy'), 2004, 82000, 83000, 68000, 'Silver', '79');

INSERT INTO Car
VALUES
('3GCEK33Y59G001771', to_date('16-08-2019', 'dd-mm-yyyy'), 2004, 98000, 100000, 36000, 'Black', '79');

INSERT INTO Car
VALUES
('5TFFM5F14AX290506', to_date('16-08-2019', 'dd-mm-yyyy'), 2005, 6000, 7000, 155000, 'Black', '40');

INSERT INTO Car
VALUES
('5N1AA0NCXBN293153', to_date('18-09-2019', 'dd-mm-yyyy'), 2014, 33000, 34000, 27000, 'Silver', '42');

INSERT INTO Car
VALUES
('WDBWK56F08F688134', to_date('19-09-2019', 'dd-mm-yyyy'), 2003, 22000, 23000, 105000, 'Golden', '39');

INSERT INTO Car
VALUES
('4JGBB77E27A113011', to_date('21-09-2019', 'dd-mm-yyyy'), 2005, 23000, 24000, 102000, 'Blue', '1');

INSERT INTO Car
VALUES
('2C8GT44L12R232549', to_date('22-10-2019', 'dd-mm-yyyy'), 2007, 28000, 30000, 87000, 'Silver', '1');

INSERT INTO Car
VALUES
('1GT2GUBG1A1290766', to_date('24-10-2019', 'dd-mm-yyyy'), 2003, 15000, 17500, 84000, 'White', '1');

INSERT INTO Car
VALUES
('1GGCS299588074501', to_date('26-11-2019', 'dd-mm-yyyy'), 2008, 23000, 25000, 89000, 'White', '1');

INSERT INTO Car
VALUES
('2G1WF52K619235572', to_date('30-12-2019', 'dd-mm-yyyy'), 2008, 31000, 33000, 18000, 'Silver', '1');

INSERT INTO Car
VALUES
('2B8GP74L51R756899', to_date('31-12-2019', 'dd-mm-yyyy'), 2014, 55000, 57500, 4000, 'Golden', '2');

INSERT INTO Car
VALUES
('1FMZU72X4YZ280181', to_date('06-01-2020', 'dd-mm-yyyy'), 2013, 50000, 52000, 3000, 'White', '2');

INSERT INTO Car
VALUES
('1FTLR1FEXAP390333', to_date('09-01-2020', 'dd-mm-yyyy'), 2011, 219000, 221000, 2000, 'Golden', '3');

INSERT INTO Car
VALUES
('1GNFC16Y78R779240', to_date('11-02-2020', 'dd-mm-yyyy'), 2012, 297000, 299000, 1500, 'Silver', '3');

INSERT INTO Car
VALUES
('JTEES41A792808096', to_date('13-02-2020', 'dd-mm-yyyy'), 2011, 219000, 220000, 2000, 'Golden', '3');

INSERT INTO Car
VALUES
('JS3TD947084394831', to_date('15-02-2020', 'dd-mm-yyyy'), 2010, 238000, 240000, 16000, 'Blue', '3');

INSERT INTO Car
VALUES
('1N6BA07D78N077247', to_date('19-03-2020', 'dd-mm-yyyy'), 2010, 168000, 169000, 27000, 'Grey', '3');

INSERT INTO Car
VALUES
('1J4FA39S75P151813', to_date('23-03-2020', 'dd-mm-yyyy'), 2008, 136000, 138500, 55000, 'Grey', '3');

INSERT INTO Car
VALUES
('1D3HE58J65S689317', to_date('26-03-2020', 'dd-mm-yyyy'), 2011, 13000, 14000, 81000, 'White', '65');

INSERT INTO Car
VALUES
('1GTCT19W818143704', to_date('30-03-2020', 'dd-mm-yyyy'), 2005, 4000, 4500, 179000, 'White', '65');

INSERT INTO Car
VALUES
('1B7HL2AX61S561343', to_date('01-05-2020', 'dd-mm-yyyy'), 2007, 5000, 7000, 150000, 'White', '65');

INSERT INTO Car
VALUES
('1GCEC19T11Z986314', to_date('01-05-2020', 'dd-mm-yyyy'), 2014, 104000, 106000, 1500, 'Silver', '54');

INSERT INTO Car
VALUES
('1N4AL11E43C958160', to_date('10-05-2020', 'dd-mm-yyyy'), 2013, 93500, 95000, 20000, 'Blue', '53');

INSERT INTO Car
VALUES
('1FTYR11U02P225848', to_date('12-05-2020', 'dd-mm-yyyy'), 2005, 22000, 24500, 147000, 'Grey', '52');

INSERT INTO Car
VALUES
('3VWRG3AL2AM248646', to_date('17-05-2020', 'dd-mm-yyyy'), 2014, 88000, 89500, 11000, 'Blue', '54');

INSERT INTO Car
VALUES
('1FMEU63829U552130', to_date('19-06-2020', 'dd-mm-yyyy'), 2003, 17000, 19000, 155000, 'Red', '52');

INSERT INTO Car
VALUES
('1GCJC33G44F024651', to_date('20-06-2020', 'dd-mm-yyyy'), 2007, 36000, 38000, 112000, 'Blue', '53');

INSERT INTO Car
VALUES
('2FMDK30C59B461657', to_date('25-06-2020', 'dd-mm-yyyy'), 2012, 83000, 85000, 23500, 'White', '50');

INSERT INTO Car
VALUES
('WBAVC735X7K157172', to_date('29-06-2020', 'dd-mm-yyyy'), 2004, 25000, 26000, 87000, 'Silver', '50');

INSERT INTO Car
VALUES
('1B3AS56CX5D011327', to_date('30-06-2020', 'dd-mm-yyyy'), 2006, 30000, 31000, 132000, 'White', '50');

INSERT INTO Car
VALUES
('1FMNU42S85E002355', to_date('01-07-2020', 'dd-mm-yyyy'), 1999, 18000, 19500, 122000, 'Blue', '49');

INSERT INTO Car
VALUES
('WVWMU73C27E950734', to_date('05-07-2020', 'dd-mm-yyyy'), 1997, 10000, 11500, 183000, 'Grey', '49');

INSERT INTO Car
VALUES
('1GDHK83K79F405576', to_date('06-07-2020', 'dd-mm-yyyy'), 2001, 16000, 18000, 94000, 'Red', '49');

INSERT INTO Car
VALUES
('2HKRL1866XH260929', to_date('10-06-2020', 'dd-mm-yyyy'), 2012, 415000, 420000, 13000, 'Blue', '63');

INSERT INTO Car
VALUES
('1GTEK39JX9Z328709', to_date('13-07-2020', 'dd-mm-yyyy'), 2011, 347000, 349500, 16000, 'White', '63');

INSERT INTO Car
VALUES
('JTDDY38T0Y0596636', to_date('15-07-2020', 'dd-mm-yyyy'), 2014, 501000, 505000, 1000, 'Silver', '63');

INSERT INTO Car
VALUES
('1G4HE57Y56U287569', to_date('19-07-2020', 'dd-mm-yyyy'), 1997, 10000, 11000, 161000, 'Red', '68');

INSERT INTO Car
VALUES
('1D8HD58PX6F699019', to_date('25-07-2020', 'dd-mm-yyyy'), 1996, 23000, 25000, 90000, 'Grey', '68');

INSERT INTO Car
VALUES
('5XYZHDAG7BG068764', to_date('29-07-2020', 'dd-mm-yyyy'), 1996, 28000, 29500, 80000, 'Silver', '68');

INSERT INTO Car
VALUES
('1GTHK34265E652996', to_date('30-07-2020', 'dd-mm-yyyy'), 1993, 15000, 16500, 131000, 'White', '68');

INSERT INTO Car
VALUES
('WP0AD29937S201685', to_date('01-09-2020', 'dd-mm-yyyy'), 1994, 14000, 15000, 142000, 'Grey', '68');

INSERT INTO Car
VALUES
('5TEUX42N77Z594593', to_date('04-09-2020', 'dd-mm-yyyy'), 2008, 85000, 88000, 8500, 'Black', '83');

INSERT INTO Car
VALUES
('JTDBT923071533790', to_date('08-09-2020', 'dd-mm-yyyy'), 2000, 55000, 57000, 75000, 'Blue', '82');

INSERT INTO Car
VALUES
('1FTZR14E79P414838', to_date('10-10-2020', 'dd-mm-yyyy'), 1998, 57000, 59000, 5000, 'White', '82');

INSERT INTO Car
VALUES
('1FMJK1G57AE529996', to_date('15-10-2020', 'dd-mm-yyyy'), 2004, 52000, 55000, 32000, 'Black', '82');

INSERT INTO Car
VALUES
('3VWSA69M95M008503', to_date('20-10-2020', 'dd-mm-yyyy'), 2004, 75000, 75500, 19000, 'White', '82');

-----INSERT STATEMENTS FOR FEATURE-----

INSERT INTO Feature
VALUES
('1', 'Dual Airbags', 'SAFETY');

INSERT INTO Feature
VALUES
('2', 'ABS Brakes', 'SAFETY');

INSERT INTO Feature
VALUES
('3', 'Brake Assist', 'SAFETY');

INSERT INTO Feature
VALUES
('4', 'Manual Transmission ', 'TRANSMISSION');

INSERT INTO Feature
VALUES
('5', 'Automatic Transmission ', 'TRANSMISSION');

INSERT INTO Feature
VALUES
('6', '4 Cylinder', 'ENGINE');

INSERT INTO Feature
VALUES
('7', '6 Cylinder', 'ENGINE');

INSERT INTO Feature
VALUES
('8', '8 Cylinder', 'ENGINE');

INSERT INTO Feature
VALUES
('9', '10 Cylinder', 'ENGINE');

INSERT INTO Feature
VALUES
('10', '12 Cylinder', 'ENGINE');

INSERT INTO Feature
VALUES
('11', 'Keyless Start', 'SECURITY');

INSERT INTO Feature
VALUES
('12', 'USB Audio Input', 'AV');

INSERT INTO Feature
VALUES
('13', 'Bluetooth Connectivity', 'AV');

INSERT INTO Feature
VALUES
('14', 'Blind Spot Sensor', 'SAFETY');

INSERT INTO Feature
VALUES
('15', 'Front Power Windows', 'COMFORT');

INSERT INTO Feature
VALUES
('16', 'Rear Power Windows', 'COMFORT');

INSERT INTO Feature
VALUES
('17', 'Park Assist', 'STEERING');

INSERT INTO Feature
VALUES
('18', 'Voice Recognition', 'AV');

INSERT INTO Feature
VALUES
('19', 'Cruise Control', 'STEERING');

INSERT INTO Feature
VALUES
('20', 'GPS', 'ELECTRONICS');

INSERT INTO Feature
VALUES
('21', 'DVD Player', 'AV');

INSERT INTO Feature
VALUES
('22', 'Leather Steering Wheel', 'INTERIOR');

INSERT INTO Feature
VALUES
('23', 'Heated Front Seats', 'INTERIOR');

INSERT INTO Feature
VALUES
('24', 'Heated Rear Seats', 'INTERIOR');

INSERT INTO Feature
VALUES
('25', '4 Seats', 'SEATING');

INSERT INTO Feature
VALUES
('26', '5 Seats', 'SEATING');

INSERT INTO Feature
VALUES
('27', '7 Seats', 'SEATING');

INSERT INTO Feature
VALUES
('28', 'Alloy Wheels', 'EXTERIOR');

INSERT INTO Feature
VALUES
('29', 'Premium Sound System', 'INTERIOR');

INSERT INTO Feature
VALUES
('30', 'Stainless Steel Exhaust', 'EXTERIOR');

INSERT INTO Feature
VALUES
('31', 'Dual Exhaust', 'EXTERIOR');

INSERT INTO Feature
VALUES
('32', 'Air Conditioning', 'COMFORT');

INSERT INTO Feature
VALUES
('33', 'Climate Control', 'COMFORT');

INSERT INTO Feature
VALUES
('34', 'Cup Holders - 1st Row', 'INTERIOR');

INSERT INTO Feature
VALUES
('35', 'Cup Holders - 2nd Row', 'INTERIOR');

INSERT INTO Feature
VALUES
('36', 'Centre Console', 'INTERIOR');

INSERT INTO Feature
VALUES
('37', 'Electric Sunroof', 'EXTERIOR');

INSERT INTO Feature
VALUES
('38', 'Remote Boot', 'EXTERIOR');

INSERT INTO Feature
VALUES
('39', 'Power Windows', 'INTERIOR');

INSERT INTO Feature
VALUES
('40', 'Trip Computer', 'ELECTRONICS');

INSERT INTO Feature
VALUES
('41', 'Fog Lamps', 'SAFETY');

INSERT INTO Feature
VALUES
('42', 'Rain Sensor (Auto Wipers)', 'SAFETY');

INSERT INTO Feature
VALUES
('43', 'Alarm', 'SECURITY');

INSERT INTO Feature
VALUES
('44', 'Rear Vision Camera', 'SAFETY');

INSERT INTO Feature
VALUES
('45', 'Central Locking', 'SAFETY');

INSERT INTO Feature
VALUES
('46', 'Traction Control', 'SAFETY');

INSERT INTO Feature
VALUES
('47', 'Engine Immobiliser', 'SECURITY');

INSERT INTO Feature
VALUES
('48', 'Multi-function Steering Wheel', 'INTERIOR');

INSERT INTO Feature
VALUES
('49', 'Touring Suspension', 'SUSPENSION');

INSERT INTO Feature
VALUES
('50', 'Maps/Reading Lamps', 'INTERIOR');

INSERT INTO Feature
VALUES
('51', 'LED Tail Lights', 'EXTERIOR');

INSERT INTO Feature
VALUES
('52', 'Sports Pedals', 'INTERIOR');

INSERT INTO Feature
VALUES
('53', 'Tilt and Reach Wheel', 'STEERING');


-----INSERT STATEMENTS FOR CARFEATURES-----

--(NOTE: ONLY A FEW VALUES ARE INSERTED INTO THIS TABLE SINCE IT IS NOT USED IN THE QUERIES. THE SAMPLE VALUES ARE JUST INTENDED TO SHOW FUNCTIONALITY).

INSERT INTO CarFeature
VALUES
('WBADM6340XG841967', '1');

INSERT INTO CarFeature
VALUES
('1GCHC29123E214349', '1');

INSERT INTO CarFeature
VALUES
('1FAFP45X91F287510', '1');

INSERT INTO CarFeature
VALUES
('WBADM6340XG841967', '2');

INSERT INTO CarFeature
VALUES
('1GCHC29123E214349', '2');

INSERT INTO CarFeature
VALUES
('1FAFP45X91F287510', '2');

INSERT INTO CarFeature
VALUES
('WBADM6340XG841967', '3');

INSERT INTO CarFeature
VALUES
('1GCHC29123E214349', '3');

INSERT INTO CarFeature
VALUES
('1FAFP45X91F287510', '3');


-----INSERT STATEMENTS FOR CUSTOMERS-----

INSERT INTO Customer  
VALUES 
('1', 'Robin Williams', to_date('11-11-1979','dd-mm-yyyy'), '10 Mendota Avenue', 'Lalor', 3075, 'F', '2-(632)031-8233', 'rwilliams0@hugedomains.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('2', 'Gary Parker', to_date('19-11-1957','dd-mm-yyyy'), '62 Lunder Court', 'Lalor', 3075, 'M', '2-(676)293-5059', 'gparker1@360.cn', 'VIP');

INSERT INTO Customer  
VALUES 
('3', 'Gregory Perez', to_date('11-10-1977','dd-mm-yyyy'), '902 Washington Lane', 'Bundoora', 3086, 'M', '0-(918)945-5596', 'gperez2@tumblr.com', 'VIP');

INSERT INTO Customer  
VALUES 
('4', 'Carlos Howard', to_date('31-07-1954','dd-mm-yyyy'), '6 6th Pass', 'Melbourne', 3000, 'M', '7-(042)498-7933', 'choward3@artisteer.com', 'VIP');

INSERT INTO Customer  
VALUES 
('5', 'Janice Freeman', to_date('19-06-1977','dd-mm-yyyy'), '580 South Trail', 'Fitzroy', 3065, 'F', '7-(900)217-2047', 'jfreeman4@redcross.org', 'VIP');

INSERT INTO Customer  
VALUES 
('6', 'Diane Nichols', to_date('03-12-1977','dd-mm-yyyy'), '986 Swallow Way', 'Mill Park', 3082, 'F', '1-(545)660-5974', 'dnichols5@ocn-ne.jp', 'REGULAR');

INSERT INTO Customer  
VALUES 
('7', 'Timothy Day', to_date('24-12-1975','dd-mm-yyyy'), '8 Mesta Street', 'Carlton', 3053, 'M', '4-(881)060-4538', 'tday6@163.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('8', 'Nancy West', to_date('21-08-1952','dd-mm-yyyy'), '57 Northfield Hill', 'Carlton', 3053, 'F', '6-(940)877-6267', 'nwest7@psu.edu', 'REGULAR');

INSERT INTO Customer  
VALUES 
('9', 'Henry Parker', to_date('20-11-1958','dd-mm-yyyy'), '424 Cambridge Lane', 'South Morang', 3752, 'M', '5-(786)177-8008', 'hparker8@sourceforge.net', 'REGULAR');

INSERT INTO Customer  
VALUES 
('10', 'Juan Carpenter', to_date('02-03-1980','dd-mm-yyyy'), '07 Derek Park', 'Epping', 3076, 'M', '2-(398)062-9002', 'jcarpenter9@chicagotribune.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('11', 'Susan Moore', to_date('18-07-1959','dd-mm-yyyy'), '79 Lotheville Hill', 'Melbourne', 3000, 'F', '3-(914)931-3610', 'smoorea@canalblog.com', 'VIP');

INSERT INTO Customer  
VALUES 
('12', 'Earl Wagner', to_date('22-03-1975','dd-mm-yyyy'), '1115 Walton Court', 'Bundoora', 3086, 'M', '8-(210)779-3258', 'ewagnerb@list-manage.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('13', 'Diane Brown', to_date('25-10-1964','dd-mm-yyyy'), '46 Maywood Crossing', 'Bundoora', 3086, 'F', '9-(115)704-9039', 'dbrownc@irs.gov', 'VIP');

INSERT INTO Customer  
VALUES 
('14', 'Terry Ruiz', to_date('25-12-1958','dd-mm-yyyy'), '6 Johnson Terrace', 'Bundoora', 3086, 'M', '6-(436)946-0867', 'truizd@stanford.edu', 'REGULAR');

INSERT INTO Customer  
VALUES 
('15', 'Richard Perry', to_date('03-06-1989','dd-mm-yyyy'), '3 Sloan Park', 'Mill Park', 3082, 'M', '9-(949)759-9967', 'rperrye@ovh.net', 'REGULAR');

INSERT INTO Customer  
VALUES 
('16', 'Eugene Wood', to_date('23-05-1980','dd-mm-yyyy'), '75312 2nd Hill', 'Epping', 3076, 'M', '2-(511)001-7603', 'ewoodf@reddit.com', 'REGULAR');

INSERT INTO Customer 
VALUES 
('17', 'Julia Olson', to_date('01-04-1960','dd-mm-yyyy'), '806 Larry Way', 'Bundoora', 3086, 'F', '3-(190)723-1184', 'jolsong@e-recht24.de', 'VIP');

INSERT INTO Customer  
VALUES 
('18', 'Amy Washington', to_date('13-08-1965','dd-mm-yyyy'), '8 Texas Parkway', 'Melbourne', 3000, 'F', '9-(753)309-9930', 'awashingtonh@1688.com', 'VIP');

INSERT INTO Customer  
VALUES 
('19', 'Henry Hicks', to_date('29-07-1956','dd-mm-yyyy'), '7809 Maple Wood Place', 'South Morang', 3752, 'M', '8-(826)401-6777', 'hhicksi@blogspot.com', 'VIP');

INSERT INTO Customer  
VALUES 
('20', 'Donna Jenkins', to_date('26-06-1989','dd-mm-yyyy'), '27 Sullivan Trail', 'South Morang', 3752, 'F', '7-(849)676-0517', 'djenkinsj@nba.com', 'VIP');

INSERT INTO Customer  
VALUES 
('21', 'Sean Knight', to_date('04-10-1967','dd-mm-yyyy'), '5 Harper Hill', 'Lalor', 3075, 'M', '8-(190)350-1745', 'sknightk@sogou.com', 'VIP');

INSERT INTO Customer  
VALUES 
('22', 'Wayne Fernandez', to_date('27-02-1983','dd-mm-yyyy'), '8737 Everett Terrace', 'Fitzroy', 3065, 'M', '2-(043)251-1418', 'wfernandezl@dion-ne.jp', 'REGULAR');

INSERT INTO Customer  
VALUES 
('23', 'Willie Stanley', to_date('16-05-1974','dd-mm-yyyy'), '773 Mcbride Center', 'Mill Park', 3082, 'M', '3-(787)194-5914', 'wstanleym@spiegel.de', 'REGULAR');

INSERT INTO Customer  
VALUES 
('24', 'Ruth Roberts', to_date('10-01-1956','dd-mm-yyyy'), '6812 Summit Trail', 'South Morang', 3752, 'F', '0-(071)897-4793', 'rrobertsn@domainmarket.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('25', 'Anne Ortiz', to_date('06-01-1963','dd-mm-yyyy'), '50 Southridge Road', 'Clifton Hill', 3068, 'F', '4-(479)106-7955', 'aortizo@smugmug.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('26', 'Lisa Cook', to_date('16-04-1975','dd-mm-yyyy'), '1497 Kropf Plaza', 'Clifton Hill', 3068, 'F', '9-(069)058-5071', 'lcookp@tuttocitta.it', 'REGULAR');

INSERT INTO Customer  
VALUES 
('27', 'Victor Hawkins', to_date('15-06-1983','dd-mm-yyyy'), '957 Lakewood Gardens Avenue','Epping', 3076, 'M', '2-(259)971-3375', 'vhawkinsq@squidoo.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('28', 'Frances Johnston', to_date('15-06-1966','dd-mm-yyyy'), '61 Annamark Circle', 'Carlton', 3053, 'F', '0-(056)303-9759', 'fjohnstonr@seattletimes.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('29', 'Sean Torres', to_date('14-06-1977','dd-mm-yyyy'), '2 Hovde Parkway', 'Fitzroy', 3065, 'M', '7-(195)814-3347', 'storress@mysql.com', 'VIP');

INSERT INTO Customer  
VALUES 
('30', 'Marilyn Welch', to_date('03-06-1960','dd-mm-yyyy'), '6 Arapahoe Terrace', 'Mill Park', 3082, 'F', '2-(593)221-3533', 'mwelcht@imgur.com', 'VIP');

INSERT INTO Customer  
VALUES 
('31', 'Tammy Harrison', to_date('10-10-1964','dd-mm-yyyy'), '57 Talmadge Road', 'Mill Park', 3082, 'F', '1-(174)766-1773', 'tharrisonu@springer.com', 'VIP');

INSERT INTO Customer  
VALUES 
('32', 'Doris Brown', to_date('10-11-1964','dd-mm-yyyy'), '03 Mccormick Road', 'Clifton Hill', 3068, 'F', '0-(470)968-1116', 'dbrownv@umn.edu', 'VIP');

INSERT INTO Customer  
VALUES 
('33', 'Jerry Clark', to_date('25-07-1960','dd-mm-yyyy'), '95 Sachs Lane', 'Fitzroy', 3065, 'M', '6-(656)080-4404', 'jclarkw@samsung.com', 'VIP');

INSERT INTO Customer  
VALUES 
('34', 'Ann Burton', to_date('14-01-1986','dd-mm-yyyy'), '972 Fisk Trail', 'Epping', 3076, 'F', '4-(782)535-5454', 'aburtonx@elegantthemes.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('35', 'Willie White', to_date('25-05-1952','dd-mm-yyyy'), '43 Redwing Junction', 'Collingwood', 3066, 'M', '1-(476)293-5816', 'wwhitey@whitehouse.gov', 'VIP');

INSERT INTO Customer  
VALUES 
('36', 'Ruth Long', to_date('20-01-1966','dd-mm-yyyy'), '044 Banding Plaza', 'Epping', 3076, 'F', '0-(026)411-8480', 'rlongz@vk.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('37', 'Donald Chavez', to_date('04-10-1974','dd-mm-yyyy'), '9428 Tennyson Drive', 'Bundoora', 3086, 'M', '1-(737)897-7303', 'dchavez10@ca.gov', 'VIP');

INSERT INTO Customer  
VALUES 
('38', 'Rebecca Reynolds', to_date('05-08-1968','dd-mm-yyyy'), '361 Manley Trail', 'Lalor', 3075, 'F', '9-(596)597-2313', 'rreynolds11@webnode.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('39', 'Diana Black', to_date('12-01-1965','dd-mm-yyyy'), '0 Manley Center', 'South Morang', 3752, 'F', '6-(198)788-0771', 'dblack12@yahoo.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('40', 'Heather Murphy', to_date('27-10-1977','dd-mm-yyyy'), '80378 Cascade Circle', 'Bundoora', 3086, 'F', '0-(484)984-1825', 'hmurphy13@addthis.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('41', 'Phyllis Harris', to_date('12-10-1953','dd-mm-yyyy'), '13 Pawling Point', 'Epping', 3076, 'F', '4-(376)478-8254', 'pharris14@vkontakte.ru', 'REGULAR');

INSERT INTO Customer  
VALUES 
('42', 'Laura Nguyen', to_date('28-11-1958','dd-mm-yyyy'), '8 Brickson Park Center','South Morang',3752, 'F', '1-(850)353-2300', 'lnguyen15@posterous.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('43', 'Eugene Mcdonald', to_date('23-02-1976','dd-mm-yyyy'), '06552 Orin Junction', 'Mill Park', 3082, 'M', '1-(883)545-0032', 'emcdonald16@360.cn', 'VIP');

INSERT INTO Customer  
VALUES 
('44', 'Gary Willis', to_date('14-05-1975','dd-mm-yyyy'), '4743 Gateway Avenue', 'Fitzroy', 3065, 'M', '9-(621)483-8521', 'gwillis17@mysql.com', 'VIP');

INSERT INTO Customer  
VALUES 
('45', 'Dorothy Mason', to_date('24-03-1970','dd-mm-yyyy'), '13323 Westerfield Parkway', 'Fitzroy', 3065, 'F', '6-(002)971-3124', 'dmason18@telegraph-co.uk', 'VIP');

INSERT INTO Customer  
VALUES 
('46', 'Rose Alvarez', to_date('30-11-1983','dd-mm-yyyy'), '6 Buhler Parkway', 'South Morang', 3752, 'F', '2-(547)553-5199', 'ralvarez19@bbc-co.uk', 'VIP');

INSERT INTO Customer  
VALUES 
('47', 'Mark Hughes', to_date('04-07-1973','dd-mm-yyyy'), '85532 Spaight Alley', 'Carlton', 3053, 'M', '6-(597)522-2021', 'mhughes1a@linkedin.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('48', 'Nancy Little', to_date('05-06-1987','dd-mm-yyyy'), '19516 Menomonie Way', 'Lalor', 3075, 'F', '4-(023)368-6657', 'nlittle1b@cloudflare.com', 'VIP');

INSERT INTO Customer  
VALUES 
('49', 'Clarence Hall', to_date('27-10-1975','dd-mm-yyyy'), '6453 Cordelia Circle', 'Bundoora', 3086, 'M', '0-(996)708-0375', 'chall1c@wikipedia.org', 'VIP');

INSERT INTO Customer  
VALUES 
('50', 'Tammy Jordan', to_date('18-05-1960','dd-mm-yyyy'), '5680 Dottie Trail', 'Clifton Hill', 3068, 'F', '5-(918)833-9253', 'tjordan1d@instagram.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('51', 'Donna Dean', to_date('01-10-1957','dd-mm-yyyy'), '38 Sachtjen Trail', 'Carlton', 3053, 'F', '9-(243)367-6606', 'ddean1e@java.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('52', 'Anne Taylor', to_date('17-12-1953','dd-mm-yyyy'), '88212 Hollow Ridge Trail', 'Melbourne', 3000, 'F', '3-(532)214-3344', 'ataylor1f@youtube.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('53', 'Rose Phillips',to_date('05-12-1954','dd-mm-yyyy'),'3580 Brickson Park Street','South Morang', 3752, 'F','0-(736)651-9561','rphillips1g@shareasale.com', 'VIP');

INSERT INTO Customer  
VALUES 
('54', 'Adam Murphy', to_date('26-03-1950','dd-mm-yyyy'), '8 Jenna Terrace', 'Lalor', 3075, 'M', '8-(883)831-1452', 'amurphy1h@chicagotribune.com', 'VIP');

INSERT INTO Customer  
VALUES 
('55', 'Shirley Simmons', to_date('03-06-1971','dd-mm-yyyy'), '2 Memorial Lane', 'Fitzroy', 3065, 'F', '0-(736)663-2780', 'ssimmons1i@china.com.cn', 'VIP');

INSERT INTO Customer  
VALUES 
('56', 'Frances Bryant', to_date('27-11-1981','dd-mm-yyyy'), '7383 South Court', 'South Morang', 3752, 'F', '5-(189)654-5915', 'fbryant1j@ted.com', 'VIP');

INSERT INTO Customer  
VALUES 
('57', 'Joshua Griffin', to_date('19-08-1980','dd-mm-yyyy'), '634 North Road', 'South Morang', 3752, 'M', '9-(291)442-3913', 'jgriffin1k@t.co', 'VIP');

INSERT INTO Customer  
VALUES 
('58', 'Nicole Chavez', to_date('20-08-1955','dd-mm-yyyy'), '467 Waubesa Way', 'Fitzroy', 3065, 'F', '5-(726)850-8955', 'nchavez1l@unblog.fr', 'VIP');

INSERT INTO Customer  
VALUES 
('59', 'Justin Fowler', to_date('18-02-1976','dd-mm-yyyy'), '89799 Reinke Road', 'Epping', 3076, 'M', '8-(833)981-7177', 'jfowler1m@issuu.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('60', 'Chris Brooks', to_date('07-05-1958','dd-mm-yyyy'), '518 Hanson Hill', 'South Morang', 3752, 'M', '5-(768)161-8911', 'cbrooks1n@jigsy.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('61', 'Albert Jacobs', to_date('10-09-1974','dd-mm-yyyy'), '06877 Lakewood Center', 'Melbourne', 3000, 'M', '2-(110)169-5302', 'ajacobs1o@msu.edu', 'REGULAR');

INSERT INTO Customer  
VALUES 
('62', 'David Fernandez', to_date('12-07-1962','dd-mm-yyyy'), '3 Parkside Park', 'Clifton Hill', 3068, 'M', '0-(923)907-0483', 'dfernandez1p@phoca.cz', 'VIP');

INSERT INTO Customer  
VALUES 
('63', 'Lois Fox', to_date('21-01-1976','dd-mm-yyyy'), '226 Nevada Center', 'Epping', 3076, 'F', '4-(966)279-3755', 'lfox1q@newsvine.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('64', 'Scott Welch', to_date('16-02-1955','dd-mm-yyyy'), '95217 Elmside Terrace', 'South Morang', 3752, 'M', '8-(320)685-4818', 'swelch1r@wired.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('65', 'Earl Hernandez', to_date('27-05-1953','dd-mm-yyyy'), '42573 Daystar Crossing','Collingwood', 3066, 'M', '0-(156)126-3277', 'ehernandez1s@time.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('66', 'Diane Little', to_date('04-09-1987','dd-mm-yyyy'), '4702 Northland Alley', 'Epping', 3076, 'F', '1-(314)330-5733', 'dlittle1t@nature.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('67', 'Mark Johnston', to_date('12-02-1987','dd-mm-yyyy'), '54 Ryan Parkway', 'Mill Park', 3082, 'M', '7-(232)280-9438', 'mjohnston1u@arizona.edu', 'VIP');

INSERT INTO Customer  
VALUES 
('68', 'Russell Carr', to_date('07-01-1957','dd-mm-yyyy'), '977 Pawling Junction', 'Mill Park', 3082, 'M', '7-(249)980-8757', 'rcarr1v@so.net-ne.jp', 'REGULAR');

INSERT INTO Customer  
VALUES 
('69', 'Nicole Williams', to_date('16-09-1968','dd-mm-yyyy'), '3 Weeping Birch Place', 'Epping', 3076, 'F', '6-(734)456-4334', 'nwilliams1w@woothemes.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('70', 'Gary Howard', to_date('20-11-1972','dd-mm-yyyy'), '153 Ridgeway Terrace', 'Fitzroy', 3065, 'M', '2-(881)997-5004', 'ghoward1x@liveinternet.ru', 'REGULAR');

INSERT INTO Customer  
VALUES 
('71', 'Alan Rose', to_date('28-09-1958','dd-mm-yyyy'), '1799 Duke Plaza', 'Bundoora', 3086, 'M', '9-(784)930-5188', 'arose1y@t-online.de', 'REGULAR');

INSERT INTO Customer  
VALUES 
('72', 'Jason Harvey', to_date('27-05-1989','dd-mm-yyyy'), '4197 Kenwood Pass', 'Melbourne', 3000, 'M', '6-(485)591-7752', 'jharvey1z@domainmarket.com', 'VIP');

INSERT INTO Customer  
VALUES 
('73', 'Beverly Ellis', to_date('14-05-1988','dd-mm-yyyy'), '5 Armistice Terrace', 'Collingwood', 3066, 'F', '5-(324)965-8548', 'bellis20@facebook.com', 'VIP');

INSERT INTO Customer  
VALUES 
('74', 'Gloria Miller', to_date('16-07-1956','dd-mm-yyyy'), '8 Messerschmidt Place', 'Bundoora', 3086, 'F', '9-(271)528-0010', 'gmiller21@ustream.tv', 'VIP');

INSERT INTO Customer  
VALUES 
('75', 'Justin Hamilton', to_date('19-08-1956','dd-mm-yyyy'), '01 Paget Park', 'South Morang', 3752, 'M', '2-(451)811-4620', 'jhamilton22@auda.org.au', 'VIP');

INSERT INTO Customer  
VALUES 
('76', 'David Thomas', to_date('24-01-1971','dd-mm-yyyy'), '02 Luster Circle', 'Epping', 3076, 'M', '0-(919)484-0861', 'dthomas23@typepad.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('77', 'Jane Anderson', to_date('11-11-1986','dd-mm-yyyy'), '41675 Schiller Point', 'Bundoora', 3086, 'F', '7-(445)035-4045', 'janderson24@howstuffworks.com', 'VIP');

INSERT INTO Customer  
VALUES 
('78', 'Anna Harris', to_date('09-09-1965','dd-mm-yyyy'), '365 Anhalt Lane', 'Melbourne', 3000, 'F', '6-(455)794-9742', 'aharris25@flickr.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('79', 'Harold Johnston', to_date('04-03-1955','dd-mm-yyyy'), '31180 Garrison Road', 'Melbourne', 3000, 'M', '2-(301)476-7591', 'hjohnston26@go.com', 'VIP');

INSERT INTO Customer  
VALUES 
('80', 'Phillip Lane', to_date('22-12-1967','dd-mm-yyyy'), '24 Orin Avenue', 'Epping', 3076, 'M', '4-(983)485-8171', 'plane27@squarespace.com', 'VIP');

INSERT INTO Customer  
VALUES 
('81', 'Lillian Jacobs', to_date('12-12-1988','dd-mm-yyyy'), '317 Troy Trail', 'Fitzroy', 3065, 'F', '8-(316)956-5221', 'ljacobs28@creativecommons.org', 'REGULAR');

INSERT INTO Customer  
VALUES 
('82', 'Gloria Bowman', to_date('10-08-1988','dd-mm-yyyy'), '73815 Daystar Way', 'Carlton', 3053, 'F', '8-(896)124-1211', 'gbowman29@imageshack.us', 'VIP');

INSERT INTO Customer  
VALUES 
('83', 'Steve Ferguson', to_date('09-01-1976','dd-mm-yyyy'), '9 Cordelia Road', 'Fitzroy', 3065, 'M', '2-(264)415-0717', 'sferguson2a@paypal.com', 'VIP');

INSERT INTO Customer  
VALUES 
('84', 'Katherine Scott', to_date('03-03-1959','dd-mm-yyyy'), '8 Basil Park', 'Fitzroy', 3065, 'F', '2-(295)185-4069', 'kscott2b@smugmug.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('85', 'Marie Boyd', to_date('08-10-1950','dd-mm-yyyy'), '53000 Park Meadow Junction', 'Lalor', 3075, 'F', '5-(931)456-3091', 'mboyd2c@t.co', 'VIP');

INSERT INTO Customer  
VALUES 
('86', 'Arthur Henry', to_date('15-02-1965','dd-mm-yyyy'), '393 Oakridge Way', 'Collingwood', 3066, 'M', '9-(537)281-5835', 'ahenry2d@indiegogo.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('87', 'Patrick Miller', to_date('08-05-1974','dd-mm-yyyy'), '7 Lakewood Gardens Hill', 'Fitzroy', 3065, 'M', '9-(254)109-9270', 'pmiller2e@amazon-co.jp', 'REGULAR');

INSERT INTO Customer  
VALUES 
('88', 'Carolyn Cruz', to_date('21-05-1959','dd-mm-yyyy'), '099 Heffernan Drive', 'Collingwood', 3066, 'F', '1-(414)677-2264', 'ccruz2f@ustream.tv', 'VIP');

INSERT INTO Customer  
VALUES 
('89', 'Jeremy Wagner', to_date('18-11-1965','dd-mm-yyyy'), '35 Farragut Point', 'Mill Park', 3082, 'M', '1-(881)430-4544', 'jwagner2g@vkontakte.ru', 'VIP');

INSERT INTO Customer  
VALUES 
('90', 'Andrea Ryan', to_date('11-07-1966','dd-mm-yyyy'), '0 Main Terrace', 'Clifton Hill', 3068, 'F', '6-(102)419-3595', 'aryan2h@123-reg-co.uk', 'REGULAR');

INSERT INTO Customer  
VALUES 
('91', 'Cheryl Butler', to_date('06-12-1957','dd-mm-yyyy'), '7 Moland Avenue', 'Mill Park', 3082, 'F', '1-(278)074-5042', 'cbutler2i@toplist.cz', 'VIP');

INSERT INTO Customer  
VALUES 
('92', 'Larry Peters', to_date('15-11-1950','dd-mm-yyyy'), '73398 Almo Avenue', 'Mill Park', 3082, 'M', '6-(713)385-2387', 'lpeters2j@reuters.com', 'VIP');

INSERT INTO Customer  
VALUES 
('93', 'Nancy Jacobs', to_date('09-12-1970','dd-mm-yyyy'), '246 Bobwhite Hill', 'Fitzroy', 3065, 'F', '4-(525)709-6201', 'njacobs2k@accuweather.com', 'VIP');

INSERT INTO Customer  
VALUES 
('94', 'Donald Dixon', to_date('16-01-1979','dd-mm-yyyy'), '663 Dryden Alley', 'Clifton Hill', 3068, 'M', '0-(708)302-1070', 'ddixon2l@addtoany.com', 'VIP');

INSERT INTO Customer  
VALUES 
('95', 'Chris Stewart', to_date('07-04-1975','dd-mm-yyyy'), '034 Badeau Alley', 'Lalor', 3075, 'M', '6-(060)856-2294', 'cstewart2m@springer.com', 'VIP');

INSERT INTO Customer  
VALUES 
('96', 'Daniel Miller', to_date('25-06-1955','dd-mm-yyyy'), '3889 Caliangt Court', 'Epping', 3076, 'M', '8-(068)226-1986', 'dmiller2n@vimeo.com', 'VIP');

INSERT INTO Customer  
VALUES 
('97', 'Russell Stevens', to_date('28-08-1982','dd-mm-yyyy'), '5 Claremont Way', 'Fitzroy', 3065, 'M', '4-(519)275-4509', 'rstevens2o@github.io', 'REGULAR');

INSERT INTO Customer  
VALUES 
('98', 'Justin Owens', to_date('18-06-1971','dd-mm-yyyy'), '0731 Mcguire Plaza', 'Melbourne', 3000, 'M', '4-(555)930-2783', 'jowens2p@g.co', 'REGULAR');

INSERT INTO Customer  
VALUES 
('99', 'Andrea Lynch', to_date('30-09-1957','dd-mm-yyyy'), '8 Waxwing Junction', 'Lalor', 3075, 'F', '2-(094)093-7917', 'alynch2q@blogspot.com', 'REGULAR');

INSERT INTO Customer  
VALUES 
('100', 'Ruby Coleman', to_date('24-12-1965','dd-mm-yyyy'), '203 Kenwood Avenue', 'Carlton', 3053, 'F', '4-(393)535-2241', 'rcoleman2r@guardian-co.uk', 'REGULAR');



-----INSERT STATEMENTS FOR CUSTOMERPREFERENCE-----

INSERT INTO CustomerPreference  VALUES ('21', '16');
INSERT INTO CustomerPreference  VALUES ('90', '47');
INSERT INTO CustomerPreference  VALUES ('60', '7');
INSERT INTO CustomerPreference  VALUES ('76', '31');
INSERT INTO CustomerPreference  VALUES ('22', '26');
INSERT INTO CustomerPreference  VALUES ('66', '26');
INSERT INTO CustomerPreference  VALUES ('78', '26');
INSERT INTO CustomerPreference  VALUES ('77', '4');
INSERT INTO CustomerPreference  VALUES ('88', '22');
INSERT INTO CustomerPreference  VALUES ('81', '45');
INSERT INTO CustomerPreference  VALUES ('95', '48');
INSERT INTO CustomerPreference  VALUES ('81', '20');
INSERT INTO CustomerPreference  VALUES ('73', '39');
INSERT INTO CustomerPreference  VALUES ('49', '23');
INSERT INTO CustomerPreference  VALUES ('37', '38');
INSERT INTO CustomerPreference  VALUES ('24', '13');
INSERT INTO CustomerPreference  VALUES ('4', '38');
INSERT INTO CustomerPreference  VALUES ('75', '19');
INSERT INTO CustomerPreference  VALUES ('30', '22');
INSERT INTO CustomerPreference  VALUES ('7', '15');
INSERT INTO CustomerPreference  VALUES ('4', '6');
INSERT INTO CustomerPreference  VALUES ('75', '44');
INSERT INTO CustomerPreference  VALUES ('93', '26');
INSERT INTO CustomerPreference  VALUES ('49', '40');
INSERT INTO CustomerPreference  VALUES ('15', '15');
INSERT INTO CustomerPreference  VALUES ('71', '39');
INSERT INTO CustomerPreference  VALUES ('98', '2');
INSERT INTO CustomerPreference  VALUES ('89', '10');
INSERT INTO CustomerPreference  VALUES ('46', '48');
INSERT INTO CustomerPreference  VALUES ('57', '44');
INSERT INTO CustomerPreference  VALUES ('12', '28');
INSERT INTO CustomerPreference  VALUES ('2', '24');
INSERT INTO CustomerPreference  VALUES ('44', '44');
INSERT INTO CustomerPreference  VALUES ('40', '50');
INSERT INTO CustomerPreference  VALUES ('25', '52');
INSERT INTO CustomerPreference  VALUES ('62', '34');
INSERT INTO CustomerPreference  VALUES ('97', '16');
INSERT INTO CustomerPreference  VALUES ('37', '49');
INSERT INTO CustomerPreference  VALUES ('12', '13');
INSERT INTO CustomerPreference  VALUES ('75', '35');
INSERT INTO CustomerPreference  VALUES ('63', '24');
INSERT INTO CustomerPreference  VALUES ('53', '16');
INSERT INTO CustomerPreference  VALUES ('100', '24');
INSERT INTO CustomerPreference  VALUES ('47', '22');
INSERT INTO CustomerPreference  VALUES ('63', '42');
INSERT INTO CustomerPreference  VALUES ('35', '45');
INSERT INTO CustomerPreference  VALUES ('57', '21');
INSERT INTO CustomerPreference  VALUES ('87', '45');
INSERT INTO CustomerPreference  VALUES ('40', '11');
INSERT INTO CustomerPreference  VALUES ('17', '23');
INSERT INTO CustomerPreference  VALUES ('14', '24');
INSERT INTO CustomerPreference  VALUES ('76', '13');
INSERT INTO CustomerPreference  VALUES ('74', '9');
INSERT INTO CustomerPreference  VALUES ('59', '44');
INSERT INTO CustomerPreference  VALUES ('45', '42');
INSERT INTO CustomerPreference  VALUES ('42', '9');
INSERT INTO CustomerPreference  VALUES ('90', '11');
INSERT INTO CustomerPreference  VALUES ('60', '20');
INSERT INTO CustomerPreference  VALUES ('92', '18');
INSERT INTO CustomerPreference  VALUES ('36', '35');
INSERT INTO CustomerPreference  VALUES ('91', '22');
INSERT INTO CustomerPreference  VALUES ('37', '2');
INSERT INTO CustomerPreference  VALUES ('41', '17');
INSERT INTO CustomerPreference  VALUES ('35', '44');
INSERT INTO CustomerPreference  VALUES ('46', '51');
INSERT INTO CustomerPreference  VALUES ('91', '33');
INSERT INTO CustomerPreference  VALUES ('85', '3');
INSERT INTO CustomerPreference  VALUES ('100', '41');
INSERT INTO CustomerPreference  VALUES ('39', '31');
INSERT INTO CustomerPreference  VALUES ('32', '46');
INSERT INTO CustomerPreference  VALUES ('88', '11');
INSERT INTO CustomerPreference  VALUES ('61', '17');
INSERT INTO CustomerPreference  VALUES ('77', '12');
INSERT INTO CustomerPreference  VALUES ('42', '12');
INSERT INTO CustomerPreference  VALUES ('71', '32');
INSERT INTO CustomerPreference  VALUES ('17', '9');
INSERT INTO CustomerPreference  VALUES ('86', '14');
INSERT INTO CustomerPreference  VALUES ('12', '49');
INSERT INTO CustomerPreference  VALUES ('20', '42');
INSERT INTO CustomerPreference  VALUES ('70', '5');
INSERT INTO CustomerPreference  VALUES ('52', '33');
INSERT INTO CustomerPreference  VALUES ('51', '25');
INSERT INTO CustomerPreference  VALUES ('79', '17');
INSERT INTO CustomerPreference  VALUES ('60', '22');
INSERT INTO CustomerPreference  VALUES ('81', '39');
INSERT INTO CustomerPreference  VALUES ('68', '33');
INSERT INTO CustomerPreference  VALUES ('78', '31');
INSERT INTO CustomerPreference  VALUES ('95', '25');
INSERT INTO CustomerPreference  VALUES ('13', '40');
INSERT INTO CustomerPreference  VALUES ('24', '17');
INSERT INTO CustomerPreference  VALUES ('32', '39');
INSERT INTO CustomerPreference  VALUES ('35', '40');
INSERT INTO CustomerPreference  VALUES ('83', '38');
INSERT INTO CustomerPreference  VALUES ('23', '5');
INSERT INTO CustomerPreference  VALUES ('77', '41');
INSERT INTO CustomerPreference  VALUES ('78', '35');
INSERT INTO CustomerPreference  VALUES ('79', '13');
INSERT INTO CustomerPreference  VALUES ('70', '44');
INSERT INTO CustomerPreference  VALUES ('86', '18');
INSERT INTO CustomerPreference  VALUES ('6', '3');
INSERT INTO CustomerPreference  VALUES ('80', '21');
INSERT INTO CustomerPreference  VALUES ('95', '16');
INSERT INTO CustomerPreference  VALUES ('72', '35');
INSERT INTO CustomerPreference  VALUES ('14', '28');
INSERT INTO CustomerPreference  VALUES ('96', '5');
INSERT INTO CustomerPreference  VALUES ('70', '31');
INSERT INTO CustomerPreference  VALUES ('36', '10');
INSERT INTO CustomerPreference  VALUES ('12', '41');
INSERT INTO CustomerPreference  VALUES ('78', '18');
INSERT INTO CustomerPreference  VALUES ('75', '23');
INSERT INTO CustomerPreference  VALUES ('40', '31');
INSERT INTO CustomerPreference  VALUES ('64', '22');
INSERT INTO CustomerPreference  VALUES ('22', '9');
INSERT INTO CustomerPreference  VALUES ('50', '36');
INSERT INTO CustomerPreference  VALUES ('64', '47');
INSERT INTO CustomerPreference  VALUES ('36', '31');
INSERT INTO CustomerPreference  VALUES ('47', '31');
INSERT INTO CustomerPreference  VALUES ('10', '25');
INSERT INTO CustomerPreference  VALUES ('59', '47');
INSERT INTO CustomerPreference  VALUES ('63', '3');
INSERT INTO CustomerPreference  VALUES ('23', '31');
INSERT INTO CustomerPreference  VALUES ('25', '45');
INSERT INTO CustomerPreference  VALUES ('22', '2');
INSERT INTO CustomerPreference  VALUES ('26', '48');
INSERT INTO CustomerPreference  VALUES ('18', '45');
INSERT INTO CustomerPreference  VALUES ('53', '13');
INSERT INTO CustomerPreference  VALUES ('3', '26');
INSERT INTO CustomerPreference  VALUES ('81', '37');
INSERT INTO CustomerPreference  VALUES ('6', '10');
INSERT INTO CustomerPreference  VALUES ('48', '39');
INSERT INTO CustomerPreference  VALUES ('7', '35');
INSERT INTO CustomerPreference  VALUES ('47', '50');
INSERT INTO CustomerPreference  VALUES ('34', '49');
INSERT INTO CustomerPreference  VALUES ('34', '5');
INSERT INTO CustomerPreference  VALUES ('55', '25');
INSERT INTO CustomerPreference  VALUES ('51', '41');
INSERT INTO CustomerPreference  VALUES ('48', '35');
INSERT INTO CustomerPreference  VALUES ('9', '51');
INSERT INTO CustomerPreference  VALUES ('19', '21');
INSERT INTO CustomerPreference  VALUES ('66', '8');
INSERT INTO CustomerPreference  VALUES ('58', '21');
INSERT INTO CustomerPreference  VALUES ('11', '11');
INSERT INTO CustomerPreference  VALUES ('22', '4');
INSERT INTO CustomerPreference  VALUES ('70', '49');
INSERT INTO CustomerPreference  VALUES ('38', '30');
INSERT INTO CustomerPreference  VALUES ('44', '50');
INSERT INTO CustomerPreference  VALUES ('86', '25');
INSERT INTO CustomerPreference  VALUES ('67', '15');
INSERT INTO CustomerPreference  VALUES ('47', '1');
INSERT INTO CustomerPreference  VALUES ('38', '47');
INSERT INTO CustomerPreference  VALUES ('60', '1');
INSERT INTO CustomerPreference  VALUES ('70', '14');
INSERT INTO CustomerPreference  VALUES ('22', '1');
INSERT INTO CustomerPreference  VALUES ('24', '3');
INSERT INTO CustomerPreference  VALUES ('20', '21');
INSERT INTO CustomerPreference  VALUES ('40', '49');
INSERT INTO CustomerPreference  VALUES ('68', '32');
INSERT INTO CustomerPreference  VALUES ('39', '35');
INSERT INTO CustomerPreference  VALUES ('21', '30');
INSERT INTO CustomerPreference  VALUES ('12', '39');
INSERT INTO CustomerPreference  VALUES ('95', '47');
INSERT INTO CustomerPreference  VALUES ('72', '4');
INSERT INTO CustomerPreference  VALUES ('86', '4');
INSERT INTO CustomerPreference  VALUES ('6', '33');
INSERT INTO CustomerPreference  VALUES ('18', '7');
INSERT INTO CustomerPreference  VALUES ('2', '10');
INSERT INTO CustomerPreference  VALUES ('52', '39');
INSERT INTO CustomerPreference  VALUES ('17', '6');
INSERT INTO CustomerPreference  VALUES ('82', '35');
INSERT INTO CustomerPreference  VALUES ('34', '26');
INSERT INTO CustomerPreference  VALUES ('18', '12');
INSERT INTO CustomerPreference  VALUES ('35', '11');
INSERT INTO CustomerPreference  VALUES ('99', '45');
INSERT INTO CustomerPreference  VALUES ('16', '35');
INSERT INTO CustomerPreference  VALUES ('59', '14');
INSERT INTO CustomerPreference  VALUES ('99', '40');
INSERT INTO CustomerPreference  VALUES ('38', '14');
INSERT INTO CustomerPreference  VALUES ('19', '36');
INSERT INTO CustomerPreference  VALUES ('79', '26');
INSERT INTO CustomerPreference  VALUES ('34', '38');
INSERT INTO CustomerPreference  VALUES ('56', '9');
INSERT INTO CustomerPreference  VALUES ('11', '39');
INSERT INTO CustomerPreference  VALUES ('4', '13');
INSERT INTO CustomerPreference  VALUES ('3', '22');
INSERT INTO CustomerPreference  VALUES ('98', '7');
INSERT INTO CustomerPreference  VALUES ('98', '15');
INSERT INTO CustomerPreference  VALUES ('59', '38');
INSERT INTO CustomerPreference  VALUES ('33', '30');
INSERT INTO CustomerPreference  VALUES ('11', '28');
INSERT INTO CustomerPreference  VALUES ('1', '10');
INSERT INTO CustomerPreference  VALUES ('34', '22');
INSERT INTO CustomerPreference  VALUES ('90', '7');
INSERT INTO CustomerPreference  VALUES ('25', '20');
INSERT INTO CustomerPreference  VALUES ('66', '12');
INSERT INTO CustomerPreference  VALUES ('32', '28');
INSERT INTO CustomerPreference  VALUES ('30', '27');
INSERT INTO CustomerPreference  VALUES ('58', '43');
INSERT INTO CustomerPreference  VALUES ('66', '37');
INSERT INTO CustomerPreference  VALUES ('23', '50');
INSERT INTO CustomerPreference  VALUES ('74', '3');
INSERT INTO CustomerPreference  VALUES ('89', '50');
INSERT INTO CustomerPreference  VALUES ('26', '7');
INSERT INTO CustomerPreference  VALUES ('21', '17');
INSERT INTO CustomerPreference  VALUES ('30', '17');
INSERT INTO CustomerPreference  VALUES ('33', '35');
INSERT INTO CustomerPreference  VALUES ('13', '31');
INSERT INTO CustomerPreference  VALUES ('76', '52');
INSERT INTO CustomerPreference  VALUES ('39', '47');
INSERT INTO CustomerPreference  VALUES ('40', '24');
INSERT INTO CustomerPreference  VALUES ('26', '34');
INSERT INTO CustomerPreference  VALUES ('39', '43');
INSERT INTO CustomerPreference  VALUES ('73', '13');
INSERT INTO CustomerPreference  VALUES ('39', '8');
INSERT INTO CustomerPreference  VALUES ('47', '51');
INSERT INTO CustomerPreference  VALUES ('67', '10');
INSERT INTO CustomerPreference  VALUES ('6', '40');
INSERT INTO CustomerPreference  VALUES ('76', '18');
INSERT INTO CustomerPreference  VALUES ('24', '27');
INSERT INTO CustomerPreference  VALUES ('18', '27');
INSERT INTO CustomerPreference  VALUES ('39', '15');
INSERT INTO CustomerPreference  VALUES ('1', '35');
INSERT INTO CustomerPreference  VALUES ('69', '21');
INSERT INTO CustomerPreference  VALUES ('24', '25');
INSERT INTO CustomerPreference  VALUES ('1', '20');
INSERT INTO CustomerPreference  VALUES ('72', '52');
INSERT INTO CustomerPreference  VALUES ('72', '23');
INSERT INTO CustomerPreference  VALUES ('78', '49');
INSERT INTO CustomerPreference  VALUES ('73', '4');
INSERT INTO CustomerPreference  VALUES ('45', '11');
INSERT INTO CustomerPreference  VALUES ('28', '3');
INSERT INTO CustomerPreference  VALUES ('98', '46');
INSERT INTO CustomerPreference  VALUES ('44', '51');
INSERT INTO CustomerPreference  VALUES ('41', '14');
INSERT INTO CustomerPreference  VALUES ('47', '3');
INSERT INTO CustomerPreference  VALUES ('13', '17');
INSERT INTO CustomerPreference  VALUES ('3', '19');
INSERT INTO CustomerPreference  VALUES ('10', '15');
INSERT INTO CustomerPreference  VALUES ('28', '8');
INSERT INTO CustomerPreference  VALUES ('43', '46');
INSERT INTO CustomerPreference  VALUES ('70', '36');
INSERT INTO CustomerPreference  VALUES ('64', '36');
INSERT INTO CustomerPreference  VALUES ('79', '22');
INSERT INTO CustomerPreference  VALUES ('37', '24');
INSERT INTO CustomerPreference  VALUES ('85', '51');
INSERT INTO CustomerPreference  VALUES ('42', '50');
INSERT INTO CustomerPreference  VALUES ('85', '28');
INSERT INTO CustomerPreference  VALUES ('62', '52');
INSERT INTO CustomerPreference  VALUES ('81', '44');
INSERT INTO CustomerPreference  VALUES ('71', '31');
INSERT INTO CustomerPreference  VALUES ('79', '1');
INSERT INTO CustomerPreference  VALUES ('71', '19');
INSERT INTO CustomerPreference  VALUES ('49', '2');
INSERT INTO CustomerPreference  VALUES ('66', '25');
INSERT INTO CustomerPreference  VALUES ('70', '2');
INSERT INTO CustomerPreference  VALUES ('79', '32');
INSERT INTO CustomerPreference  VALUES ('63', '45');
INSERT INTO CustomerPreference  VALUES ('34', '19');
INSERT INTO CustomerPreference  VALUES ('57', '5');
INSERT INTO CustomerPreference  VALUES ('42', '51');
INSERT INTO CustomerPreference  VALUES ('15', '11');
INSERT INTO CustomerPreference  VALUES ('56', '36');
INSERT INTO CustomerPreference  VALUES ('53', '17');
INSERT INTO CustomerPreference  VALUES ('17', '16');
INSERT INTO CustomerPreference  VALUES ('4', '27');
INSERT INTO CustomerPreference  VALUES ('69', '43');
INSERT INTO CustomerPreference  VALUES ('78', '33');
INSERT INTO CustomerPreference  VALUES ('73', '7');
INSERT INTO CustomerPreference  VALUES ('76', '19');
INSERT INTO CustomerPreference  VALUES ('91', '40');
INSERT INTO CustomerPreference  VALUES ('16', '48');
INSERT INTO CustomerPreference  VALUES ('35', '49');
INSERT INTO CustomerPreference  VALUES ('94', '43');
INSERT INTO CustomerPreference  VALUES ('38', '51');
INSERT INTO CustomerPreference  VALUES ('45', '25');
INSERT INTO CustomerPreference  VALUES ('68', '9');
INSERT INTO CustomerPreference  VALUES ('18', '13');
INSERT INTO CustomerPreference  VALUES ('50', '1');
INSERT INTO CustomerPreference  VALUES ('75', '33');
INSERT INTO CustomerPreference  VALUES ('15', '10');
INSERT INTO CustomerPreference  VALUES ('32', '19');
INSERT INTO CustomerPreference  VALUES ('82', '26');
INSERT INTO CustomerPreference  VALUES ('67', '3');
INSERT INTO CustomerPreference  VALUES ('100', '48');
INSERT INTO CustomerPreference  VALUES ('14', '3');
INSERT INTO CustomerPreference  VALUES ('13', '52');
INSERT INTO CustomerPreference  VALUES ('84', '16');
INSERT INTO CustomerPreference  VALUES ('96', '20');
INSERT INTO CustomerPreference  VALUES ('60', '46');
INSERT INTO CustomerPreference  VALUES ('56', '43');
INSERT INTO CustomerPreference  VALUES ('15', '27');
INSERT INTO CustomerPreference  VALUES ('98', '23');
INSERT INTO CustomerPreference  VALUES ('44', '3');
INSERT INTO CustomerPreference  VALUES ('6', '43');
INSERT INTO CustomerPreference  VALUES ('84', '23');
INSERT INTO CustomerPreference  VALUES ('25', '38');
INSERT INTO CustomerPreference  VALUES ('4', '40');
INSERT INTO CustomerPreference  VALUES ('93', '27');
INSERT INTO CustomerPreference  VALUES ('44', '49');
INSERT INTO CustomerPreference  VALUES ('38', '35');
INSERT INTO CustomerPreference  VALUES ('64', '41');
INSERT INTO CustomerPreference  VALUES ('39', '37');
INSERT INTO CustomerPreference  VALUES ('20', '1');
INSERT INTO CustomerPreference  VALUES ('83', '45');
INSERT INTO CustomerPreference  VALUES ('97', '46');
INSERT INTO CustomerPreference  VALUES ('48', '13');
INSERT INTO CustomerPreference  VALUES ('92', '20');
INSERT INTO CustomerPreference  VALUES ('19', '32');
INSERT INTO CustomerPreference  VALUES ('21', '36');
INSERT INTO CustomerPreference  VALUES ('35', '48');
INSERT INTO CustomerPreference  VALUES ('87', '39');
INSERT INTO CustomerPreference  VALUES ('63', '25');
INSERT INTO CustomerPreference  VALUES ('55', '33');
INSERT INTO CustomerPreference  VALUES ('77', '40');
INSERT INTO CustomerPreference  VALUES ('67', '16');
INSERT INTO CustomerPreference  VALUES ('55', '21');
INSERT INTO CustomerPreference  VALUES ('39', '27');
INSERT INTO CustomerPreference  VALUES ('88', '52');
INSERT INTO CustomerPreference  VALUES ('90', '19');
INSERT INTO CustomerPreference  VALUES ('36', '14');
INSERT INTO CustomerPreference  VALUES ('67', '11');
INSERT INTO CustomerPreference  VALUES ('50', '32');
INSERT INTO CustomerPreference  VALUES ('39', '4');
INSERT INTO CustomerPreference  VALUES ('4', '17');
INSERT INTO CustomerPreference  VALUES ('64', '46');
INSERT INTO CustomerPreference  VALUES ('60', '13');
INSERT INTO CustomerPreference  VALUES ('68', '5');
INSERT INTO CustomerPreference  VALUES ('86', '43');
INSERT INTO CustomerPreference  VALUES ('83', '6');
INSERT INTO CustomerPreference  VALUES ('74', '13');
INSERT INTO CustomerPreference  VALUES ('11', '1');
INSERT INTO CustomerPreference  VALUES ('93', '52');
INSERT INTO CustomerPreference  VALUES ('20', '2');
INSERT INTO CustomerPreference  VALUES ('37', '47');
INSERT INTO CustomerPreference  VALUES ('92', '31');
INSERT INTO CustomerPreference  VALUES ('49', '39');
INSERT INTO CustomerPreference  VALUES ('49', '5');
INSERT INTO CustomerPreference  VALUES ('80', '6');
INSERT INTO CustomerPreference  VALUES ('47', '33');
INSERT INTO CustomerPreference  VALUES ('72', '13');
INSERT INTO CustomerPreference  VALUES ('28', '19');
INSERT INTO CustomerPreference  VALUES ('61', '19');
INSERT INTO CustomerPreference  VALUES ('52', '41');
INSERT INTO CustomerPreference  VALUES ('92', '26');
INSERT INTO CustomerPreference  VALUES ('56', '37');
INSERT INTO CustomerPreference  VALUES ('22', '22');
INSERT INTO CustomerPreference  VALUES ('63', '34');
INSERT INTO CustomerPreference  VALUES ('32', '40');
INSERT INTO CustomerPreference  VALUES ('8', '5');
INSERT INTO CustomerPreference  VALUES ('17', '1');
INSERT INTO CustomerPreference  VALUES ('5', '2');
INSERT INTO CustomerPreference  VALUES ('71', '15');
INSERT INTO CustomerPreference  VALUES ('73', '51');
INSERT INTO CustomerPreference  VALUES ('100', '50');
INSERT INTO CustomerPreference  VALUES ('86', '27');
INSERT INTO CustomerPreference  VALUES ('74', '43');
INSERT INTO CustomerPreference  VALUES ('57', '40');
INSERT INTO CustomerPreference  VALUES ('3', '11');
INSERT INTO CustomerPreference  VALUES ('61', '30');
INSERT INTO CustomerPreference  VALUES ('92', '42');
INSERT INTO CustomerPreference  VALUES ('35', '14');
INSERT INTO CustomerPreference  VALUES ('31', '36');
INSERT INTO CustomerPreference  VALUES ('17', '34');
INSERT INTO CustomerPreference  VALUES ('30', '8');
INSERT INTO CustomerPreference  VALUES ('28', '46');
INSERT INTO CustomerPreference  VALUES ('36', '37');
INSERT INTO CustomerPreference  VALUES ('13', '27');
INSERT INTO CustomerPreference  VALUES ('89', '6');
INSERT INTO CustomerPreference  VALUES ('26', '23');
INSERT INTO CustomerPreference  VALUES ('66', '44');
INSERT INTO CustomerPreference  VALUES ('82', '49');
INSERT INTO CustomerPreference  VALUES ('90', '26');
INSERT INTO CustomerPreference  VALUES ('75', '45');
INSERT INTO CustomerPreference  VALUES ('15', '3');
INSERT INTO CustomerPreference  VALUES ('38', '36');
INSERT INTO CustomerPreference  VALUES ('28', '24');
INSERT INTO CustomerPreference  VALUES ('88', '27');
INSERT INTO CustomerPreference  VALUES ('89', '52');
INSERT INTO CustomerPreference  VALUES ('52', '9');
INSERT INTO CustomerPreference  VALUES ('16', '22');
INSERT INTO CustomerPreference  VALUES ('94', '39');
INSERT INTO CustomerPreference  VALUES ('23', '44');
INSERT INTO CustomerPreference  VALUES ('20', '45');
INSERT INTO CustomerPreference  VALUES ('42', '11');
INSERT INTO CustomerPreference  VALUES ('45', '36');
INSERT INTO CustomerPreference  VALUES ('98', '21');
INSERT INTO CustomerPreference  VALUES ('6', '35');
INSERT INTO CustomerPreference  VALUES ('40', '33');
INSERT INTO CustomerPreference  VALUES ('79', '9');
INSERT INTO CustomerPreference  VALUES ('92', '51');
INSERT INTO CustomerPreference  VALUES ('54', '42');
INSERT INTO CustomerPreference  VALUES ('24', '46');
INSERT INTO CustomerPreference  VALUES ('71', '37');
INSERT INTO CustomerPreference  VALUES ('75', '17');
INSERT INTO CustomerPreference  VALUES ('43', '2');
INSERT INTO CustomerPreference  VALUES ('84', '48');
INSERT INTO CustomerPreference  VALUES ('48', '15');
INSERT INTO CustomerPreference  VALUES ('58', '4');
INSERT INTO CustomerPreference  VALUES ('91', '34');
INSERT INTO CustomerPreference  VALUES ('53', '49');
INSERT INTO CustomerPreference  VALUES ('37', '13');
INSERT INTO CustomerPreference  VALUES ('10', '19');
INSERT INTO CustomerPreference  VALUES ('34', '40');
INSERT INTO CustomerPreference  VALUES ('62', '24');
INSERT INTO CustomerPreference  VALUES ('1', '26');
INSERT INTO CustomerPreference  VALUES ('90', '1');
INSERT INTO CustomerPreference  VALUES ('17', '13');
INSERT INTO CustomerPreference  VALUES ('24', '39');
INSERT INTO CustomerPreference  VALUES ('17', '37');
INSERT INTO CustomerPreference  VALUES ('78', '45');
INSERT INTO CustomerPreference  VALUES ('4', '23');
INSERT INTO CustomerPreference  VALUES ('42', '13');
INSERT INTO CustomerPreference  VALUES ('71', '4');
INSERT INTO CustomerPreference  VALUES ('36', '25');
INSERT INTO CustomerPreference  VALUES ('2', '6');
INSERT INTO CustomerPreference  VALUES ('32', '49');
INSERT INTO CustomerPreference  VALUES ('25', '43');
INSERT INTO CustomerPreference  VALUES ('21', '10');
INSERT INTO CustomerPreference  VALUES ('36', '48');
INSERT INTO CustomerPreference  VALUES ('57', '34');
INSERT INTO CustomerPreference  VALUES ('62', '16');
INSERT INTO CustomerPreference  VALUES ('31', '8');
INSERT INTO CustomerPreference  VALUES ('36', '15');
INSERT INTO CustomerPreference  VALUES ('79', '38');
INSERT INTO CustomerPreference  VALUES ('39', '32');
INSERT INTO CustomerPreference  VALUES ('62', '37');
INSERT INTO CustomerPreference  VALUES ('86', '26');
INSERT INTO CustomerPreference  VALUES ('79', '11');
INSERT INTO CustomerPreference  VALUES ('34', '20');
INSERT INTO CustomerPreference  VALUES ('74', '30');
INSERT INTO CustomerPreference  VALUES ('52', '2');
INSERT INTO CustomerPreference  VALUES ('32', '30');
INSERT INTO CustomerPreference  VALUES ('61', '26');
INSERT INTO CustomerPreference  VALUES ('72', '45');
INSERT INTO CustomerPreference  VALUES ('4', '39');
INSERT INTO CustomerPreference  VALUES ('97', '21');
INSERT INTO CustomerPreference  VALUES ('90', '48');
INSERT INTO CustomerPreference  VALUES ('32', '36');
INSERT INTO CustomerPreference  VALUES ('78', '9');
INSERT INTO CustomerPreference  VALUES ('49', '28');
INSERT INTO CustomerPreference  VALUES ('30', '6');
INSERT INTO CustomerPreference  VALUES ('64', '51');
INSERT INTO CustomerPreference  VALUES ('68', '45');
INSERT INTO CustomerPreference  VALUES ('12', '30');
INSERT INTO CustomerPreference  VALUES ('13', '7');
INSERT INTO CustomerPreference  VALUES ('8', '1');
INSERT INTO CustomerPreference  VALUES ('74', '52');
INSERT INTO CustomerPreference  VALUES ('87', '14');
INSERT INTO CustomerPreference  VALUES ('98', '34');
INSERT INTO CustomerPreference  VALUES ('21', '1');
INSERT INTO CustomerPreference  VALUES ('91', '6');
INSERT INTO CustomerPreference  VALUES ('48', '7');
INSERT INTO CustomerPreference  VALUES ('19', '19');
INSERT INTO CustomerPreference  VALUES ('8', '35');
INSERT INTO CustomerPreference  VALUES ('69', '22');
INSERT INTO CustomerPreference  VALUES ('2', '34');
INSERT INTO CustomerPreference  VALUES ('78', '50');
INSERT INTO CustomerPreference  VALUES ('9', '33');
INSERT INTO CustomerPreference  VALUES ('28', '23');
INSERT INTO CustomerPreference  VALUES ('96', '42');
INSERT INTO CustomerPreference  VALUES ('31', '26');
INSERT INTO CustomerPreference  VALUES ('74', '25');
INSERT INTO CustomerPreference  VALUES ('76', '22');
INSERT INTO CustomerPreference  VALUES ('18', '43');
INSERT INTO CustomerPreference  VALUES ('30', '40');
INSERT INTO CustomerPreference  VALUES ('95', '27');
INSERT INTO CustomerPreference  VALUES ('95', '34');
INSERT INTO CustomerPreference  VALUES ('32', '16');
INSERT INTO CustomerPreference  VALUES ('1', '47');
INSERT INTO CustomerPreference  VALUES ('18', '23');
INSERT INTO CustomerPreference  VALUES ('49', '44');
INSERT INTO CustomerPreference  VALUES ('93', '15');
INSERT INTO CustomerPreference  VALUES ('15', '50');


-----INSERT STATEMENTS FOR SALESAGENT-----

INSERT INTO SalesAgent
VALUES
('1', 'Mark Licciardi', to_date('24-01-1966', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('2', 'Michael Bruce', to_date('14-02-1977', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('3', 'Ian Anne', to_date('27-03-1980', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('4', 'Paul Tonis', to_date('18-06-1950', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('5', 'Jack Thompson', to_date('11-03-1971', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('6', 'Paul Pogba', to_date('15-03-1993', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('7', 'Marco Verratti', to_date('05-11-1992', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('8', 'Daniele Rugani', to_date('29-07-1994', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('9', 'Marco Reus', to_date('31-05-1989', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('10', 'Claudio Marchisio', to_date('19-01-1986', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('11', 'Arturo Vidal', to_date('22-05-1987', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('12', 'Mattia Destro', to_date('20-03-1991', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('13', 'Fernando Llorente', to_date('26-02-1985', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('14', 'Antonio Cassano', to_date('12-07-1982', 'dd-mm-yyyy'));

INSERT INTO SalesAgent
VALUES
('15', 'Pierre-Emerick Aubameyang', to_date('18-06-1989', 'dd-mm-yyyy'));


-----INSERT STATEMENTS FOR SENIORAGENT-----

INSERT INTO SeniorAgent
VALUES
('1', to_date('21-05-2011', 'dd-mm-yyyy'));

INSERT INTO SeniorAgent
VALUES
('2', to_date('11-10-2013', 'dd-mm-yyyy'));

INSERT INTO SeniorAgent
VALUES
('3', to_date('30-01-2016', 'dd-mm-yyyy'));

INSERT INTO SeniorAgent
VALUES
('4', to_date('21-05-2017', 'dd-mm-yyyy'));

INSERT INTO SeniorAgent
VALUES
('5', to_date('21-05-2019', 'dd-mm-yyyy'));


-----INSERT STATEMENTS FOR JUNIORAGENT-----

INSERT INTO JuniorAgent
VALUES
('6', '1');

INSERT INTO JuniorAgent
VALUES
('7', '1');

INSERT INTO JuniorAgent
VALUES
('8', '2');

INSERT INTO JuniorAgent
VALUES
('9', '2');

INSERT INTO JuniorAgent
VALUES
('10', '3');

INSERT INTO JuniorAgent
VALUES
('11', '3');

INSERT INTO JuniorAgent
VALUES
('12', '4');

INSERT INTO JuniorAgent
VALUES
('13', '4');

INSERT INTO JuniorAgent
VALUES
('14', '5');

INSERT INTO JuniorAgent
VALUES
('15', '5');


-----INSERT STATEMENTS FOR SALESTRANSACTION-----

INSERT INTO SalesTransaction
VALUES
('WBADM6340XG841967', '1', '1', to_date('30-01-2019','dd-mm-yyyy'), 28500);

INSERT INTO SalesTransaction
VALUES
('1GCHC29123E214349', '2', '1', to_date('01-02-2019','dd-mm-yyyy'), 22000);

INSERT INTO SalesTransaction
VALUES
('1FAFP45X91F287510', '4', '1', to_date('03-02-2019','dd-mm-yyyy'), 46000);

INSERT INTO SalesTransaction
VALUES
('1FMZU65E41U986493', '4', '2', to_date('08-02-2019','dd-mm-yyyy'), 240000);

INSERT INTO SalesTransaction
VALUES
('WD2PD644445546424', '4', '2', to_date('28-02-2019','dd-mm-yyyy'), 399000);

INSERT INTO SalesTransaction
VALUES
('WVWCK93C56E785032', '5', '2', to_date('01-03-2019','dd-mm-yyyy'), 199000);

INSERT INTO SalesTransaction
VALUES
('1N4BL21EX8C213155', '6', '3', to_date('03-03-2019','dd-mm-yyyy'), 120000);

INSERT INTO SalesTransaction
VALUES
('1FMDU62K64U247828', '7', '3', to_date('10-03-2019','dd-mm-yyyy'), 91000);

INSERT INTO SalesTransaction
VALUES
('1FMFK16589E458228', '8', '3', to_date('12-03-2019','dd-mm-yyyy'), 92000);

INSERT INTO SalesTransaction
VALUES
('1GNKRGED1BJ543168', '9', '3', to_date('15-03-2019','dd-mm-yyyy'), 98000);

INSERT INTO SalesTransaction
VALUES
('2A4RR5DXXAR310241', '10', '4', to_date('21-03-2019','dd-mm-yyyy'), 33000);

INSERT INTO SalesTransaction
VALUES
('2GCEC13VX71423242', '11', '4', to_date('05-04-2019','dd-mm-yyyy'), 30000);

INSERT INTO SalesTransaction
VALUES
('JA3AY11A62U002517', '12', '4', to_date('10-04-2019','dd-mm-yyyy'), 39500);

INSERT INTO SalesTransaction
VALUES
('1G2HZ541314942552', '13', '4', to_date('01-05-2019','dd-mm-yyyy'), 32000);

INSERT INTO SalesTransaction
VALUES
('KMHFC4DD2AA414636', '14', '5', to_date('07-05-2019','dd-mm-yyyy'), 32500);

INSERT INTO SalesTransaction
VALUES
('1FTNF21L34E377534', '15', '5', to_date('20-05-2019','dd-mm-yyyy'), 235000);

INSERT INTO SalesTransaction
VALUES
('1FDAX46Y49E421321', '16', '5', to_date('28-05-2019','dd-mm-yyyy'), 360000);

INSERT INTO SalesTransaction
VALUES
('2GCEC332091873678', '17', '5', to_date('30-05-2019','dd-mm-yyyy'), 160000);

INSERT INTO SalesTransaction
VALUES
('YS3FC5CY4B1651489', '18', '5', to_date('30-05-2019','dd-mm-yyyy'), 200000);

INSERT INTO SalesTransaction
VALUES
('1GNDU23L86D436112', '19', '5', to_date('06-06-2019','dd-mm-yyyy'), 480000);

INSERT INTO SalesTransaction
VALUES
('1GTEC14X55Z433813', '20', '6', to_date('10-06-2019','dd-mm-yyyy'), 224000);

INSERT INTO SalesTransaction
VALUES
('JM3ER4D34B0765424', '21', '6', to_date('15-06-2019','dd-mm-yyyy'), 640000);

INSERT INTO SalesTransaction
VALUES
('5YMGZ0C53AL593212', '21', '6', to_date('29-06-2019','dd-mm-yyyy'), 190000);

INSERT INTO SalesTransaction
VALUES
('1B3HB28C07D934185', '21', '7', to_date('04-07-2019','dd-mm-yyyy'), 149000);

INSERT INTO SalesTransaction
VALUES
('1GCPKPEA9AZ921133', '21', '7', to_date('08-07-2019','dd-mm-yyyy'), 35500);

INSERT INTO SalesTransaction
VALUES
('4T1BE30K95U945182', '21', '8', to_date('11-07-2019','dd-mm-yyyy'), 17500);

INSERT INTO SalesTransaction
VALUES
('1FAHP55S13A516345', '21', '9', to_date('18-07-2019','dd-mm-yyyy'), 28000);

INSERT INTO SalesTransaction
VALUES
('2B7KB31Z5YK094713', '25', '9', to_date('26-07-2019','dd-mm-yyyy'), 165000);

INSERT INTO SalesTransaction
VALUES
('JTMZD31VX75674242', '28', '9', to_date('30-07-2019','dd-mm-yyyy'), 257000);

INSERT INTO SalesTransaction
VALUES
('JS2YB417595416339', '30', '9', to_date('03-08-2019','dd-mm-yyyy'), 109000);

INSERT INTO SalesTransaction
VALUES
('1GDJC33U17F123255', '31', '10', to_date('09-08-2019','dd-mm-yyyy'), 373000);

INSERT INTO SalesTransaction
VALUES
('1FMNE31P36H372214', '33', '10', to_date('13-08-2019','dd-mm-yyyy'), 84500);

INSERT INTO SalesTransaction
VALUES
('3GCEK33Y59G001771', '35', '10', to_date('07-09-2019','dd-mm-yyyy'), 100500);

INSERT INTO SalesTransaction
VALUES
('5TFFM5F14AX290506', '39', '11', to_date('11-09-2019','dd-mm-yyyy'), 7500);

INSERT INTO SalesTransaction
VALUES
('5N1AA0NCXBN293153', '42', '11', to_date('01-10-2019','dd-mm-yyyy'), 35000);

INSERT INTO SalesTransaction
VALUES
('WDBWK56F08F688134', '45', '11', to_date('07-10-2019','dd-mm-yyyy'), 25000);

INSERT INTO SalesTransaction
VALUES
('4JGBB77E27A113011', '46', '11', to_date('15-10-2019','dd-mm-yyyy'), 25000);

INSERT INTO SalesTransaction
VALUES
('2C8GT44L12R232549', '49', '12', to_date('30-10-2019','dd-mm-yyyy'), 32000);

INSERT INTO SalesTransaction
VALUES
('1GT2GUBG1A1290766', '50', '12', to_date('30-10-2019','dd-mm-yyyy'), 18000);

INSERT INTO SalesTransaction
VALUES
('1GGCS299588074501', '52', '12', to_date('30-11-2019','dd-mm-yyyy'), 25000);

INSERT INTO SalesTransaction
VALUES
('2G1WF52K619235572', '54', '12', to_date('03-01-2020','dd-mm-yyyy'), 34500);

INSERT INTO SalesTransaction
VALUES
('2B8GP74L51R756899', '56', '13', to_date('08-01-2020','dd-mm-yyyy'), 60000);

INSERT INTO SalesTransaction
VALUES
('1FMZU72X4YZ280181', '57', '13', to_date('18-01-2020','dd-mm-yyyy'), 53000);

INSERT INTO SalesTransaction
VALUES
('1FTLR1FEXAP390333', '58', '13', to_date('25-01-2020','dd-mm-yyyy'), 225000);

INSERT INTO SalesTransaction
VALUES
('1GNFC16Y78R779240', '60', '13', to_date('15-02-2020','dd-mm-yyyy'), 300000);

INSERT INTO SalesTransaction
VALUES
('JTEES41A792808096', '61', '14', to_date('25-02-2020','dd-mm-yyyy'), 225000);

INSERT INTO SalesTransaction
VALUES
('JS3TD947084394831', '63', '14', to_date('27-02-2020','dd-mm-yyyy'), 242000);

INSERT INTO SalesTransaction
VALUES
('1N6BA07D78N077247', '64', '14', to_date('25-03-2020','dd-mm-yyyy'), 170000);

INSERT INTO SalesTransaction
VALUES
('1J4FA39S75P151813', '66', '14', to_date('01-04-2020','dd-mm-yyyy'), 140000);

INSERT INTO SalesTransaction
VALUES
('1N4AL11E43C958160', '69', '14', to_date('20-05-2020','dd-mm-yyyy'), 99000);

INSERT INTO SalesTransaction
VALUES
('1FTYR11U02P225848', '70', '4', to_date('26-05-2020','dd-mm-yyyy'), 27000);

INSERT INTO SalesTransaction
VALUES
('3VWRG3AL2AM248646', '71', '6', to_date('29-05-2020','dd-mm-yyyy'), 90000);

INSERT INTO SalesTransaction
VALUES
('1GCJC33G44F024651', '74', '1', to_date('24-06-2020','dd-mm-yyyy'), 40000);

INSERT INTO SalesTransaction
VALUES
('2FMDK30C59B461657', '77', '9', to_date('03-07-2020','dd-mm-yyyy'), 85000);

INSERT INTO SalesTransaction
VALUES
('WBAVC735X7K157172', '80', '2', to_date('10-07-2020','dd-mm-yyyy'), 27000);

INSERT INTO SalesTransaction
VALUES
('1B3AS56CX5D011327', '83', '3', to_date('15-07-2020','dd-mm-yyyy'), 33000);

INSERT INTO SalesTransaction
VALUES
('1FMNU42S85E002355', '86', '10', to_date('28-07-2020','dd-mm-yyyy'), 20000);

INSERT INTO SalesTransaction
VALUES
('2HKRL1866XH260929', '91', '7', to_date('29-07-2020','dd-mm-yyyy'), 421000);

INSERT INTO SalesTransaction
VALUES
('JTDDY38T0Y0596636', '92', '3', to_date('06-08-2020','dd-mm-yyyy'), 506000);

INSERT INTO SalesTransaction
VALUES
('1D8HD58PX6F699019', '93', '1', to_date('11-08-2020','dd-mm-yyyy'), 29000);

INSERT INTO SalesTransaction
VALUES
('5XYZHDAG7BG068764', '94', '6', to_date('18-08-2020','dd-mm-yyyy'), 30000);

INSERT INTO SalesTransaction
VALUES
('5TEUX42N77Z594593', '95', '11', to_date('11-09-2020','dd-mm-yyyy'), 90000);

INSERT INTO SalesTransaction
VALUES
('JTDBT923071533790', '96', '13', to_date('19-09-2020','dd-mm-yyyy'), 60000);

INSERT INTO SalesTransaction
VALUES
('1FTZR14E79P414838', '97', '5', to_date('25-10-2020','dd-mm-yyyy'), 60000);

INSERT INTO SalesTransaction
VALUES
('1FMJK1G57AE529996', '99', '12', to_date('26-11-2020','dd-mm-yyyy'), 55000);

INSERT INTO SalesTransaction
VALUES
('3VWSA69M95M008503', '100', '7', to_date('01-12-2020','dd-mm-yyyy'), 77500);


-----INSERT STATEMENTS FOR VIEWINGPARTY-----

INSERT INTO ViewingParty
VALUES
('1', '(03)9717-5555', 'freed8@baidu.com');

INSERT INTO ViewingParty
VALUES
('2', '(03)9436-1231', 'clewisc@hotmail.com');

INSERT INTO ViewingParty
VALUES
('3', '(03)9876-7762', 'wealthybankers@gmail.com');

INSERT INTO ViewingParty
VALUES
('4', '(03)9121-2223', 'eppinglawyers@gmail.com');

INSERT INTO ViewingParty
VALUES
('5', '1-(421)543-7554', 'rhughes4@gmail.com');

INSERT INTO ViewingParty
VALUES
('6', '6-(188)104-3107', 'afrazier3@gmail.com');

INSERT INTO ViewingParty
VALUES
('7', '7-(745)570-0836', 'dperkins@yahoo.com');

INSERT INTO ViewingParty
VALUES
('8', '5-(608)490-1316', 'rbella@gmail.com');


-----INSERT STATEMENTS FOR ORGANISATION-----

INSERT INTO Organisation
VALUES
('3', 'Melbourne Bankers');

INSERT INTO Organisation
VALUES
('4', 'Epping Lawyers');

INSERT INTO Organisation
VALUES
('7', 'Perkins Industries');

INSERT INTO Organisation
VALUES
('8', 'Rebella Corp');



-----INSERT STATEMENTS FOR INTERNATIONALGUESTS-----

INSERT INTO InternationalGuests
VALUES
('5', 'United States');

INSERT INTO InternationalGuests
VALUES
('6', 'United States');

INSERT INTO InternationalGuests
VALUES
('7', 'Canada');

INSERT INTO InternationalGuests
VALUES
('8', 'Italy');


-----INSERT STATEMENTS FOR CARSVIEWED-----

INSERT INTO CarsViewed
VALUES
('2B7JB33R9CK683376', '1', to_date('01-02-2019', 'dd-mm-yyyy'), 500);

INSERT INTO CarsViewed
VALUES
('1GTHC29D56E184231', '2', to_date('20-03-2019', 'dd-mm-yyyy'), 300);

INSERT INTO CarsViewed
VALUES
('1GTHC29D56E184231', '4', to_date('11-03-2019', 'dd-mm-yyyy'), 300);

INSERT INTO CarsViewed
VALUES
('2B7JB33R9CK683376', '1', to_date('03-06-2019', 'dd-mm-yyyy'), 500);

INSERT INTO CarsViewed
VALUES
('2B7JB33R9CK683376', '3', to_date('21-09-2019', 'dd-mm-yyyy'), 500);

INSERT INTO CarsViewed
VALUES
('1GTJC39U03E743638', '5', to_date('13-11-2019', 'dd-mm-yyyy'), 450);

INSERT INTO CarsViewed
VALUES
('1GTJC39U03E743638', '7', to_date('18-12-2019', 'dd-mm-yyyy'), 450);

INSERT INTO CarsViewed
VALUES
('1GTHC29D56E184231', '2', to_date('28-02-2021', 'dd-mm-yyyy'), 450);

INSERT INTO CarsViewed
VALUES
('1GTEK39JX9Z328709', '4', to_date('17-03-2021', 'dd-mm-yyyy'), 600);

INSERT INTO CarsViewed
VALUES
('1GTEK39JX9Z328709', '6', to_date('21-03-2021', 'dd-mm-yyyy'), 600);

INSERT INTO CarsViewed
VALUES
('1GCEC19T11Z986314', '8', to_date('09-04-2021', 'dd-mm-yyyy'), 500);

-----END INSERT STATEMENTS-----
COMMIT;