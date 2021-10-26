-- a. Display the name of the customer who has purchased the most cars from Archie’s Luxury
-- Motors.
select c.name
from customer c join SalesTransaction st on c.custID=st.custID
group by c.name
having count(st.VIN)=(select max(carNum) from (select count(VIN) carNum from SalesTransaction group by custID));

/*
NAME
Sean Knight
*/
-- b. For each sales agent, display their ID and name, along with the total number of sales they have
-- made thus far. Order by number of sales decreasing.

select sa.agentID, sa.name, count(st.VIN) as salesNumber
from SalesAgent sa join SalesTransaction st on sa.agentID=st.agentID
group by sa.agentID, sa.name
order by salesNumber desc;

/*
AGENTID	NAME	SALESNUMBER
5	Jack Thompson	7
3	Ian Anne	6
9	Marco Reus	5
6	Paul Pogba	5
4	Paul Tonis	5
1	Mark Licciardi	5
14	Antonio Cassano	5
11	Arturo Vidal	5
12	Mattia Destro	5
13	Fernando Llorente	4
10	Claudio Marchisio	4
2	Michael Bruce	4
7	Marco Verratti	4
8	Daniele Rugani	1
*/

-- c. For each month in 2020, display the total profit (i.e., using the attributes purchasedPrice
-- and agreedPrice) generated from car sales only. Do not consider any discounts.
select to_char(st.dateOfSale,'MON') as mon, sum(st.agreedPrice-c.purchasedPrice) as totalProfit
from SalesTransaction st join Car c on st.VIN=c.VIN
where to_char(st.dateOfSale,'YYYY')=2020
group by to_char(st.dateOfSale,'MON') ;


/*
MON	TOTALPROFIT
DEC	2500
APR	4000
JUN	4000
NOV	3000
AUG	13000
FEB	10000
JUL	15000
OCT	3000
MAR	2000
JAN	17500
MAY	12500
SEP	10000
*/
-- d. Display the details (i.e., Manufacturer name, model name, type, and the number of times it was
-- sold) of the top selling European car model. Hint: use the manufacturer region information.

select m.name as manufacturerName, mo.name as modelName, mo.type as modelType, count(mo.modelNo)
from SalesTransaction st join Car c on st.VIN=c.VIN
join Model mo on mo.modelNo=c.modelNo
join Manufacturer m on m.manufacturerID=mo.manufacturerID
where m.region='EUROPE'
group by m.name, mo.name, mo.type
having count(st.VIN)= (select max(carNumbers) from (select count(st.VIN) as carNumbers
from SalesTransaction st join Car c on st.VIN=c.VIN
join Model mo on mo.modelNo=c.modelNo
join Manufacturer m on m.manufacturerID=mo.manufacturerID
where m.region='EUROPE'
group by c.modelNo) );

/*

MANUFACTURERNAME	MODELNAME	MODELTYPE	COUNT(ST.VIN)
Audi	R8	COUPE	6
*/

select m.name as manufacturerName, mo.name as modelName, mo.type as modelType, count(mo.modelNo)
from Manufacturer m join Model mo on m.manufacturerID=mo.manufacturerID
join Car c on c.modelNo=mo.modelNo
join SalesTransaction st on c.VIN=st.VIN
where m.region='EUROPE'
group by m.name, mo.name, mo.type;



select c.modelNo, count(st.VIN)
from SalesTransaction st join Car c on st.VIN=c.VIN
group by c.modelNo
having count(st.VIN)= (select max(carNumbers) from (select count(st.VIN) as carNumbers
from SalesTransaction st join Car c on st.VIN=c.VIN
group by c.modelNo) )



-- e. Display the average number of sales transactions (i.e., car sales) per month. Hint: count the
-- number of sales for each month, then divide the count by the number of years the dealership
-- has been making transactions for.

select to_char(st.dateOfSale,'MON') as mon,
count(st.VIN)/((select months_between((select max(dateOfSale) from SalesTransaction),(select min(dateOfSale) from SalesTransaction)) from dual)/12) as avgNumSales
from SalesTransaction st
group by to_char(st.dateOfSale,'MON');

/*
MON	AVGNUMSALES
DEC	.5438596491228070175438596491228070175431
APR	1.63157894736842105263157894736842105263
JUN	2.71929824561403508771929824561403508772
NOV	1.08771929824561403508771929824561403509
AUG	3.26315789473684210526315789473684210526
FEB	3.8070175438596491228070175438596491228
JUL	5.98245614035087719298245614035087719297
OCT	3.26315789473684210526315789473684210526
MAR	3.8070175438596491228070175438596491228
JAN	2.71929824561403508771929824561403508772
MAY	4.89473684210526315789473684210526315789
SEP	2.17543859649122807017543859649122807017
*/

--select to_char(st.dateOfSale,'MON') as mon, count(st.VIN)
--from SalesTransaction st
--group by to_char(st.dateOfSale,'MON');

-- f. Display the total profit to date for Archie’s Luxury Motors. Note that you must take into
-- consideration all car sales (ignoring unsold cars as they may be sold later) and viewing party
-- shows, and any VIP discounts that may apply. Do not subtract any commission owed to the
-- senior sales agents.

select t1.sellProfit+t2.viewPaid as totalProfit
from
(
select sum(case when cus.type='VIP' and st.agreedPrice>=50000 then st.agreedPrice*0.95-c.purchasedPrice
else st.agreedPrice-c.purchasedPrice end) as sellProfit
from SalesTransaction st join Car c on st.VIN=c.VIN
join Customer cus on cus.custID=st.custID
) t1,
(
select sum(amountPaid) as viewPaid
from CarsViewed
) t2;
/*
TOTALPROFIT
6250
*/


