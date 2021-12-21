create table popular_breeds_2(
year int,
name varchar(50),
breed_rank int,
primary key (year,name)
);

insert into popular_breeds_2
select '2019' as year, name, rank_2019 as breed_rank
from popular_breeds
union all
select '2018' as year, name, rank_2018 as breed_rank
from popular_breeds
union all
select '2017' as year, name, rank_2017 as breed_rank
from popular_breeds
union all
select '2016' as year, name, rank_2016 as breed_rank
from popular_breeds
union all
select '2015' as year, name, rank_2015 as breed_rank
from popular_breeds
union all
select '2014' as year, name, rank_2014 as breed_rank
from popular_breeds
union all
select '2013' as year, name, rank_2013 as breed_rank
from popular_breeds;






select *
from westminster_best;

select * from akc_breeds;


select westminster_best.*
from westminster_best join akc_breeds on westminster_best.breed=akc_breeds.breed
where height_low_inches<=20 and height_high_inches>=20 and weight_low_lbs<=30 and weight_high_lbs>=30;



create table westminster_best_breed_groups
as
select breed_group, count(breed) as number_of_wins
from westminster_best
group by breed_group;

select b.breed, count(b.winner) as counts_of_wins
from westminster_best_breed_groups a join westminster_best b on a.breed_group=b.breed_group
where number_of_wins=(
select max(number_of_wins)
from westminster_best_breed_groups
)
group by b.breed;


select *
from westminster_best
where breed like 'Poodle%'
and (year(show_date)<1940 or year(show_date)>1999);



select distinct breed_group from westminster_best;
