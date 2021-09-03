-- Remove old data
DROP TYPE IF EXISTS demoFirstnames;
DROP TYPE IF EXISTS demoSurnames;
DROP TYPE IF EXISTS demoColours;
DROP TYPE IF EXISTS demoCarModels;
DROP TYPE IF EXISTS demoCities;
DROP TYPE IF EXISTS demoStreetTypes;

CREATE SCHEMA CarHire;

SET search_path TO CarHire;

DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS TripLog;

-- Relations to hold dataset
CREATE TABLE Driver (
  driver_id   SERIAL,
  given_name  VARCHAR(100),
  family_name VARCHAR(100),
  address     VARCHAR(200)
);

CREATE TABLE Vehicle (
  car_id   SERIAL,
  name     VARCHAR(100),
  descr    VARCHAR(100),
  model    VARCHAR(20),
  year     INTEGER,
  city     VARCHAR(40)
);

CREATE TABLE TripLog (
 id         SERIAL,
 car_id     INTEGER,
 driver_id  INTEGER,
 start_time TIMESTAMP,
 end_time   TIMESTAMP,
 distance   NUMERIC
);


-- Sample names to use to populate relation
CREATE TYPE demoFirstnames as enum ( 'Adam', 'Albert', 'Alex', 'Alfie', 'Ali', 'Amir', 'Andrew', 'Anna', 'Arthur', 'Beatrice', 'Bea', 'Boris', 'Bruno', 'Caroline', 'Cesar', 'Charlie', 'Christine', 'Clara', 'Clarence', 'Daniel', 'David', 'Davina', 'Dmitry', 'Elena', 'Emily', 'Emma', 'Eric', 'Ethan', 'Eve', 'Felicity', 'Gabriel', 'George', 'Gordon', 'Gregor', 'Hanna', 'Harry', 'Henrietta', 'Hugo', 'Hussain', 'Igor', 'Ines', 'Ivan', 'Jack', 'James', 'Janice', 'Javier', 'Jessica', 'Julian', 'Julie', 'Lara', 'Lars', 'Lea', 'Liam', 'Lily', 'Logan', 'Luka', 'Lucy', 'Marco', 'Mario', 'Marta', 'Martin', 'Martina', 'Matilde', 'Max', 'Maya', 'Mehmet', 'Michael', 'Muhammad', 'Nora', 'Norbert', 'Oliver', 'Olivia', 'Omer', 'Paul', 'Pauline', 'Peter', 'Philipe', 'Riley', 'Robin', 'Ruby', 'Samuel', 'Sarah', 'Seren', 'Sho', 'Sofia', 'Sophie', 'Stephen', 'Steve', 'Thomas', 'Tim', 'Tom', 'Usman', 'Victor', 'Vince', 'William', 'Yanis', 'Yusuf', 'Yuma', 'Zehra', 'Zuzanna');
CREATE TYPE demoSurnames as enum ( 'Andrews', 'Bodkins', 'Davis', 'Edmondson', 'Fawlty', 'Gingrich', 'Hardy', 'Jones', 'Jackson', 'Kinsley', 'Lindfield', 'McArthur', 'Olson', 'Peters', 'Rangers', 'Swan', 'Trevor', 'Underberg', 'Wilson', 'Winsor', 'Yankee', 'Zulu' );
CREATE TYPE demoColours as enum ('Blue', 'Green', 'Pink', 'Red', 'Yellow', 'Grey', 'White', 'Black','Silver','Purple','Teal');
CREATE TYPE demoCities as enum ('Sydney', 'Melbourne', 'Brisbane', 'Adelaide', 'Hobart', 'Darwin', 'Perth', 'Auckland', 'Wellington', 'Christchurch');
CREATE TYPE demoStreetTypes as enum ('Road', 'Street', 'Avenue','Way', 'Cresent', 'Circuit');


-- Vehicles table helper
CREATE TYPE demoCarModels as enum('Corolla', 'A4', 'Jazz', 'Camry', 'Pajero', 'X3', 'Commodore', 'Falcon', 'Versa', 'Outback', 'Sorrento', 'CX-9', 'Hilux', 'Mazda', 'Festiva', 'Civic', 'Impala','Golf','Prius','Transporter');

-- Populate tables
-- Driver
INSERT INTO Driver
 SELECT id, 
    (ENUM_RANGE(NULL::demoFirstnames))[ceil(100*random())], 
    (ENUM_RANGE(NULL::demoSurnames))[ceil(26*random())], 
    (ceil(1000*random())::text)||' '||(ENUM_RANGE(NULL::demoSurnames))[ceil(26*random())]||' '||(ENUM_RANGE(NULL::demoStreetTypes))[ceil(6*random())] AS desc FROM
 (SELECT * FROM generate_series(1,100000) AS id) AS x;

-- Vehicle
INSERT into Vehicle
 SELECT id,
 (ENUM_RANGE(NULL::demoFirstnames))[ceil(100*random())], 
 (ENUM_RANGE(NULL::demoColours))[ceil(10*random())], 
 (ENUM_RANGE(NULL::demoCarModels))[ceil(20*random())], 
 (1998+ceil(random()*20)),
 (ENUM_RANGE(NULL::demoCities))[ceil(10*random())] as DESC FROM
 (SELECT * FROM generate_series(1,100000) AS id) AS x;

 -- TripLog
CREATE OR REPLACE FUNCTION generateTripLogs(howManyTrips INTEGER) RETURNS VOID AS
$$
DECLARE
    tripDuration interval := interval '3600';
    tripStart timestamp := timestamp '2016-01-01 20:00:00';
    i integer := 0;
BEGIN
    IF howManyTrips < 0 THEN
        howManyTrips = 10000000; -- default 10,000,000 trips
    END IF;
    FOR i in 1..howManyTrips LOOP
        tripStart := (timestamp '2016-01-01 20:00:00' + random() * (interval '3 years'));
        tripDuration := (interval '3 hours')*(abs(random() - random())); -- 3 hour interval, skewed towards lower trip durations
        INSERT into TripLog(car_id, driver_id, start_time, end_time, distance)
        VALUES (
            ceil(100000*random()), 
            ceil(100000*random()), 
            tripStart,
            tripStart+tripDuration,
            ceil(300*abs(random()-random()))); -- 300 distance, skewed towards lower distances
    END LOOP;
END;
$$ LANGUAGE plpgsql; 
    

select generateTripLogs(1000000); -- add 1000000 trips


-- Clear the enums as no longer required
DROP TYPE IF EXISTS demoFirstnames;
DROP TYPE IF EXISTS demoSurnames;
DROP TYPE IF EXISTS demoColours;
DROP TYPE IF EXISTS demoCities;
DROP TYPE IF EXISTS demoCarModels;
DROP TYPE IF EXISTS demoStreetTypes;
