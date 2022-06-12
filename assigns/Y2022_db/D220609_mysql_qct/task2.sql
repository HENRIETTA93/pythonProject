-- Q1
-- Write a query to list the treasureID, description, points and types of treasures that contain either ‘brick’ or ‘map’ in their description.

select treasureID,description, points, type
from treasure
where description like '%brick%' or description like '%map%';


-- Query 2 (1.5 marks)
-- Write a query to list the total number of treasures available for each treasure type. Your output should
-- contain the type and the total of each type in ascending order of the number of types


select type, count(treasureID) as number_of_treasures
from treasure
group by type
order by count(treasureID);

-- Query 3 (1.5 marks)
-- Write a query that displays the name, badgeID, and the cost of the most expensive badge.

select b.badgeName, b.badgeID, p.cost
from purchase p
join badge b on p.badgeID=b.badgeID
where p.cost=(select max(cost)
from purchase);


-- Query 4 (3.5 marks)
-- Write a query that lists all badge sales. Your output should show the name of the badge together with first
-- name, last name, and email address of the player(s) that made the purchase. Sort the list based on the badge
-- name followed by first name then last name in ascending order.


select b.badgeName, pl.firstName, pl.lastName, pl.email
from player pl
join purchase p on pl.username=p.username
join badge b on p.badgeID=b.badgeID
order by pl.firstName asc, pl.lastName asc;



-- Query 5 (3.5 marks)
-- Write a query that provides the players’ name (first and last), username, and how many advanced quests
-- they have completed. If a player did not complete any advanced quests, do not include them in your output.


select concat(pl.firstName, ' ',pl.lastName) as playerName, pl.username, count(distinct q.advanceQuestID) as advanceQuestNum
from player pl
join playerprogress pp on pl.username=pp.username
join quest q on q.advanceQuestID=pp.questID
where pp.progress='complete'
group by concat(pl.firstName, ' ',pl.lastName),pl.username;





-- Query 6 (4 marks)
-- Write a query to produce a report for each store, including stores without any sales.
-- Your result-set should include the following information:
-- • the storeID
-- • the store name
-- • the number of unique players that have purchased a badge from the store
-- • the number of unique players that have not purchased a badge from the store
-- • the total money spent at the store
-- • the most expensive badge a player has purchased at the store
-- • the cheapest badge a player has purchased at the store
-- • the average price of the items that have been purchased at the store.
--

with t1
as
(
select s.storeID, s.storeName, count(distinct p.username) as purchase_num_players, (select count(distinct username) from player)-count(distinct p.username) as non_purchase_num, sum(p.cost) as total_spent, avg(p.cost) as avg_price
from store s
left join purchase p on s.storeID=p.storeID
left join player pl on pl.username=p.username
group by  s.storeID, s.storeName
),
t2 as
(
select t1.storeID, b.badgeName as expensive_badge
from purchase p join badge b on b.badgeID=p.badgeID
join
(
select storeID, max(p.cost) max_cost
from purchase p
join badge b on p.badgeID=b.badgeID
group by storeID
) t1 on p.storeID=t1.storeID and p.cost=t1.max_cost
),
t3 as
(
select distinct t2.storeID, b.badgeName as cheapest_badge
from purchase p join badge b on b.badgeID=p.badgeID
join
(
select storeID, min(p.cost) min_cost
from purchase p
join badge b on p.badgeID=b.badgeID
group by storeID
) t2 on p.storeID=t2.storeID and p.cost=t2.min_cost
)
select t1.*, t2.expensive_badge, t3.cheapest_badge
from t1 join t2 on t1.storeID=t2.storeID
join t3 on t1.storeID=t3.storeID;






