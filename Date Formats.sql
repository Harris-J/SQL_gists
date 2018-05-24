Below are a listing of some of the common date/time statements I use -- some of which are courtesy of Jon McConnel's share with the list.  

/*regular calendar date to integer  - Janice SQL*/
select datediff (dd,'1 Jan 1970', '12 july 2017') -- would return 16405


/*date integer to regular calendar date*/
select dateadd (dd, 17268, '1 Jan 1970') --would return November 29, 2014


/*returns results with dates between those two integers*/
and date between ('16678') and ('16045')


/*converts an integer column into a date column*/
convert (varchar(12),dateadd(dd,insert name of date column here, '1 jan 1970'),101),


/*returns results with dates between those two dates*/
and date between datediff (dd,'1 jan, 1970', '31 Aug 2015') and datediff (dd,'1 jan, 1970', '01 Sep 2016')


/*returns results with dates equal to or between these two dates*/
insert name of column here >= datediff (dd,'1 jan, 1970', '08/15/2015') and insert name of column here <= datediff (dd,'1 jan, 1970', '08/15/2016')


/*To convert a system date into the date format yy.mm.dd,
which is useful for sorting when exporting to excel - SQL below this line contributed by Jon McConnel*/

select convert(varchar(13),dateadd(dd,due_date,'01jan70'),2)
from item


/*To convert a system date into the date format mmm dd, yyyy (ex. Oct 12, 2006)*/

select convert(varchar(13),dateadd(dd,due_date,'01jan70'),107)
from item


/*To concert system time to "human" time*/

SELECT convert(Varchar(12),dateadd (d,bc.change_date,'01 Jan 1970'),101) as 'change Date'
