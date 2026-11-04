-- Q4 (Team): Can a customer book 3 of the Q3 tables (6+ seats, screen) from
-- noon to 6 pm next Tuesday, and what would it cost?
-- Changes: the original checked a single moment (10:00) instead of the
-- 12:00-18:00 window and never calculated the cost. Answered per store,
-- because one group books at one location. The 6 pm end is before Tuesday
-- peak pricing (18:00-21:00), so the base hourly rate applies.
SET @as_of = '2026-04-01';
SET @request_start = TIMESTAMP(DATE(@as_of) + INTERVAL ((1 - WEEKDAY(@as_of) + 6) % 7) + 1 DAY, '12:00:00');
SET @request_end = @request_start + INTERVAL 6 HOUR;

WITH available AS (
    SELECT w.store_id, w.table_id, w.table_price_per_hour
    FROM table_features_wide AS w
    WHERE w.capacity >= 6 AND w.screens >= 1
      AND NOT EXISTS (
          SELECT 1 FROM table_reservations AS tr
          WHERE tr.table_id = w.table_id
            AND tr.reservation_start < @request_end
            AND tr.reservation_end > @request_start
      )
),
ranked AS (
    SELECT a.*, ROW_NUMBER() OVER (PARTITION BY a.store_id
                                   ORDER BY a.table_price_per_hour, a.table_id) AS price_rank
    FROM available AS a
)
SELECT s.store_id, s.store_name, @request_start AS request_start,
       COUNT(*) AS tables_available,
       CASE WHEN COUNT(*) >= 3 THEN 'Yes' ELSE 'No' END AS can_book_3,
       CASE WHEN COUNT(*) >= 3
            THEN SUM(CASE WHEN r.price_rank <= 3 THEN r.table_price_per_hour END) * 6
       END AS cost_cheapest_3
FROM ranked AS r
JOIN store_info AS s ON s.store_id = r.store_id
GROUP BY s.store_id, s.store_name
ORDER BY s.store_id;
