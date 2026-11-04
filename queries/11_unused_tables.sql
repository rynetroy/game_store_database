-- Q11 (Luka): Tables with no reservations in the last 30 days.
-- Changes: the original filter ">= DATE_SUB(...) AND CURDATE()" does not
-- mean "between"; AND CURDATE() is simply true. Now a real 30-day window
-- ending at the snapshot date, and NOT EXISTS instead of NOT IN.
SET @as_of = '2026-04-01';

SELECT t.table_id, t.store_id, s.store_name
FROM tables AS t
JOIN store_info AS s ON s.store_id = t.store_id
WHERE NOT EXISTS (
    SELECT 1 FROM table_reservations AS tr
    WHERE tr.table_id = t.table_id
      AND tr.reservation_start >= @as_of - INTERVAL 30 DAY
      AND tr.reservation_start < @as_of
)
ORDER BY t.store_id, t.table_id;
