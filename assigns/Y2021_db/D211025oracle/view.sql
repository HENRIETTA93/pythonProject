-- 1
create table MIN_ACTIONS_FILM
as
select f.title, f.length
from film f
join
(
select min(length) as length from film f join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action'
) t on f.length=t.length;
commit;
-- 2
create view MIN_ACTION_ACTORS
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join MIN_ACTIONS_FILM v1 on v1.title=f.title;

-- 3
create view V_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id=f.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

-- 4
create materialized view MV_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id=f.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

-- 5