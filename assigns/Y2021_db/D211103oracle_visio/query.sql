-- (1)
--a.	Write a select query that will generate a table to display every race that was swum across the whole 6-week competition. The result needs to include the following meaningful information:
--1.	which racemeet the race was swum (i.e., which week of the competition);
--2.	the raceID/Number of the evening/racemeet the race took place;
--3.	time the race took place;
--4.	race division (age-group and sex);
--5.	race stroke/type;
--6.	winner of the race
--
--List the races in race-meet, followed by race number order.
--
select r.raceWeek as racemeet, r.raceNumber, r.raceTime, d.age||''''||d.gender as division,
e.eventType as raceStroke, s.swimmerName as winner
from Racement r join Division d
on r.divisionID=d.divisionID
join Event e on r.eventID=e.eventID
join Competition c on c.raceID=r.raceID
join Swimmer s on s.swimmerID=c.swimmerID
where c.result='1st place';

--b.	Run the same query, this time list the races by division, race-meet, race number
select r.raceWeek as racemeet, r.raceNumber, d.age||''''||d.gender as division
from Racement r join Division d
on r.divisionID=d.divisionID
join Event e on r.eventID=e.eventID
join Competition c on c.raceID=r.raceID
join Swimmer s on s.swimmerID=c.swimmerID
where c.result='1st place';

-- (2)
--During Racemeet No.2, a 13 y/o boy nominated to swim in his division's Freestyle, Butterfly and Medley races:

--a.	Write a query so he knows what time each of his races will be.
select s.swimmerName, r.raceTime
from Swimmer s join Competition c on s.swimmerID=c.swimmerID
join Racement r on c.raceID= r.raceID
join Division d on d.divisionID=r.divisionID
join Event e on e.eventID=r.eventID
where r.raceWeek='racemeet 2'
and d.age=13 and d.gender='boys'
and (e.eventType like '%Freestyle%'
or e.eventType like '%Butterfly%'
or e.eventType like '%Medley%'
);
--b.	Write a query that lists his results for the evening (list his name, the positions he came in each of his races, the times he swam and how many points he scored for each race).

select s.swimmerName,r.raceTime, c.result, c.swamTime,c.point
from Swimmer s join Competition c on s.swimmerID=c.swimmerID
join Racement r on c.raceID= r.raceID
join Division d on d.divisionID=r.divisionID
join Event e on e.eventID=r.eventID
where r.raceWeek='racemeet 2'
and d.age=13 and d.gender='boys'
and (e.eventType like '%Freestyle%'
or e.eventType like '%Butterfly%'
or e.eventType like '%Medley%'
);
--c.	Write a query to learn which 13 y/o boy performed the best (i.e., scored the most points in the Division) during raceMeet/week-2.
--List the boy's name, number of races swum (by the boy) that night, which strokes were swum and the total number of points the boys scored for the evening).

--Your SQL should be sophisticated enough that it finds out and lists this information/data as part of the same query. That is, if you changed the results within table-results tables within the database, the answer in the developed SQL (asking for the best 13 y/o boy at racemeet/week-2) would also change. Thus, do not rely on going to find the answer first and then use the numbers/answer to then list details about the specific boy.
--HINTS: This is likely a nested and/or sub-query. Use the Bordoloi & Bock textbook to help you develop the SQL to answer this query.
--HINT: (data population) - within the 13 y/o boys division there are 11 boys. A couple of boys specialise in one stroke (only swim one race per Racemeet/week). Most boys swim at least 2 races/strokes, and some swim 2 stokes plus the medley. No race each Reacemeet/week has less than 5 swimmers. No race has more than 8 swimmers (there are only 8 lanes in any race).
select swimmerName, number_races, scored_points
from
(
select s.swimmerName,count(r.raceID) as number_races, sum(c.point) as scored_points
from Swimmer s join Competition c on s.swimmerID=c.swimmerID
join Racement r on c.raceID= r.raceID
join Division d on d.divisionID=r.divisionID
join Event e on e.eventID=r.eventID
where r.raceWeek='racemeet 2'
and d.age=13 and d.gender='boys'
group by s.swimmerName
order by scored_points desc
) t where rownum =1;

--(3) Division winners across the whole competition.
--Write a query that will provide the winners of each division across the whole 6 week competition.
--
--There are eight (8) divisions, who won each division?  The 8 results should include
--•	The swimmer's (who won) details
--•	The Division they won
--•	The total number of points scored for the competition
--•	The number of races the swimmer swam over the competition
select t.divisionID, ss.swimmerID, ss.swimmerName, t.scored_points, race_number
from
(
select d.divisionID, c.swimmerID, sum(c.point) as scored_points, count(c.raceID) as race_number,
rank() over(partition by d.divisionID order by sum(c.point) desc) as division_rank
from Division d join Racement r on d.divisionID=r.divisionID
join Competition c on c.raceID=r.raceID
group by d.divisionID, c.swimmerID
) t join Swimmer ss on t.swimmerID=ss.swimmerID
where t.division_rank=1;



