

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
    PRIMARY KEY(Plate_number)
);

CREATE TABLE RIDER
(
    Rider_id INT NOT NULL,
    Mobile_number VARCHAR(32),
    Name_rider VARCHAR(100),
    Email_address VARCHAR(100),
    Payment_info VARCHAR(100),
    Promotion_id INT,
    PRIMARY KEY(Rider_id)
);


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



create or replace trigger invoice_generate
after update
on RIDE for each row
declare
 v_status varchar(100);
 v_no number;
 v_id number;
begin
 select Ride_status ,Rider_id into v_status, v_id from RIDE;
 select count(*)+1 into v_no from ride_invoice;
 if v_status in ('Completion','Cancellation') then
   insert into ride_invoice values(v_no, sysdate, 5,5,5,5,0, v_id);
 end if;
end;