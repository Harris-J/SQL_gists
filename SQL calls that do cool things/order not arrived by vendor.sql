SELECT po.vendor#,
     v.name as 'Vendor',
     po.po_number as 'PO Number',
     p.line as 'Line', p.item as 'LineItem',
     p.location as 'Loc',
     t.processed as 'Title',
convert(Varchar(12),dateadd (d,p.order_date,'01 Jan 1970'),101) as 'Order Date',
p.item# as 'Item#', p.collection as 'Coll',
i.item_status as 'St', i.ibarcode as 'Barcode', bc.bib# as 'Bib#'

FROM po_line_item p, bib_control bc, title t, item i, vendor v, po 
WHERE p.cancel_date is null
and p.receive_date is null
 and po.vendor# =  '239'         --        /* Replace with desired vendor# */
and p.order_date between
       datediff(dd,'01 jan 1970','01 Jan 2014')        --     /* Adjust Start date  */
   and datediff(dd,'01 jan 1970','30 Nov 2016')          --   /* Adjust Stop date   */
and po.vendor# = v.vendor# 
and p.item#=i.item#  
and t.bib#=bc.bib# 
and i.bib#=bc.bib#
and p.po#=po.po#
ORDER BY po.po#, p.line