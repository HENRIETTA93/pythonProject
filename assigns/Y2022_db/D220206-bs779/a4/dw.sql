create table dw.genre_dim
as
select * from genre;

create table dw.role_dim
as
select * from role;

create table dw.rating_dim
as
select * from rating;


create table dw.date_dim
as
select distinct
concat(extract(year from r.rentalrequestdate),'-', extract(month from r.rentalrequestdate)) as dateid,
extract(year from r.rentalrequestdate) as year,
extract(month from r.rentalrequestdate) as month
from rental r
union
select
distinct
concat(extract(year from p.amountpaiddate),'-', extract(month from p.amountpaiddate)) as dateid,
extract(year from p.amountpaiddate) as year,
extract(month from p.amountpaiddate) as month
from payment p
union
select
distinct
concat(extract(year from p.amountpaiduntildate),'-', extract(month from p.amountpaiduntildate)) as dateid,
extract(year from p.amountpaiduntildate) as year,
extract(month from p.amountpaiduntildate) as month
from payment p;


create table dw.membership_dim
as
select *
from membership;

create table dw.address_dim
as
select z.zipcodeid, z.zipcode, c.cityname, s.statename
from zipcode z
join state s on z.stateid=s.stateid
join city c on c.cityid=z.cityid;


create table dw.rental_fact
as
select rr.ratingid, g.genreid, ro.roleid, z.zipcodeid, ms.membershipid,
concat(extract(year from r.rentalrequestdate),'-', extract(month from r.rentalrequestdate)) as dateid,
count(r.rentalid) as rental_count
from rental r
join dvd d on d.dvdid=r.dvdid
join rating rr on rr.ratingid=d.ratingid
join genre g on g.genreid=d.genreid
join moviepersonrole mr on mr.dvdid=d.dvdid
join role ro on ro.roleid=mr.roleid
join member m on m.memberid=r.memberid
join zipcode z on z.zipcodeid=m.memberaddressid
join membership ms on ms.membershipid=m.membershipid
group by rr.ratingid, g.genreid, ro.roleid, z.zipcodeid, ms.membershipid,
concat(extract(year from r.rentalrequestdate),'-', extract(month from r.rentalrequestdate));


create table dw.memberpay_fact
as
select z.zipcodeid, ms.membershipid,
concat(extract(year from p.amountpaiddate),'-', extract(month from p.amountpaiddate)) as dateid ,
sum(p.amountpaid) as total_pay_amount
from payment p
join member m on m.memberid=p.memberid
join zipcode z on z.zipcodeid=m.memberaddressid
join membership ms on ms.membershipid=m.membershipid
group by z.zipcodeid, ms.membershipid,
concat(extract(year from p.amountpaiddate),'-', extract(month from p.amountpaiddate));


alter table dw.address_dim add primary key (zipcodeid);
alter table dw.date_dim add primary key (dateid);
alter table dw.genre_dim add PRIMARY key (genreid);
alter table dw.membership_dim add primary key (membershipid);
alter table dw.rating_dim add primary key (ratingid);
alter table dw.role_dim add primary key (roleid);

alter table dw.memberpay_fact add foreign key (zipcodeid) references dw.address_dim(zipcodeid);
alter table dw.memberpay_fact add foreign key (dateid) references dw.date_dim(dateid);
alter table dw.memberpay_fact add foreign key (membershipid) references dw.membership_dim(membershipid);

alter table dw.rental_fact add foreign key (zipcodeid) references dw.address_dim(zipcodeid);
alter table dw.rental_fact add foreign key (dateid) references dw.date_dim(dateid);
alter table dw.rental_fact add foreign key (membershipid) references dw.membership_dim(membershipid);
alter table dw.rental_fact add foreign key (genreid) references dw.genre_dim(genreid);
alter table dw.rental_fact add foreign key (ratingid) references dw.rating_dim(ratingid);
alter table dw.rental_fact add foreign key (roleid) references dw.role_dim(roleid);


create index idx_memship on dw.memberpay_fact(membershipid);

create index idx_date_genre on dw.rental_fact(dateid, genreid);

create index idx_zipcodeid on dw.memberpay_fact(zipcodeid);


select a.statename, sum(r.rental_count) as total_rental_number
from dw.rental_fact r
join dw.address_dim a on a.zipcodeid=r.zipcodeid
group by a.statename;



select rd.ratingname, sum(r.rental_count) as total_rental_number
from dw.rental_fact r
join dw.rating_dim rd on r.ratingid=rd.ratingid
group by rd.ratingname
order by total_rental_number desc;


select d.dateid, sum(r.rental_count) as total_rental_number
from dw.rental_fact r
join dw.date_dim d on d.dateid=r.dateid
group by d.dateid
order by total_rental_number desc limit 1;



select d.dateid, sum(f.total_pay_amount) as total_member_fee
from dw.memberpay_fact f
join dw.date_dim d on d.dateid=f.dateid
group by d.dateid
order by total_member_fee desc limit 1;




select d.cityname, sum(f.total_pay_amount) as total_member_fee
from dw.memberpay_fact f
join dw.address_dim d on d.zipcodeid=f.zipcodeid
group by d.cityname
order by total_member_fee desc limit 1;

select *
from
(
select d.membershiptype, sum(f.total_pay_amount) as total_member_fee
from dw.memberpay_fact f
join dw.membership_dim d on d.membershipid=f.membershipid
group by d.membershiptype
order by total_member_fee desc limit 1
) t
union
select *
from
(
select d.membershiptype, sum(f.total_pay_amount) as total_member_fee
from dw.memberpay_fact f
join dw.membership_dim d on d.membershipid=f.membershipid
group by d.membershiptype
order by total_member_fee limit 1
) t2
;
