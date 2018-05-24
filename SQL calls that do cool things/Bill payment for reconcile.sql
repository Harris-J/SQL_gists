select borrower#,library_department, user_id, block, payment_amount, 
convert(varchar(13),dateadd(dd,payment_date,'01jan70'),107) as date, 
substring(convert(varchar(24),dateadd(mi,payment_time,'00:00')),12,10) as 'fine time',
fee_payment#
from fee_payment
where payment_date = '17335'

order by library_department, date, 'fine time'

