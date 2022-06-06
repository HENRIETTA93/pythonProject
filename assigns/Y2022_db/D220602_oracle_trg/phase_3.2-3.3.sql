-------------------------------------implement database tables
CREATE TABLE DAILY_SCHEDULE
(
    Schedule_id INT NOT NULL,
    Start_time TIMESTAMP,
    End_time TIMESTAMP,
    Driver_id INT,
    PRIMARY KEY(Schedule_id),
    CONSTRAINT FK_DRIVER1 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id)
);

---------------------------------------
CREATE TABLE CAR 
(
    Plate_number VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Year VARCHAR(50) CHECK(Year >= '2010'),
    Date_of_purchase DATE,
    Insurance_number VARCHAR(50),
    Mileage INT,
    Category VARCHAR(50),
    Doors NUMBER CHECK(Doors = '4'),
    Seats NUMBER CHECK(Seats >= '4'),
    Type_id INT,
    PRIMARY KEY(Plate_number),
    CONSTRAINT FK_TYPE1 FOREIGN KEY(Type_id) REFERENCES CAR_TYPE(Type_id)
);

-------------------------------------------
CREATE TABLE MAINTENANCE
(
    Maintenance_id INT NOT NULL,
    Date_of_maintenance DATE,
    Maintenance_Type VARCHAR(50),
    Centre_name VARCHAR(100),
    Car_condition VARCHAR(100),
    Plate_number VARCHAR(50),
    PRIMARY KEY(Maintenance_id),
    CONSTRAINT FK_PLATE1 FOREIGN KEY(Plate_number) REFERENCES CAR(Plate_number)
);

---------------------------------------------
CREATE TABLE MAINTENANCE_TEST
(
    Test_id INT NOT NULL,
    Test_results VARCHAR(100),
    Maintenance_id INT,
    PRIMARY KEY(Test_id),
    CONSTRAINT FK_MAINTENANCE1 FOREIGN KEY(Maintenance_id) REFERENCES MAINTENANCE(Maintenance_id)
);

-----------------------------------------------
CREATE TABLE CAR_LOCATION
(
    Loc_id INT NOT NULL,
    Record_5mins VARCHAR(100),
    Plate_number VARCHAR(50),
    PRIMARY KEY(Loc_id),
    CONSTRAINT FK_PLATE2 FOREIGN KEY(Plate_number) REFERENCES CAR(Plate_number)
);

-----------------------------------------------
CREATE TABLE BEHAVIOUR_LOG
(
    Breach_id INT NOT NULL,
    Activity_type VARCHAR(50),
    Breach_date DATE,
    Breach_level INT,
    Feedback VARCHAR(1000),
    Driver_id INT,
    PRIMARY KEY(Breach_id),
    CONSTRAINT FK_DRIVER2 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id)
);

---------------------------------------------------
CREATE TABLE DRIVER_PAYMENT
(
    Payment_id INT NOT NULL,
    Status VARCHAR(50),
    Charge NUMBER,
    Ola_fees NUMBER,
    Driver_id INT,
    PRIMARY KEY(Payment_id),
    CONSTRAINT FK_DRIVER3 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id)
);

-----------------------------------------------------
CREATE TABLE PROMOTION
(
    Promotion_id INT NOT NULL,
    Coupon_code VARCHAR(50),
    Discount NUMBER,
    Condition VARCHAR(100),
    Booking_id INT,
    PRIMARY KEY(Promotion_id),
    CONSTRAINT FK_BOOKING1 FOREIGN KEY(Booking_id) REFERENCES RIDE_BOOKING(Booking_id)
);

-------------------------------------------------------
CREATE TABLE CREDIT_CARD
(
    Card_number INT NOT NULL,
    Exp_date DATE,
    CVV NUMBER,
    Rider_id INT,
    PRIMARY KEY(Card_number),
    CONSTRAINT FK_RIDER1 FOREIGN KEY(Rider_id) REFERENCES RIDER(Rider_id)
);