-- - Note: A VIP customer gets a 5% discount for any car purchase greater than or equal to
-- $50,000 AUD. However, the agreed price stored in the database is without the discount. For
-- each car sold to a VIP customer with an agreed price of $50,000 AUD or more, you should
-- subtract this 5% discount from the agreed price when calculating the profit. Also note that the
-- profit from each viewing party show is equal to the amount paid for the show.


-- a. Write a stored procedure that accepts a particular year as input, and as output displays the
-- number of cars sold grouped by the 3 mileage groups (Low Mileage: <50000km, Medium
-- Mileage: >=50000km & <150000km, High Mileage: >=150000km). Also display the total
-- number of cars sold overall.

create or replace procedure prc_year_cars_sold(year in number, mycur out sys_refcursor)
as
begin
    open mycur
    for
    select case when c.currentMileage<50000 then 'Low Mileage'
    when c.currentMileage>=50000 and c.currentMileage<150000 then 'Medium Mileage'
    when c.currentMileage>=150000 then 'High Mileage' end as mileageGroup,
    count(st.VIN) as totalSold
    from SalesTransaction st join Car c on st.VIN=c.VIN
    where to_char(st.dateOfSale,'YYYY')=year
    group by
    case when c.currentMileage<50000 then 'Low Mileage'
    when c.currentMileage>=50000 and c.currentMileage<150000 then 'Medium Mileage'
    when c.currentMileage>=150000 then 'High Mileage' end;
end;


var type_cur sys_refcursor;
var year number;
execute :year :=2020;
exec prc_year_cars_sold(:year,:type_cur);
print type_cur;

-- b. Write a stored function that uses a senior agent’s ID as input and calculates the total
-- commission owed to date for that agent. You also need to show an SQL statement to display
-- the total amount of commission (i.e., the sum) owed to all senior agents in the database.


create or replace function fn_senior_commission(aid number)
return number
is
owedCommission number;
begin
    select
    sum(
    case when st.agreedPrice>c.askingPrice
    then (st.agreedPrice-c.askingPrice)*round((months_between((select sysdate from dual),sa.yearPromoted))/12)/100
    else 0 end) into owedCommission
    from SeniorAgent sa join SalesTransaction st on sa.agentID=st.agentID
    join Car c on c.VIN=st.VIN
    where sa.agentID=aid;
    return owedCommission;
end;

select fn_senior_commission(1) from dual;

/*
FN_SENIOR_COMMISSION(1)
850
*/

--select round((months_between((select sysdate from dual),sa.yearPromoted))/12)
--from SeniorAgent sa join SalesTransaction st on sa.agentID=st.agentID;


select sa.agentID,
sum(
case when st.agreedPrice>c.askingPrice
then (st.agreedPrice-c.askingPrice)*round((months_between((select sysdate from dual),sa.yearPromoted))/12)/100
else 0 end) as owedCommission
from SeniorAgent sa join SalesTransaction st on sa.agentID=st.agentID
join Car c on c.VIN=st.VIN
group by sa.agentID;

/*
AGENTID	OWEDCOMMISSION
2	720
5	230
1	850
3	600
4	240
*/

-- - Note: the commission policy states that a senior agent receives an additional 1% commission
-- multiplier for each year since they became a senior agent, rounding down to the nearest full year. This
-- means that a senior agent who was promoted 4.25 years before the date of sale, would have their
-- commission calculated as (agreedPrice – askingPrice) × 4%. Also, a senior agent receives the
-- commission only when the agreedPrice is greater than the askingPrice stored in the database. The
-- asking price in the database is not visible to customers.

-- a. A Trigger which automatically stores in a separate table called ‘ExcellentSale’ the Sales Agent
-- name, car model and manufacturer name, each time the agreed price of a
-- SalesTransaction is more than 20% above the car’s asking price. (Note: You need to
-- create the ‘ExcellentSale’ table before implementing this trigger. To create the primary key, use
-- a sequence that starts at 1 and increments by 1).

create table ExcellentSale (
Id number primary key,
agentName varchar2(50),
carModel varchar2(50),
manufacturerName varchar2(50)
);



create sequence SEQ_EX_SALE
minvalue 1
maxvalue 999999
start with 1
increment by 1
cache 50
cycle;

create or replace trigger trg_auto_exsale
after insert on SalesTransaction for each row
declare
agentName varchar2(50);
carModel varchar2(50);
manufacturerName varchar2(50);
askingPrice number;
begin
    select m.name into carModel, man.name into manufacturerName, c.askingPrice into askingPrice
    from Model m join Car c on m.modelNo=c.modelNo
    join Manufacturer man on man.manufacturerID=m.manufacturerID
    where c.VIN= :new.VIN;

    select name into agentName
    from SalesAgent
    where agentID=:new.agentID;

    if (:new.agreedPrice-askingPrice)/askingPrice>=0.2 then

        insert into ExcellentSale values(
        SEQ_EX_SALE.nextval,
        agentName,
        carModel,
        manufacturerName
        );
    end if;
end;

create or replace trigger trg_auto_exsale
after insert on SalesTransaction
for each row
agentName varchar2(50);
carModel varchar2(50);
manufacturerName varchar2(50);
askingPrice number;
begin
    select m.name into carModel, man.name into manufacturerName, c.askingPrice into askingPrice
    from Model as m join Car as c on m.modelNo=c.modelNo
    join Manufacturer man on man.manufacturerID=m.manufacturerID
    where c.VIN=:new.VIN;
    select name into agentName
    from SalesAgent
    where agentID=:new.agentID;
    if (new.agreedPrice-askingPrice)/askingPrice>=0.2 then
        insert into ExcellentSale values(
        SEQ_EX_SALE.nextVal,
        agentName,
        carModel,
        manufacturerName
        );
    end if;
end;


