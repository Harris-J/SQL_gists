SELECT
'Outstanding fines/fees' = convert(money,sum(bb.amount)/100.00),
bb.borrower#, b.name, b.btype, b.location
FROM borrower b, burb bb
WHERE b.borrower# = bb.borrower#
GROUP BY bb.borrower#, b.name, b.btype, b.location
HAVING sum(bb.amount) > 0 -- SPECIFY THE DESIRED AMOUNT HERE
ORDER BY -sum(amount)