-----------------------------------------------------------------
CREATE TABLE RIDE_INVOICE
(
    Invoice_number INT NOT NULL,
    Invoice_date DATE,
    Fixed_booking_fee NUMBER,
    Fixed_base_fare NUMBER,
    Travel_fee NUMBER,
    Waiting_fee NUMBER,
    Applied_discount NUMBER,
    Rider_id INT,
    PRIMARY KEY(Invoice_number),
    CONSTRAINT FK_RIDER2 FOREIGN KEY(Rider_id) REFERENCES RIDER(Rider_id)
);

----------------------------------------------------
CREATE TABLE RIDER
(
    Rider_id INT NOT NULL,
    Mobile_number VARCHAR(32),
    Name_rider VARCHAR(100),
    Email_address VARCHAR(100),
    Payment_info VARCHAR(100),
    Promotion_id INT,
    PRIMARY KEY(Rider_id),
    CONSTRAINT FK_PROMOTION1 FOREIGN KEY(Promotion_id) REFERENCES PROMOTION(Promotion_id) 
);

-----------------------------------------------------
CREATE TABLE RIDE
(
    Ride_id INT NOT NULL,
    Ride_status VARCHAR(100),
    Arrival_time TIMESTAMP,
    Ride_started_time TIMESTAMP,
    Ride_ended_time TIMESTAMP,
    Rider_call CHAR(2),
    Plate_number VARCHAR(50),
    Driver_id INT,
    Payment_id INT,
    Rider_id INT,
    PRIMARY KEY(Ride_id),
    CONSTRAINT FK_PLATE3 FOREIGN KEY(Plate_number) REFERENCES CAR(Plate_number),
    CONSTRAINT FK_DRIVER4 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id),
    CONSTRAINT FK_PAYMENT1 FOREIGN KEY(Payment_id) REFERENCES DRIVER_PAYMENT(Payment_id),
    CONSTRAINT FK_RIDER3 FOREIGN KEY(Rider_id) REFERENCES RIDER(Rider_id)
);

------------------------------------------------------
CREATE TABLE RIDE_BOOKING
(
    Booking_id INT NOT NULL,
    Destination VARCHAR(1000),
    Pickup_address VARCHAR(1000),
    Car_type VARCHAR(50),
    Coupon_code VARCHAR(50),
    Driver_name VARCHAR(100),
    Estimated_arrival_time TIMESTAMP,
    Driver_rating INT,
    Profile_photo VARCHAR(1000),
    Plate_number VARCHAR(50),
    Rider_id INT,
    Type_id INT,
    Driver_id INT,
    PRIMARY KEY(Booking_id),
    CONSTRAINT FK_RIDER4 FOREIGN KEY(Rider_id) REFERENCES RIDER(Rider_id),
    CONSTRAINT FK_TYPE2 FOREIGN KEY(Type_id) REFERENCES CAR_TYPE(Type_id),
    CONSTRAINT FK_DRIVER5 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id)
);

-------------------------------------------------------
CREATE TABLE DRIVER
(
    Driver_id INT NOT NULL,
    Name_driver VARCHAR(100),
    Date_of_birth DATE,
    Licence_number INT,
    Driving_experience NUMBER CHECK (Driving_experience >= '12'),
    Proof_of_identity VARCHAR(1000),
    Account_name VARCHAR(100),
    BSB INT,
    Account_number INT,
    Driver_status VARCHAR(100),
    PRIMARY KEY(Driver_id)
);

----------------------------------------------------------
CREATE TABLE CAR_TYPE
(
    Type_id INT NOT NULL,
    Capacity VARCHAR(50),
    Car_type VARCHAR(50),
    Unit_fare_price NUMBER,
    PRIMARY KEY(Type_id)
);

------------------------------------------------------
CREATE TABLE DRIVER_REGISTER
(
    Driver_id INT,
    Plate_number VARCHAR(50),
    CONSTRAINT FK1 FOREIGN KEY(Driver_id) REFERENCES DRIVER(Driver_id),
    CONSTRAINT FK2 FOREIGN KEY(Plate_number) REFERENCES CAR(Plate_number),
    CONSTRAINT PK_DR PRIMARY KEY(Driver_id, Plate_number)
);

