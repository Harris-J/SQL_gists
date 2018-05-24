SELECT i.collection As 'Collection_Code'
        , (select descr from collection where i.collection = collection.collection) As 'Collection'
        , count(*) AS 'Hold Requests'

FROM request_history rh
        , item i
WHERE rh.item_id = i.item#
        AND request_date > DATEDIFF(dd,'1 jan 1970',getdate() - 365)

GROUP BY i.collection

ORDER BY i.collection;