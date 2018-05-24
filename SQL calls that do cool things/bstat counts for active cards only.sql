-- Count of BStats where the borrowers expiration date is current (or after x date) 
-- BStat table provides totals but not filterd by active cards.

select count(b.borrower#), bstat.bstat
from borrower b 
join borrower_bstat bstat  
on bstat.borrower# = b.borrower#
and expiration_date > datediff(day,'1 jan 1970','20 Jun 2017')
group by bstat.bstat
order by bstat.bstat

