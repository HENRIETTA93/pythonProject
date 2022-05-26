use kxo131;

-- First name, Last name and Phone number of customers

select FirstName,LastName,PhoneNumber
from CustomerDetails;

-- The number of Customers from Tasmania and Queensland states of Australia.
select State, count(CustomerID)
from CustomerDetails
where State = 'Tas'
or State = 'Qld'
group by State;

-- The Reservation dates range from 25th December to 1st January.
select *
from Reservations
where Date between '2022-01-01' and '2022-12-25' ;

-- The name of the Dishes in the Ascending order.
select Name
from Dishes
order by Name asc;

-- Total number of customers from Tasmania.
select  count(CustomerID)
from CustomerDetails
where State = 'Tas';

-- The price of average, cheapest and most expensive dishes.
select AVG(Price),MIN(Price),MAX(Price)
from Dishes;

-- Dishes of the customers with FirstName, LastName, DishID and DishName.

select CustomerDetails.FirstName,CustomerDetails.LastName,
CustomersDishes.CustomerID,CustomersDishes.DishID,Dishes.Name
from CustomerDetails
join CustomersDishes on CustomerDetails.CustomerID = CustomersDishes.CustomerID
join Dishes on CustomersDishes.DishID = Dishes.DishID;



-- Update a customer details as my details where CustomerID is 1 and my friends details where customerID is 3.
update CustomerDetails
set FirstName = 'Xuanfeng',
      LastName = 'Shen',
      Email = 'xshen11@utas.edu.au',
      Address = 'Tas.01 Ring Road',
      City = 'Tasmania',
      State = 'Tas',
      PhoneNumber = '13741258963',
      Birthday = '2001-11-19'
where CustomerID = 1;

update CustomerDetails
set
      FirstName = 'Feng',
      LastName = 'Li',
      Email = '618248@utas.edu.au',
      Address = 'Tas.01 Ring Road',
      City = 'Tasmania',
      State = 'Tas',
      PhoneNumber = '3741258965',
      Birthday = '2002-03-12'
where CustomerID = 3;


--
select * from customerdetails;
select * from customersdishes;
select * from dishes;
select * from events;
select * from orders;
select * from ordersdish;
select * from reservations;
