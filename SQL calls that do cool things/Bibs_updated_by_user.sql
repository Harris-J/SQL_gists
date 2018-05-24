select bc.bib#, bc.change_user, convert(Varchar(12),dateadd (d,bc.change_date,'01 Jan 1970'),101) as 'change Date', (bc.change_time/60) 'hour', (bc.change_time %60) 'minute',  t.processed
from bib_control bc, title t
where bc.bib# = t.bib#
and change_date = datediff (dd, '01 jan 1970', '15 Nov 2016')
and bc.change_user = 'caterna'
--and bc.change_time/60 = '10'
order by hour