--(4) Season's BEST PERFORMANCES (best times for events/strokes)
--Write a query that will provide the following - Across the course of the season/competition
--HINT: (data population). Times for swims need to be realistic. It will be worth using google to find some typical swim times for each of the four (4) strokes and the medley across Australia/World - and make your times a little slower - - this is only a local competition for 12 to 16 year old's, not the world championships etc.
--a.	Season's best Freestyle result.
--include:
--•	who swam the fastest freestyle race of the whole season
--•	which racemeet/week it occurred at
--•	what division the swimmer is from
--•	what the time was
--HINT: These bullet points are in the same query, and thus the same resulting table of information from the query.

select s.swimmerName, d.divisionID, r.raceWeek, c.swamTime
from Racement r join Division d on r.divisionID=d.divisionID
join Competition c on r.raceID=c.raceID
join Event e on e.eventID=r.eventID
join Swimmer s on s.swimmerID=c.swimmerID
where e.eventType like '%Freestyle%'
and c.swamTime=
(
select min(swamTime)
from Competition cc join Racement rr on cc.raceID=rr.raceID
join Event ee on ee.eventID=rr.eventID
where ee.eventType like '%Freestyle%'
);


--b.	Season's best Breaststroke result.
--include:
--•	who swam the fastest breaststroke race of the whole season
--•	which racemeet /week it occurred at
--•	what division the swimmer is from
--•	what the time was

select s.swimmerName, d.divisionID, r.raceWeek, c.swamTime
from Racement r join Division d on r.divisionID=d.divisionID
join Competition c on r.raceID=c.raceID
join Event e on e.eventID=r.eventID
join Swimmer s on s.swimmerID=c.swimmerID
where e.eventType like '%Breaststroke%'
and c.swamTime=
(
select min(swamTime)
from Competition cc join Racement rr on cc.raceID=rr.raceID
join Event ee on ee.eventID=rr.eventID
where ee.eventType like '%Breaststroke%'
);

--c.	Season's best Butterfly result:
--include:
--•	who swam the fastest butterfly race of the whole season
--•	which racemeet /week it occurred at
--•	what division the swimmer is from
--•	what the time was

select s.swimmerName, d.divisionID, r.raceWeek, c.swamTime
from Racement r join Division d on r.divisionID=d.divisionID
join Competition c on r.raceID=c.raceID
join Event e on e.eventID=r.eventID
join Swimmer s on s.swimmerID=c.swimmerID
where e.eventType like '%Butterfly%'
and c.swamTime=
(
select min(swamTime)
from Competition cc join Racement rr on cc.raceID=rr.raceID
join Event ee on ee.eventID=rr.eventID
where ee.eventType like '%Butterfly%'
);

--d.	Season's best Backstroke result:
--include:
--•	who swam the fastest backstroke race of the whole season
--•	which racemeet /week it occurred at
--•	what division the swimmer is from
--•	what the time was
select s.swimmerName, d.divisionID, r.raceWeek, c.swamTime
from Racement r join Division d on r.divisionID=d.divisionID
join Competition c on r.raceID=c.raceID
join Event e on e.eventID=r.eventID
join Swimmer s on s.swimmerID=c.swimmerID
where e.eventType like '%Backstroke%'
and c.swamTime=
(
select min(swamTime)
from Competition cc join Racement rr on cc.raceID=rr.raceID
join Event ee on ee.eventID=rr.eventID
where ee.eventType like '%Backstroke%'
);


--e.	Season's best Medley result
--include:
--•	who swam the fastest butterfly race of the whole season
--•	which racemeet /week it occurred at
--•	what division the swimmer is from
--•	what the time was
select s.swimmerName, d.divisionID, r.raceWeek, c.swamTime
from Racement r join Division d on r.divisionID=d.divisionID
join Competition c on r.raceID=c.raceID
join Event e on e.eventID=r.eventID
join Swimmer s on s.swimmerID=c.swimmerID
where e.eventType like '%Medley%'
and c.swamTime=
(
select min(swamTime)
from Competition cc join Racement rr on cc.raceID=rr.raceID
join Event ee on ee.eventID=rr.eventID
where ee.eventType like '%Medley%'
);