-- 4,5
create database airlines;



DROP TABLE IF EXISTS airline;
CREATE TABLE airline  (
  year int,
  month int,
  carrier char(2) ,
  carrier_name varchar(50) ,
  airport char(3) ,
  airport_name varchar(100) ,
  arr_flights int ,
  arr_del15 int ,
  carrier_ct float,
  weather_ct float,
  nas_ct float,
  security_ct float,
  late_aircraft_ct float,
  arr_cancelled int,
  arr_diverted int ,
  arr_delay int,
  carrier_delay int,
  weather_delay int,
  nas_delay int,
  security_delay int,
  late_aircraft_delay int
);
-- 6 upload csv

-- 7
/*
a) To print distinct carrier, distinct year, distinct airport name
b) To print to first 10 record of year, month, airport name, carrier name and number of arrival at the
airport in descending order according to number of arrival
c) To fetch no of cancel arrival for each carrier
d) To fetch all data on # of flights delayed due to security for carrier American Airline in year 2003
e) To fetch all data of Alaska Airline where the # of flights delayed due to weather between 10 and
20
f) Display all airport name, year, month for # of flights that arrived at the airport is more than 500
flight
g) Calculate the average delays to security in airport with airport code OAK
h) Find the average of flights that arrived >= 15 minutes late by each carrier
*/
-- a)
select distinct carrier
from airline;

select distinct year
from airline;

select distinct airport
from airline;

-- b)
select year, month, airport_name, carrier_name, arr_flights
from airline
order by arr_flights desc
limit 10;


-- c)

select carrier, sum(arr_cancelled)
from airline
group by carrier;

-- d)
select *
from airline
where year=2003 and carrier_name like 'American Airlines%' and security_ct>0;

-- e)
select *
from airline
where carrier_name like 'Alaska Airlines%' and weather_ct between 10 and 20;


-- f)
select distinct airport_name, year, month
from airline
where arr_flights>500;


-- g)
select round(avg(security_ct),2) as average_delays
from airline
where airport='OAK';
-- h)

select carrier, avg(arr_del15)
from airline
group by carrier;

