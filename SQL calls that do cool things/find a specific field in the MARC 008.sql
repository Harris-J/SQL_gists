SELECT b.bib#,b.text, substring(t.processed, 1, 75) AS 'title'
FROM bib b
LEFT JOIN title t ON b.bib# = t.bib#
WHERE b.tag = '008'
AND substring(b.text, 23, 1) = 'd' 