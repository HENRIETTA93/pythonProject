-- Task1.1
ALTER TABLE actor ADD CONSTRAINT PK_ACTORID PRIMARY KEY (actor_id);




-- Task1.2


ALTER TABLE actor ADD CONSTRAINT PK_ACTORID PRIMARY KEY (actor_id);
ALTER TABLE film ADD CONSTRAINT PK_FILMID PRIMARY KEY (film_id);
ALTER TABLE film_actor ADD CONSTRAINT FK_FILMID1 FOREIGN KEY (film_id) REFERENCES film;

ALTER TABLE category ADD CONSTRAINT PK_CATEGORYID PRIMARY KEY (category_id );

ALTER TABLE language ADD CONSTRAINT PK_LANGUAGEID PRIMARY KEY (language_id );

ALTER TABLE film ADD CONSTRAINT UN_DESCRIPTION  UNIQUE(description);

ALTER TABLE actor ADD CONSTRAINT CK_FNAME CHECK (first_name IS NOT NULL);

ALTER TABLE actor ADD CONSTRAINT CK_LNAME CHECK (last_name IS NOT NULL);

ALTER TABLE category ADD CONSTRAINT CK_CATNAME CHECK (name IS NOT NULL);

ALTER TABLE language ADD CONSTRAINT CK_LANNAME CHECK (name IS NOT NULL);

ALTER TABLE film ADD CONSTRAINT CK_TITLE CHECK (title IS NOT NULL);

ALTER TABLE film ADD CONSTRAINT CK_RELEASEYR CHECK (release_year<=2020);

ALTER TABLE film ADD CONSTRAINT CK_RATING CHECK (rating IN('G', 'PG', 'PG-13', 'R', 'NC-17'));

ALTER TABLE film ADD CONSTRAINT CK_SPLFEATURES CHECK (special_features IN(null, 'Trailers',
'Commentaries', 'Deleted
Scenes', 'Behind the Scenes'));

ALTER TABLE film ADD CONSTRAINT FK_LANGUAGEID FOREIGN KEY (language_id) REFERENCES language(language_id);
ALTER TABLE film ADD CONSTRAINT FK_ORLANGUAGEID FOREIGN KEY (original_language_id ) REFERENCES language(language_id);

ALTER TABLE film_actor ADD CONSTRAINT FK_ACTORID FOREIGN KEY (actor_id ) REFERENCES actor(actor_id);

ALTER TABLE film_category ADD CONSTRAINT FK_CATEGORYID FOREIGN KEY (category_id ) REFERENCES category(category_id);

ALTER TABLE film_category ADD CONSTRAINT FK_FILMID2 FOREIGN KEY (film_id ) REFERENCES film(film_id);


-- Task2

 -- 1
create sequence FILM_ID_SEQ
start with 20010
increment by 10;

-- 2
create trigger BI_FILM_ID
before insert on film for each row
begin
select FILM_ID_SEQ.nextval into :new.film_id from dual;
end;


-- 3
-- drop trigger BI_FILM_DESP;

create trigger BI_FILM_DESP
before insert on film for each row
begin
select :new.rating||'-'||(select count(*)+1 from film where rating=:new.rating)||': '||'Originally in '|| (select name
from language where language_id=:new.original_language_id)
||'.'||'Re-released in '||(select name
from language where language_id=:New.language_id) ||'.'
into :new.description from dual;
end;

/*
test:
INSERT INTO film (title, description, language_id, original_language_id, rating)
VALUES ('B Movie', 'Movie about wasps.', 1, 2, 'PG');
 SELECT description FROM film WHERE film_id = 20010;
*/


-- Task3

-- 1

select f.title, f.length
from film f
join
(
select min(length) as length from film f join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action'
) t on f.length=t.length;

-- 2
create or replace view MIN_ACTION_ACTORS
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join (
    select f.title, f.length
from film f
join
(
select min(length) as length from film f join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action'
) t on f.length=t.length
) v1 on v1.title=f.title;

SELECT * FROM MIN_ACTION_ACTORS;

-- 3
create view V_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id=f.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

SELECT * FROM V_ACTION_ACTORS_2012;

-- 4
create materialized view MV_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id=f.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

SELECT * FROM MV_ACTION_ACTORS_2012;


-- task4
-- 1
select *
from film
where instr(description,'Boat')>0 and rownum<=100
order by title;


-- 2
create index IDX_BOAT on  film (instr(description,'Boat'));



-- 3
-- ans in report

-- 4
select count(f1.film_id)
from film f1
where exists (select count(film_id) from film f2 where f1.release_year=f2.release_year
 and f1.rating=f2.rating and f1.special_features=f2.special_features
 and f1.film_id!=f2.film_id
 having count(film_id)>=40
 );


-- task 5

-- 1
 select
index_name, blevel, leaf_blocks, num_rows, distinct_keys, clustering_factor
from user_ind_statistics
where table_name=UPPER('film');