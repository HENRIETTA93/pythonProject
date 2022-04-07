CREATE TABLE Company (
   id      INTEGER PRIMARY KEY,
   name    VARCHAR(60),
   url     VARCHAR(200),
   government_agency  CHAR(1) CHECK (government_agency IN ('Y', 'N')) NULL,
   country CHAR(3)  -- country code
);

CREATE TABLE Infrastructure (
   entryno INTEGER PRIMARY KEY,
   name    VARCHAR(50),
   state   VARCHAR(3) CHECK (state IN ('ACT','NSW','QLD','SA','TAS','WA','NT','VIC')),
   status  VARCHAR(20)
);

CREATE TABLE Port (
   entryno     INTEGER PRIMARY KEY REFERENCES Infrastructure(entryno),
   maxShips    INTEGER,
   description VARCHAR(200)
);

CREATE TABLE ProcessingPlant (
   entryno     INTEGER PRIMARY KEY REFERENCES Infrastructure(entryno),
   kind        VARCHAR(50),
   description VARCHAR(200)
);

CREATE TABLE Mine (
   entryno     INTEGER PRIMARY KEY REFERENCES Infrastructure(entryno),
   significant CHAR(1) CHECK (significant IN ('Y','N')) NULL
);

CREATE TABLE Commodity (
   comId VARCHAR(5)  PRIMARY KEY,
   name  VARCHAR(50)
);

CREATE TABLE Operates (
   owner INTEGER REFERENCES Company(id),
   place INTEGER REFERENCES Infrastructure(entryno),
   PRIMARY KEY(owner, place)
);

CREATE TABLE Produces (
   mine      INTEGER    REFERENCES Mine(entryno),
   commodity VARCHAR(5) REFERENCES Commodity(comId),
   capacity  INTEGER,
   cap_unit  VARCHAR(30) CHECK (cap_unit IN ('tpa','ktpa','Mtpa','Gtpa','oz per annum')),
   PRIMARY KEY(mine, commodity)
);

CREATE TABLE Processes (
   plant     INTEGER    REFERENCES ProcessingPlant(entryno),
   commodity VARCHAR(5) REFERENCES Commodity(comId),
   capacity  INTEGER,
   cap_unit  VARCHAR(30),
   PRIMARY KEY(plant, commodity)
);

CREATE TABLE Shareholdings (
   parent     INTEGER REFERENCES Company(id),
   subsidiary INTEGER REFERENCES Company(id),
   shareVal   REAL,
   PRIMARY KEY (parent, subsidiary)
);



-- write an sql query that lists the distinct kind of processing plants with a known description

select distinct kind
from ProcessingPlant
join Infrastructure on ProcessingPlant.entryno=Infrastructure.entryno
where description is not null and state='VIC'
order by kind;

-- 2 Write an SQL query that lists all mined commodities by both short..
select comID, name, count(mine) as count
from Commodity
join Produces on Commodity.comID=Produces.commodity
group by comID, name
order by count desc, name;


-- 3 Write an SQL query that lists the states...
select state, sum(capacity)
from Infrastructure
join ProcessingPlant on ProcessingPlant.entryno=Infrastructure.entryno
join Processes on Processes.plant=ProcessingPlant.entryno
where Infrastructure.name='Oil Refinery'
group by state
having count(Infrastructure.entryno)>=2
order by state;


-- 4 Write an SQL query that lists the processing plants ..

select Infrastructure.name
from ProcessingPlant
join Infrastructure on ProcessingPlant.entryno=Infrastructure.entryno
join Operates on Operates.place=Infrastructure.entryno
group by Infrastructure.name
having count(Operates.owner)>=3
order by Infrastructure.name;


-- 5 Write an SQL query that lists each country and per each country how many...
select country, count(id) as count
from Company
group by country
order by count desc, country;