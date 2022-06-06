drop table if exists Retail_Product;

drop table if exists Foodservice_Product;
drop table if exists Retail_Stockist;
drop table if exists Distributors;
drop table if exists Retail_Category;

drop table if exists Foodservice_Category;
drop table if exists Supplier;
drop table if exists State;


drop table if exists Retail_Category;
create table Retail_Category(
Category_Name varchar(30) primary key
);
insert into Retail_Category values ('Chocolate Bars'),('Chocolate Boxed'),('Condiments'),('Confectionery'), ('Gourmet Foods'),('No Sugar Added'), ('Pick and Mix');

drop table if exists Supplier;
create table Supplier(
Supplier_Name varchar(30) primary key
);
insert into Supplier
select distinct [Supplier Name]
from [Chocolate Bars]
union
select distinct [Supplier Name]
from [Chocolate Boxed]
union
select distinct [Supplier Name]
from Condiments
union
select distinct [Supplier Name]
from Confectionery
union
select distinct [Supplier Name]
from [Gourmet Foods]
union
select distinct [Supplier Name]
from [No Sugar Added]
union
select distinct [Supplier Name]
from [Pick and Mix]
union
select distinct [Supplier Name]
from Decorations
union
select distinct [Supplier Name]
from Equipment
union
select distinct [Supplier Name]
from Frozen
union
select distinct [Supplier Name]
from [Food Service]
union
select distinct [Supplier Name]
from [Imported Loose Chocolates]
union
select distinct [Supplier Name]
from Packaging
union
select distinct [Supplier Name]
from Patisserie;


drop table if exists Retail_Product;
create table Retail_Product(
Product_ID	varchar(20) primary key,
Product_Desc text,
Discontinued char(3),
Supplier_Name varchar(30),
Unit_Price float,
Website text,
Category_Name varchar(30),
foreign key (Supplier_Name) references Supplier(Supplier_Name),
foreign key (Category_Name) references  Retail_Category(Category_Name)
);


insert into Retail_Product
select distinct  [Product ID], [Product Descriptions], Discontinued, [Supplier Name], [Unit Price], Website, 'Chocolate Bars' as Category_Name
from [Chocolate Bars]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [Chocolate Bars] group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Descriptions], Discontinued, [Supplier Name], [Unit Price],   Website, 'Chocolate Boxed' as Category_Name
from [Chocolate Boxed]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [Chocolate Boxed] group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Descriptions], Discontinued, [Supplier Name], [Unit Price],  Website,  'Condiments' as Category_Name
from Condiments
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Condiments group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Descriptions], Discontinued, [Supplier Name], [Unit Price],  Website, 'Confectionery' as Category_Name
from Confectionery
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Confectionery group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price],  Website, 'No Sugar Added' as Category_Name
from [No Sugar Added]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [No Sugar Added] group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Descriptions], Discontinued, [Supplier Name], [Unit Price],  Website, 'Pick and Mix' as Category_Name
from [Pick and Mix]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [Pick and Mix] group by [Product ID] having count([Product ID])>1);


drop table if exists State;
create table State(
State char(4) primary key,
State_Name char(50)
);

insert into State values ('NSW','New South Wales'),('QLD','Queensland'),('NT','Northern Territory'),('VIC','Victoria'),('ACT','the Australian Capital Territory');

drop table if exists Retail_Stockist;
create table Retail_Stockist(
Retail_ID int primary key IDENTITY(1,1),
Retail_Stockist varchar(50) ,
Address varchar(255),
Phone varchar(30),
Website varchar(255),
State char(4)
);

insert into Retail_Stockist
select distinct [Retail Stockist], Address, Phone, Website, 'NSW' as State
from [NSW Retail stockists]
where [Retail Stockist] is not null
union
select distinct [Retail Stockist], Address,Phone, Website,'QLD' as State
from [QLD Stockists]
where [Retail Stockist] is not null
union
select distinct [Retail Stockist], Address,Phone, Website,'VIC' as State
from [VIC Retail Stockists]
where [Retail Stockist] is not null
union
select distinct [Retail Stockist],Address, Phone, Website,'ACT' as State
from [ACT Retail Stockists]
where [Retail Stockist] is not null
union
select distinct [Retail Stockist],Address, Phone, Website,'ACT' as State
from [NT Retail Stockists]
where [Retail Stockist] is not null;

drop table if exists Foodservice_Category;
create table Foodservice_Category(
Category_Name varchar(30) primary key,
Service_Type varchar(30)
);
insert into Foodservice_Category
select distinct 'Decorations' as Category_Name, 'Decorations' as Service_Type
from Decorations
union
select distinct Category  as Category_Name, 'Equipment' as Service_Type
from Equipment
union
select distinct Category  as Category_Name, 'Frozen' as Service_Type
from Frozen
union
select distinct Category  as Category_Name, 'Food Service' as Service_Type
from [Food Service]
union
select distinct Category  as Category_Name, 'Imported Loose Chocolates' as Service_Type
from [Imported Loose Chocolates]
union
select distinct Category  as Category_Name, 'Packaging' as Service_Type
from Packaging
union
select distinct Category  as Category_Name, 'Patisserie' as Service_Type
from Patisserie;


drop table if exists Foodservice_Product;
create table Foodservice_Product(
Product_ID	varchar(50) primary key,
Product_Desc text,
Discontinued char(3),
Supplier_Name varchar(30),
Unit_Price float,
Website text,
Category_Name varchar(30),
foreign key (Supplier_Name) references Supplier(Supplier_Name),
foreign key (Category_Name) references  Foodservice_Category(Category_Name)
);

insert into Foodservice_Product
select distinct  [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price], Website, 'Decorations' as Category_Name
from Decorations
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Decorations group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price],   Website, Category as Category_Name
from Equipment
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Equipment group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Price],  Website,  Category as Category_Name
from Frozen
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Frozen group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price],  Website, Category as Category_Name
from [Food Service]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [Food Service] group by [Product ID] having count([Product ID])>1)
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price],  Website, Category as Category_Name
from [Imported Loose Chocolates]
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from [Imported Loose Chocolates] group by [Product ID] having count([Product ID])>1)
union
select [Product Description], [Product Description], Discontinued, [Supplier Name], [Unit Price],  Website, Category as Category_Name
from Packaging
union
select [Product ID], [Product Description], Discontinued, [Supplier Name], [Unit Price],  Website, Category as Category_Name
from Patisserie
where [Product ID] is not null
and [Product ID] not in (select [Product ID] from Patisserie group by [Product ID] having count([Product ID])>1);


drop table if exists Distributors;
create table Distributors(
Distributor_Name varchar(50) primary key,
Description varchar(255),
Address varchar(255),
Fax varchar(20),
Phone varchar(20),
Email varchar(50),
Website varchar(50),
);

insert into Distributors
select distinct *
from [Foodservice Distributors]
where [Foodservice Distributor] is not null;