-- looks up item numbers, titles and call numbers based on a PO numbers
SELECT po.item#, t.processed, SUBstring(t.call,2,25) as 'call number', t.item_status,t.n_ckos
FROM po_line_item po, item_with_title t
WHERE po.item# = t.item#
AND po. receive_date > 17167
AND po.collection = 'anf'
ORDER BY [call number]
