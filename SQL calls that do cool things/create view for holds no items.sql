
Create View z_holds_no_items
as
  select distinct(r.bib#)
  ,i.ibarcode
  ,i.collection
  ,i.call
  ,i.last_cko_date
  ,i.last_status_update_date
  ,i.item_status
  from request r, item i
  where
  r.bib# = i.bib# 
  and r.bib# NOT IN
    (SELECT distinct(bib#) 
		FROM item
        WHERE item_status IN
        (SELECT item_status FROM item_status WHERE available_for_request = 1) -- 1 = Available For Request
         )
	