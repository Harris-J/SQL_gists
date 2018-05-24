  -- Finds Bib#s that don't have any holdable items attached to them
  -- Comments allow for flipping between the borrower#s and just the bibs
  
  select distinct(r.bib#)
  ,i.ibarcode
  ,i.collection
  ,SUBSTRING(i.call,2,25) as 'call number'
  ,convert(varchar(13), dateadd(dd,i.last_cko_date,'01jan70'),111) as 'last CKO'
  ,convert(varchar(13), dateadd(dd,i.last_status_update_date,'01jan70'),111) as 'last Status Update'
  ,i.item_status
  --,convert(varchar(13), dateadd(dd,r.request_date,'01jan70'),111) as 'date hold placed'
  ,t.processed as 'title'
  --,r.borrower#
  ,'=HYPERLINK'+'('+'"'+'https://stalbert.bibliocommons.com/item/show/'+Cast(r.bib# as varchar(6)) +'031")' as URL
  from request r, title t, item i
  where
  r.bib#=t.bib#
  and r.bib# = i.bib# 
  and r.bib# NOT IN
    (SELECT distinct(bib#) 
		FROM item
        WHERE item_status IN
        (SELECT item_status FROM item_status WHERE available_for_request = 1) -- 1 = Available For Request
         )
	
--order by [date hold placed]

