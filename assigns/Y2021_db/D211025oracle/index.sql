-- 1
select *
from film
where instr(description,'Boat')>0
order by title;


-- 2
create index IDX_BOAT on  film (instr(description,'Boat'));



-- 3


-- 4
select count(f1.film_id)
from film f1
where exists (select count(film_id) from film f2 where f1.release_year=f2.release_year
 and f1.rating=f2.rating and f1.special_features=f2.special_features
 and f1.film_id!=f2.film_id
 having count(film_id)>=40
 )
