CREATE TABLE FLIGHT (
    Flight_ID          VARCHAR2(6)   NOT NULL,
    Depart_Airport     VARCHAR2(5),
    CONSTRAINT FLIGHT_PK PRIMARY KEY (Flight_ID)
);

CREATE TABLE AIRPORT (
    Airport            VARCHAR2(5)   NOT NULL,
    Airport_Name       VARCHAR2(50),
	Region             VARCHAR2(20),
    CONSTRAINT AIRPORT_PK PRIMARY KEY (Airport)
);

CREATE TABLE PASSENGER (
    Passenger_ID       VARCHAR2(6)   NOT NULL,
    P_Name             VARCHAR2(100),
    CONSTRAINT PASSENGER_PK PRIMARY KEY (Passenger_ID)
);

CREATE TABLE MEAL (
    Meal               VARCHAR2(6)   NOT NULL,
    Meal_Description   VARCHAR2(90),
    CONSTRAINT MEAL_PK PRIMARY KEY (Meal)
);

INSERT INTO FLIGHT VALUES ('IS617','KIX');
INSERT INTO FLIGHT VALUES ('IS658','HKG');
INSERT INTO FLIGHT VALUES ('IS676','HKG');
INSERT INTO FLIGHT VALUES ('IS679','OKA');

INSERT INTO AIRPORT VALUES ('HKG','Hong Kong','Asia');
INSERT INTO AIRPORT VALUES ('KIX','Kansai, Osaka','Asia');
INSERT INTO AIRPORT VALUES ('NRT','Narita, Tokyo','Asia');
INSERT INTO AIRPORT VALUES ('OKA','Naha, Okinawa','Asia');

INSERT INTO PASSENGER VALUES ('P5260','Brendon Lee');
INSERT INTO PASSENGER VALUES ('P5270','Lily So');
INSERT INTO PASSENGER VALUES ('P5290','Jason Ma');
INSERT INTO PASSENGER VALUES ('P6260','Sam Tang');

INSERT INTO MEAL VALUES ('BABY','Baby Meal');
INSERT INTO MEAL VALUES ('HINDU','Hindu Meal');
INSERT INTO MEAL VALUES ('LOWFC','Low fat or cholesterol');
INSERT INTO MEAL VALUES ('VEG','Vegan meal');

INSERT INTO SPECIAL_MEAL_ORDER VALUES ('IS676','12-SEP-2021','P5260','43A','BABY');
INSERT INTO SPECIAL_MEAL_ORDER VALUES ('IS676','12-SEP-2021','P5290','12A','LOWFC');
INSERT INTO SPECIAL_MEAL_ORDER VALUES ('IS658','20-SEP-2021','P5270',null,'VEG');
INSERT INTO SPECIAL_MEAL_ORDER VALUES ('IS658','27-SEP-2021','P5270','34B','LOWFC');

COMMIT;



-- 1 Q1. Write a SQL statement to create the SPECIAL_MEAL_ORDER table above. (2 marks)

create table SPECIAL_MEAL_ORDER(
Flight_ID VARCHAR2(6)   NOT NULL,
Flight_Date DATE NOT NULL,
Passenger_ID	VARCHAR2(6)   NOT NULL,
Seat_Nbr	VARCHAR2(6),
Meal VARCHAR2(6),
PRIMARY KEY(Flight_ID,Flight_Date, Passenger_ID),
CONSTRAINT Flight_FK FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
CONSTRAINT Passenger_FK FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
CONSTRAINT Meal_FK FOREIGN KEY (Meal) REFERENCES MEAL(Meal);
);

-- 2 Q2. Write a SQL statement to add a new column, P_DOB to the PASSENGER table for storing their birth dates. (1 mark)

ALTER TABLE PASSENGER ADD COLUMN P_DOB DATE;



-- 3 Q3. Write a SQL statement to change the max length of Meal_Description of the MEAL table to be 100. (1 mark)
ALTER TABLE MEAL MODIFY Meal_Description VARCHAR2(100);


-- 4 Q4. Write a SQL statement to drop the Region column from the AIRPORT table. (1 mark)
ALTER TABLE AIRPORT DROP COLUMN Region;

-- Q5. Write a SQL statement to remove the FLIGHT table. (1 mark)

DROP TABLE FLIGHT;


-- Q6. Write a SQL statement to insert a new record to the PASSENGER table, with ID ‘P6000’, name ‘Samuel Lai’ and Date of Birth 2 September 2000. (1 mark)

INSERT INTO PASSENGER VALUES ('P6000','Samuel Lai', TO_DATE('2000-09-02','YYYY-MM-DD'));

-- Q7. Write a SQL statement to remove the new PASSENGER record we have just created in Q6. (1 mark)

DELETE FROM PASSENGER WHERE Passenger_ID='P6000';


-- Q8. Write a SQL statement to change the departure airport (Depart_Airport) to be Narita, Tokyo (‘NRT’) for the flight with ID IS600. (1 mark)

UPDATE FLIGHT SET Depart_Airport='NRT' WHERE Flight_ID='IS600';


-- Q9. Write a SQL statement to display the name of Passenger P5260. (1 mark)
SELECT  P_Name FROM PASSENGER WHERE Passenger_ID='P5260';


-- Q10. Write a SQL statement to display the flight records with special meal ordering from ‘Lily So’. Include the flight ID, date, and seat number in the result, and sort by the flight date in descending order. (3 marks)

SELECT f.Flight_ID, sm.Flight_Date, Seat_Nbr
FROM FLIGHT f JOIN SPECIAL_MEAL_ORDER sm ON f.Flight_ID=sm.Flight_ID
JOIN PASSENGER p ON p.Passenger_ID=sm.Passenger_ID
WHERE p.P_Name='Lily So'
ORDER BY sm.Flight_Date;


-- Q11. Write a SQL statement to count the number of passengers requested special meal services for each flight offered by Yoshi Airlines on ’12-SEP-2021’. List the ID and departure airport name of the flight, and also the count in the result. (3 marks)

SELECT f.Flight_ID, a.Airport_Name, count(sm.Passenger_ID)
FROM FLIGHT f JOIN SPECIAL_MEAL_ORDER sm ON f.Flight_ID=sm.Flight_ID
JOIN AIRPORT a ON a.Airport=f.Depart_Airport
WHERE to_char(sm.Flight_Date,'DD-MON-YYYY')='12-SEP-2021'
GROUP BY f.Flight_ID, a.Airport_Name;

-- Q12. Write a SQL statement to list the passengers who have made special orders on two or more different meals. Include the passenger ID and name in the result. (4 marks)


SELECT p.Passenger_ID, p.P_Name
FROM SPECIAL_MEAL_ORDER sm
JOIN PASSENGER p ON p.Passenger_ID=sm.Passenger_ID
GROUP BY p.Passenger_ID, p.P_Name
HAVING COUNT(DISTINCT sm.Meal)>=2;
