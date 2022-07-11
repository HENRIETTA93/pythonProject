SELECT productname, reorderlevel
from Product
where unitprice <30 or unitsinstock<20;


SELECT companyname, contactname,contacttitle
from Customer
where Region='North America'
UNION
SELECT companyname, contactname,contacttitle
from Customer
where contacttitle='Owner' and city='Paris';



SELECT * from Product order by unitsonorder;


select Product.*
from Product
join Category on Product.categoryid=Category.Id
where Category.CategoryName='Seafood';




SELECT lastname, title
from Employee
where birthdate>='1990-01-01';
