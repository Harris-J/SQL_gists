-- how many cards were created in a certain month as well as how many cards have been renewed
select
count(distinct a.borrower#) as 'new', count(distinct b.borrower#) as 'renewed'
from
borrower a,
borrower b
where
a.creation_date between datediff(dd,'1jan70','1Jan17') and datediff(dd,'1jan70','31Jan17') and
b.registration_date between datediff(dd,'1jan70','1Jan17') and datediff(dd,'1jan70','31Jan17') and
b.creation_date != b.registration_date


select count(distinct borrower#) 
from borrower
where expiration_date > datediff(dd, '1jan70', getdate())
