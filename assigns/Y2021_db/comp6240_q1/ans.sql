#1
select count(*) from MOVIE where country='New Zealand' and major_genre='drama';

#2
select m.title, m.production_year from MOVIE m join RESTRICTION r
on m.title=r.title and m.production_year=r.production_year
where r.country='Sweden' and r.description='Btl'
order by m.production_year desc;

#3
select country, count(description)
from RESTRICTION_CATEGORY
group by country
having count(description)>=3;

#4
select m.title, m.production_year
from MOVIE m join DIRECTOR_AWARD ma on m.title=ma.title and m.production_year=ma.production_year
union
select m.title, m.production_year
from MOVIE m join WRITER_AWARD ma on m.title=ma.title and m.production_year=ma.production_year;

#5
select m.title, m.production_year, m.production_year-p.year_born as age
from MOVIE m join DIRECTOR d on m.title=d.title and m.production_year=d.production_year
join PERSON p on d.id=p.id
where m.country='Germany';

#6
select number_crews
from
(
select c.title, c.production_year, count(c.id) as number_crews
from CREW c
group by c.title, c.production_year
order by count(c.id) desc
) t;


#7
select p.id,p.first_name, p.last_name
from
(
select d.id, count(distinct w.id)
from DIRECTOR d join MOVIE m on d.title=m.title and d.production_year=m.production_year
join WRITER w on w.title=m.title and w.production_year=m.production_year
group by d.id
having count(distinct w.id)>=2
) t join PERSON p on t.id=p.id
order by p.last_name;

#8
select count(*)
from
(
select w.title, w.production_year, count(w.id)
from WRITER w
group by w.title, w.production_year
having count(w.id)=1
) t;


#9
select t.id
(
select distinct d.id
from DIRECTOR d
left join DIRECTOR_AWARD da
on d.title = da.title and d.production_year = da.production_year
where da.award_name is null
) t join DIRECTOR d1 on t.id=d1.id
group by t.id
order by count(d1.title) desc limit 1;

#10
select t1.id, p.first_name, p.last_name
from
(
select d.id, count(d.title) as m_num
from DIRECTOR d join ROLE r
on d.title=r.title and d.production_year=r.production_year
group by d.id
) t1
join
(
select d.id, count(d.title) as m_num
from DIRECTOR d
group by d.id
) t2 on t1.m_num=t2.m_num
join
PERSON p on t1.id=p.id;
