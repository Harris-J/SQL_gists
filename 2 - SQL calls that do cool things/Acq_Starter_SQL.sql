SELECT

po_line_item.approve_date
, po_line.bib#
, po_line.title
, po_line.isbn
, po_line.media_type
, po_line.polstat
, po_line.unit_price
, po_line_item.cancel_date
, po_line_item.invoice_date
, po_line_item.receive_date
, po_line_item.end_date
, item.creation_date
, item.ibarcode
, item.item_status
, po.po_number
, po.descr
, po_line.internal_note
, po_line.workslip_note
, po_line_item_budget.budget
, po_line_item_budget_amount.amount
, po_line_item_budget_amount.spent
, po_line_item_budget_amount.statement#
, po_line_item_budget_amount.voucher#

FROM
item, 
po,
po_line, 
po_line_item, 
po_line_item_budget, 
po_line_item_budget_amount

WHERE
po_line.line = po_line_item.line
AND
po_line.po# = po_line_item.po#
AND
item.bib# = po_line.bib#
AND
po.po# = po_line.po#
AND
po.po# = po_line_item.po#
AND
po_line_item_budget.item = po_line_item.item
AND
po_line_item_budget.line = po_line_item.line
AND
po_line_item_budget.po# = po_line_item.po#
AND
po_line_item_budget_amount.item = po_line_item_budget.item
AND
po_line_item_budget_amount.line = po_line_item_budget.line
AND
po_line_item_budget_amount.po# = po_line_item_budget.po#
AND
po_line_item_budget_amount.budget = po_line_item_budget.budget
--AND po_line_item_budget.budget like '%2017'
AND po_line_item.receive_date is NULL
AND po_line.bib# = '700096'
--((po_line_item.approve_date>=14061)
--AND
--(item.creation_date>=14061)
--AND
--(po_line_item.cancel_date Is Null))