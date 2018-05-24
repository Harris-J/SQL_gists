select bch.borrower#, i.processed, it.descr from 
bibliocommons_circ_history bch 
join item_with_title i
on bch.item# = i.item#
join itype it
on i.itype=it.itype
where
 bch.borrower# ='83830'