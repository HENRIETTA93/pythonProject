-- Q1
-- What beers are made by Toohey's?

select name 
    from beers 
    where manf = 'Toohey''s';

-- Q2
-- Show beers with headings "Beer", "Brewer".

select name as "Beer", manf as "Brewer" 
    from beers;

-- Q3
-- Find the brewers whose beers John likes.

select distinct Beers.manf as brewer
    from   Likes 
        join Beers on (Likes.beer = Beers.name)
    where  Likes.drinker = 'John';

-- alternatively

select distinct Beers.manf as brewer
    from   Beers, Likes
    where  Likes.drinker='John' and Likes.beer=Beers.name;

-- Q4
-- Find pairs of beers by the same manufacturer.

select b1.name, b2.name
    from Beers b1 
        join Beers b2 on (b1.manf = b2.manf)
    where b1.name < b2.name;

-- alternatively

select b1.name, b2.name
    from   Beers b1, Beers b2
    where  b1.manf=b2.manf 
        and b1.name < b2.name;

-- Q5
-- Find beers that are the only one by their brewer

-- using a non-correlated subquery
-- strategy:
-- * nested query finds brewers who make only one beer
-- * outer query selects beers made by those brewers

select name
from   Beers
where  manf in (select manf
			    from   beers
			    group by manf
			    having count(name) = 1)

-- or, using a correlated subquery
-- strategy:
-- * for each Beer b
-- * check for other beers made by b's brewer
-- * if none, then choose Beer b as a result

select b.name
from   Beers b
where  not exists (select *
                   from   Beers b1
                   where  b1.manf = b.manf and b1.name <> b.name);

-- Q6
-- Find the beers sold at bars where John drinks

select distinct beer
from   Frequents f
         join Bars b on (f.bar = b.name)
         join Sells s on (b.name = s.bar)
where  f.drinker = 'John';

-- Q7 
-- How many different beers are there?

select count(name) from beers;

-- Q8 
-- How many different brewers are there?

select count(distinct manf) from Beers;

-- Q9 
-- How many beers does each brewer make?

select manf,count(name)
from beers
group by manf;

-- we've already seen the basic query for this

select manf,count(name)
from   Beers
group by manf;

-- since it seems useful, let's turn it into a view

create view BrewersBeers(brewer,nbeers) as
select manf,count(name)
from   Beers
group by manf;

--  so we can do now: 

select * from BrewersBeers;

-- Q10 
-- Which brewer makes the most beers?

select brewer
from   BrewersBeers 
where  nbeers = (select max(nbeers) from BrewersBeers);


-- Q11 
-- Bars where either Gernot or John drink

select bar from frequents where drinker='Gernot' or drinker='John';

-- or

select bar from frequents where drinker in ('Gernot','John');


-- Q12 
-- Bars where both John and Gernot drink

-- same approach as above doesn't work ...
-- in a given tuple, the drinker cannot have two values

-- WRONG:
select bar from frequents where drinker='Gernot' and drinker='John';

-- Use the set operator instead:

(select bar from frequents where drinker='Gernot')
intersect
(select bar from frequents where drinker='John');

-- Q11 reprised ... the set approach also works for OR

-- Soln: (set of Gernot's bars) union (set of John's bars)

(select bar from frequents where drinker='Gernot')
union
(select bar from frequents where drinker='John');

-- set operations remove duplicates
-- if we really want them, use "union all"

(select bar from frequents where drinker='Gernot')
union all
(select bar from frequents where drinker='John');


-- Q13
-- Find bars that serve New at the same price as the Coogee Bay Hotel charges for VB.

-- find VB's price at Coogee Bay Hotel

select price from sells
where beer = 'Victoria Bitter' and bar = 'Coogee Bay Hotel';

select bar from sells
where beer = 'New' and price = (select price from sells
where beer = 'Victoria Bitter' and bar = 'Coogee Bay Hotel');


-- Q14
-- Find the average price of common beers (i.e. served in more than two hotels).

select beer, count(bar), avg(price)
from sells
group by beer
having count(bar) > 2
order by beer;


-- Q15 
-- Which bar sells 'New' cheapest?


select bar from sells where beer = 'New' 
and price in (select min(price) from sells where beer = 'New');


-- Q16
-- Which bar is most popular? (Most drinkers)

create or replace v(bar, ndrink) as
select bar, count(drinker) from frequents group by bar;

select bar from v where ndrink = (select max(ndrink) from v);


-- Q17
-- Which bar is most expensive? (Highest average price) 

create or replace v2(bar, avgprice) as
select bar, avg(price) from sells group by bar;

select bar from v2 where avgprice >= (select max(avgprice) from v2); 


-- Q18 
-- Which beers are sold at all bars?

-- Basic approach:
-- for each beer b {
--     BB = set of bars where b is sold
--     AB = set of all bars
--     if (AB == BB) then b is sold at all bars
-- }

select name
from   Beers b
where  not exists (                              -- isEmpty
	(select name from Bars)                      -- AB
	except                                       -- set diff
	(select bar from Sells where beer = b.name)  -- BB
	);

-- alternative approach
-- for each beer b {
--     NA = number of bars
--     NB = number of bars where b sold
--     if (NA == NB) then b is sold at all bars
-- }

-- Q19
-- Price of cheapest beer at each bar?

select bar, min(price) from sells group by bar;


-- Q20
-- Name of cheapest beer at each bar?

select sells.bar, sells.beer 
from sells 
   join 
      (select bar, min(price) as minprice
       from sells
       group by bar) as X 
   on sells.bar = X.bar and sells.price = X.minprice;


-- Q21
-- How many drinkers are in each suburb?


select addr, count(*)
from drinkers
group by addr;

-- Q22 
-- How many bars in suburbs where dinkers live?
--     (must include all such suburbs, even if no bars)

-- A straight join doesn't work, because omits suburbs with no bar

select d.addr, count(b.name)
from   Drinkers d left outer join Bars b on (d.addr = b.addr)
group  by d.addr;
