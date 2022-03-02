--1.	Write a function that returns the DVD ID of the next in stock DVD in the customer’s movie list (rental queue).
--•	The function should take as an IN parameter the customer ID and should return the DVD ID as the function value.
--•	The function should return the first title (the DVD ID) in the customer’s movie list that is in stock. If the movie list is empty or none of the titles are in stock, then the function should return NULL.

create or replace function next_in_stock_dvd(cust_id numeric) returns text
as $$
declare
next_dvd text;
begin
select d.dvdtitle into next_dvd
from dvd d join rentalqueue rq on rq.dvdid=d.dvdid
join member m on m.memberid=rq.memberid
where m.memberid=cust_id and d.dvdquantityonhand>0
order by rq.dateaddedinqueue limit 1;
return next_dvd;
end;
$$ language plpgsql
;

select next_in_stock_dvd(12);



-- q2
with tmp
as
(
select t1.memberid, t1.onetime_permit, t1.has_rent,
t1.membershiplimitpermonth, case when t2.plan_rent is null then 0 else t2.plan_rent end as plan_rent,
case when t3.his_has_rent is null then 0 else t3.his_has_rent end as his_has_rent
from
(
select m.memberid,
left(ms.membershiptype,1)::integer as onetime_permit, ms.membershiplimitpermonth,
count(r.dvdid) as has_rent
from member m
left join membership ms on m.membershipid=ms.membershipid
left join rental r on r.memberid=m.memberid
left join payment p on p.memberid=m.memberid
where r.rentalreturneddate is null and r.rentalrequestdate<p.amountpaiduntildate
group by m.memberid, ms.membershiptype, ms.membershiplimitpermonth
union
select m.memberid,
left(ms.membershiptype,1)::integer as onetime_permit, ms.membershiplimitpermonth,
count(r.dvdid) as has_rent
from member m
left join membership ms on m.membershipid=ms.membershipid
left join rental r on r.memberid=m.memberid
left join payment p on p.memberid=m.memberid
where r.rentalrequestdate is null
group by m.memberid, ms.membershiptype, ms.membershiplimitpermonth

) t1
full join

(
select m.memberid,
count(rq.dvdid) as plan_rent
from member m
join membership ms on m.membershipid=ms.membershipid
join payment p on p.memberid=m.memberid
join rentalqueue rq on rq.memberid=m.memberid
where rq.dateaddedinqueue<p.amountpaiduntildate
group by m.memberid
) t2
on t1.memberid=t2.memberid

full join
(
select m.memberid,
left(ms.membershiptype,1)::integer as onetime_permit, ms.membershiplimitpermonth,
count(r.dvdid) as his_has_rent
from member m
left join membership ms on m.membershipid=ms.membershipid
left join rental r on r.memberid=m.memberid
left join payment p on p.memberid=m.memberid
where r.rentalrequestdate <p.amountpaiduntildate and r.rentalreturneddate<p.amountpaiduntildate
group by m.memberid, ms.membershiptype, ms.membershiplimitpermonth
) t3 on t1.memberid=t3.memberid
where t1.has_rent<=t1.onetime_permit

)

select memberid,case when onetime_permit-has_rent-plan_rent<membershiplimitpermonth-(his_has_rent+has_rent)
then onetime_permit-has_rent-plan_rent
else membershiplimitpermonth-(his_has_rent+has_rent)
end as can_rent
from tmp
where his_has_rent+has_rent+plan_rent<membershiplimitpermonth
;

====


3.	Write a stored procedure that implements the processing when a DVD is returned in the mail from a customer and the next DVD is sent out.  This processing should include recording that the DVD has been returned and should also determine the number of additional DVDs that should be mailed to the customer.  Use the functions and stored procedures which you have already created to complete this transaction.   At minimum your stored procedure must account for the following tasks.
•	Customer returns a DVD or notes the DVD is lost in which case they are charged against their account.
•	Initiate function from question 2 to return the number of additional dvds which can be rented.
•	Initiate the function from question 1 to get a movie from the customer’s request list (rental queue) which is in stock.
•	Initiate stored procedure from Advanced Programming part 2 which removes this DVD from the queue.
•	Perform the rental of the above DVD

create or replace procedure rent_dvd(in cust_id numeric)
as $$
declare
additional integer;
additional_dvd text;
next_rent numeric;
dvd_id numeric;
next_pay numeric;
lost_price numeric;
begin
select additional_dvds(cust_id) into additional;
select next_in_stock_dvd(cust_id) into additional_dvd;
select count(*) into next_rent from rental;
select dvdid into dvd_id from dvd where dvdtitle=additional_dvd;
if dvd_id is not null then


call delete_dvd(cust_id, dvd_id);
insert into rental values (next_rent+1,cust_id, dvd_id,now(),null,null);

select membershipdvdlostprice into lost_price from membership m join member mm on mm.memrbershipid=m.membershipid;
select max(paymentid) into next_pay from payment;
insert into payment values(next_pay+1,cust_id,lost_price, now(),now());
end if;

end;
$$ language plpgsql
;

call rent_dvd(12);

create or replace procedure delete_dvd(in cust_id numeric, in dvd_id numeric)
as $$
begin
delete from rentalqueue where memberid=cust_id and dvdid=dvd_id;
end;
$$ language plpgsql
;

select * from membership;

select * from payment;

select additional_dvds(12)
select next_in_stock_dvd(12)