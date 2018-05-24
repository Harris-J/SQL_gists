select po.item#, t.processed, SUBstring(t.call,2,25) as 'call number', t.item_status,t.n_ckos
from po_line_item po, item_with_title t
where po.item# = t.item#
and po. receive_date > 17167
and po.collection = 'anf'
order by [call number]
