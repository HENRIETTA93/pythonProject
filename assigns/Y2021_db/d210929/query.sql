select f.name
from families f join bills b on f.bill_id=b.id
where b.amount=(select max(amount) from bills);


select sum(votes)
from candidates c join results r on c.id=r.candidate_id
where c.gender='female' and age<50;


select sales_date, round(sum(sales_amount),2)
from sales_amount
group by sales_date;

select sa.sales_date, round(sum(sa.sales_amount*er.exchange_rate),2)
from sales_amount sa join exchange_rate er on sa.currency=er.source_currency
group by sa.sales_date;


-- ms---




























