-- unexpired cards by stat class  with name, location & address
select b.borrower#,bs.bstat, name_reconstructed, location, 
'expiration'=convert(varchar(12),dateadd(dd,expiration_date,'1 jan 1970')), 
'address1' = substring(ba.address1,1,30), 
'city_st' = ba.city_st, 
'postal code' = ba.postal_code
from 
borrower b, 
borrower_address ba, 
borrower_bstat bs
where b.borrower#=ba.borrower# and ba.borrower#=bs.borrower# 
and expiration_date > datediff(day,'1 jan 1970','20 Jun 2017')
order by b.borrower#