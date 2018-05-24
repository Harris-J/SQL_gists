SELECT distinct bc.bib#, t.processed,b.text,b.tag

FROM bib_control bc 

    INNER JOIN bib b 

        ON b.bib# = bc.bib# 

			Join title t
			 On  b.bib# = t.bib#

WHERE  bc.create_date>=datediff(dd, '1 jan 1970', getdate()) - 10  -- last 90 days 