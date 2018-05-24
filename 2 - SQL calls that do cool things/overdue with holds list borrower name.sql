SELECT borrower.location, btype, name, phone_no, phone_type, title.processed,
due_date=dateadd(dd,item.due_date,'1-1-1970')

FROM borrower

INNER JOIN borrower_phone on borrower_phone.borrower# = borrower.borrower#

INNER JOIN item on item.borrower# = borrower.borrower#

INNER JOIN title on title.bib# = item.bib#

WHERE (due_date < datediff (dd, '1 Jan 1970', getdate ()))

AND item.bib# in (select distinct bib# from request where request_status = 0)

order by due_date
 borrower.location, btype, name