----------------------------------------------------------------
CREATE TABLE GENERATE
(
    Ride_id INT,
    Invoice_number INT,
    CONSTRAINT FK3 FOREIGN KEY(Ride_id) REFERENCES RIDE(Ride_id),
    CONSTRAINT FK4 FOREIGN KEY(Invoice_number) REFERENCES RIDE_INVOICE(Invoice_number),
    CONSTRAINT PK_GENERATE PRIMARY KEY(Ride_id, Invoice_number)
);

---------------------------------------------------------
CREATE TABLE BEGIN
(
    Booking_id INT,
    Ride_id INT,
    CONSTRAINT FK5 FOREIGN KEY(Booking_id) REFERENCES RIDE_BOOKING(Booking_id),
    CONSTRAINT FK6 FOREIGN KEY(Ride_id) REFERENCES RIDE(Ride_id),
    CONSTRAINT PK_BEGIN PRIMARY KEY(Booking_id, Ride_id)
);

--------------------------------------------------------trigger 1
create or replace trigger driver_terminated
after insert
on BEHAVIOUR_LOG
declare
v_Driver_id INT;
v_Breach_id INT;
begin
select count(*), Driver_id into v_Breach_id, v_Driver_id from BEHAVIOUR_LOG;
if v_Breach_id > 10
then
update DRIVER
set Driver_status = 'Terminate'
where Driver_id = v_Driver_id;
end if;
end;

------------------------------------------------------------trigger 2
create or replace trigger daily_payments
after update on DRIVER_PAYMENT
for each row 
declare
payment_amount number;
begin
select (Fixed_booking_fee + Fixed_base_fare + Travel_fee + Waiting_fee + Applied_discount) into payment_amount
    from RIDE_INVOICE join RIDER using(Rider_id)
    where Invoice_date = SYSDATE;
    update DRIVER_PAYMENT
    set Charge = payment_amount - Ola_fees;
end;

------------------------------------------------------------trigger 3
create or replace trigger invoice_generate
after update on RIDE
for each row 
declare
v_Ride_status VARCHAR(100);
v_Invoice_number INT;
v_Invoice_date DATE;
v_Fixed_booking_fee NUMBER;
v_Fixed_base_fare NUMBER;
v_Travel_fee NUMBER;
v_Waiting_fee NUMBER;
v_Applied_discount NUMBER;
begin
select Ride_status into v_Ride_status from RIDE where Ride_status in ('Completion','Cancellation');
update RIDE_INVOICE set 
Invoice_number = v_Invoice_number, Invoice_date = v_Invoice_date, Fixed_booking_fee = v_Fixed_booking_fee, Fixed_base_fare = v_Fixed_base_fare, Travel_fee = v_Travel_fee, Waiting_fee = v_Waiting_fee, Applied_discount = v_Applied_discount
where Ride_status = v_Ride_status;
end;



---------------------------------------------------Phase 3.3 procedures or functions 1
create or replace function number_of_cards(v_Rider_id in INT)
RETURN NUMBER IS
number_of_cards INT;
begin
select count(*) into number_of_cards from CREDIT_CARD
where Rider_id = v_Rider_id;
return number_of_cards;
end;

----------------------------------------------------procedures or functions 2
create or replace procedure get_invoice_details is

    v_Invoice_number INT;
    v_Invoice_date DATE;
    v_Fixed_booking_fee NUMBER;
    v_Fixed_base_fare NUMBER;
    v_Travel_fee NUMBER;
    v_Waiting_fee NUMBER;
    v_Applied_discount NUMBER;
    v_Rider_id INT;
    begin
    select Invoice_number, Invoice_date, Fixed_booking_fee, v_Fixed_base_fare, Travel_fee, Waiting_fee, Applied_discount into v_Invoice_number,
    v_Invoice_date, v_Fixed_booking_fee, v_Fixed_base_fare, v_Travel_fee, v_Waiting_fee, v_Applied_discount from RIDE_INVOICE
    where Rider_id = v_Rider_id;
    end;
--------------------------------------------------------procedures or functions 3
create or replace procedure get_location is
    v_Loc_id INT;
    v_Record_5mins VARCHAR(100);
    v_Plate_number VARCHAR(50);
begin
select Loc_id, Record_5mins into v_Loc_id, v_Record_5mins from CAR_LOCATION
where Plate_number = v_Plate_number;
end;