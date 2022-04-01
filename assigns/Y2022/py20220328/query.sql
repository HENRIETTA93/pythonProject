select * from brands;


select count(distinct brand_id), count(*) from brands;

select * from receipts;

select count(distinct receipt_id),count(*) from receipts;

select count(distinct user_id), count(*) from users;

select * from receipt_items;

select * from receipt_items where barcode not in (select distinct barcode from brands);


select rewardsreceiptstatus, count(receipt_id)
from receipts
group by rewardsreceiptstatus;

select ri.barcode, b."name",count(r.receipt_id) as receipt_count
from receipts r
join receipt_items ri on r.receipt_id=ri.receipt_id
join brands b on b.barcode=ri.barcode
group by ri.barcode, b."name"
order by count(r.receipt_id) desc limit 5;