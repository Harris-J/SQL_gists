select b.borrower# as 'BORROWER NO', b.second_id as 'ID NO', name_reconstructed as 'NAME',
parent_guardian as 'PARENT/GUARDIAN', address1 + address2 + address3 + address4 as 'ADDR',descr as 'CITY/ST',
postal_code as 'ZIP',email_address as 'EMAIL',phone_no as 'PHONE NO',
convert(varchar(12),dateadd(dd,birth_date,'1 jan 1970')) as 'BIRTH DATE',sum(amount *.01) as 'owes'
from borrower b
join borrower_address ba on b.borrower#=ba.borrower# and ba.ord = 0
join city_st st on ba.city_st = st.city_st
join borrower_phone bp on b.borrower#=bp.borrower# and bp.ord = 0
join burb bu on b.borrower#=bu.borrower#
group by b.borrower#,b.second_id,name_reconstructed,
parent_guardian,address1,address2,address3,address4,descr,
postal_code,email_address,phone_no, birth_date
having sum(amount) <>0
