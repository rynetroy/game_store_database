-- Q5 (Troy): Busiest day for table rentals last month, by table-hours booked.
-- Changes: fixed snapshot date; exclusive month end (BETWEEN included the
-- 1st of the current month); minutes / 60 so partial hours count; RANK()
-- returns every day tied for first.
SET @as_of = '2026-04-01';
SET @month_start = DATE_FORMAT(@as_of - INTERVAL 1 MONTH, '%Y-%m-01');
SET @month_end = DATE_FORMAT(@as_of, '%Y-%m-01');

WITH daily AS (
    SELECT DATE(reservation_start) AS rental_day,
           SUM(TIMESTAMPDIFF(MINUTE, reservation_start, reservation_end)) / 60 AS table_hours
    FROM table_reservations
    WHERE reservation_start >= @month_start AND reservation_start < @month_end
    GROUP BY DATE(reservation_start)
),
ranked AS (
    SELECT rental_day, table_hours, RANK() OVER (ORDER BY table_hours DESC) AS day_rank
    FROM daily
)
SELECT rental_day, DAYNAME(rental_day) AS weekday, ROUND(table_hours, 2) AS table_hours
FROM ranked
WHERE day_rank = 1
ORDER BY rental_day;
