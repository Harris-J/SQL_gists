--3 Reports for Horizon request history

--This query will report the average number of days an item stays on the hold shelf before it is either picked up or the hold expires. The average is broken down by location.

SELECT pickup_location, AVG(hold_shelf_age) AS avg_pickup_time
FROM request_history r
WHERE resolved_status IN (1,5)
GROUP BY pickup_location 

--This query shows overall numbers of holds that were picked up after X days. This is also broken down per location.

SELECT pickup_location, hold_shelf_age, COUNT(hold_shelf_age) AS #picked_up
FROM request_history r
WHERE resolved_status IN (1,5)
GROUP BY pickup_location, hold_shelf_age

-- This query shows the numbers picked up by day of the week, with 1=Sunday and 7=Saturday. This is also broken down per location.

SELECT pickup_location
, DATEPART(dw, DATEADD(dd, resolved_date, '1 Jan 1970')) AS day_picked_up
, COUNT(*)AS #picked_up
FROM request_history r
WHERE resolved_status IN (1,5)
GROUP BY pickup_location, DATEPART(dw, DATEADD(dd, resolved_date, '1 Jan 1970'))