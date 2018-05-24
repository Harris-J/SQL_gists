select 
b1.borrower#
, substring(name_reconstructed,1,25) as 'borr name'
, convert(varchar(12),dateadd(dd,b1.date,'1 jan 1970')) as 'lost date'
, substring(b2.comment,1,30) as 'deleted title'
, substring(b1.comment,1,20) as 'deleted barcode'
 from burb b1
join burb b2 on b1.borrower#=b2.borrower# 
and b1.reference#=b2.reference# 
and b2.block = 'l'
and b1.item# is null
join borrower p on b1.borrower#=p.borrower#
where 
b1.block = 'note' 
and b1.comment like '%3222200%'





, convert(varchar(13),dateadd(dd,last_update_date,'01jan70'),107) as 'discard date'
--, block, amount, comment
, convert(varchar(13),dateadd(dd,last_cko_date,'01jan70'),107) as 'resolve date'

select 
item#, ibarcode 
,convert(varchar(13),dateadd(dd,last_update_date,'01jan70'),107) as 'discard date'
, convert(varchar(13),dateadd(dd,last_cko_date,'01jan70'),107) as 'last cko date'
select top 1000 * from discard_item where ibarcode ='32222007130091'

select 
borrower#, item#
, convert(varchar(13),dateadd(dd,cki_date,'01jan70'),107) as 'cki date'
from circ_longterm_with_borr
where item# ='561033' 


select * from burb_history
where item# ='561033' 