-- Q8 (Troy): Total cost of each reservation that overlaps peak pricing hours,
-- with the peak modifier applied only to the minutes inside the peak window.
-- cost = full duration x base rate + peak minutes x base rate x (modifier - 1)
-- Changes: rounded to cents; output shows the rule and peak minutes so the
-- math can be checked by hand.
-- Known limits: rules match on weekday name only, so holiday rules
-- (Halloween, Christmas, etc.) are never applied, and the peak window is
-- checked on the start date only (no bookings in this data cross midnight).
SELECT r.reservation_id,
       MIN(DATE(tr.reservation_start)) AS reservation_day,
       MIN(pr.days_of_week) AS pricing_rule,
       MIN(pr.modifier) AS modifier,
       SUM(GREATEST(TIMESTAMPDIFF(MINUTE,
               GREATEST(tr.reservation_start, TIMESTAMP(DATE(tr.reservation_start), pr.start_time)),
               LEAST(tr.reservation_end, TIMESTAMP(DATE(tr.reservation_start), pr.end_time))), 0))
           AS peak_table_minutes,
       ROUND(SUM(
           TIMESTAMPDIFF(MINUTE, tr.reservation_start, tr.reservation_end) / 60 * t.table_price_per_hour
           + GREATEST(TIMESTAMPDIFF(MINUTE,
                 GREATEST(tr.reservation_start, TIMESTAMP(DATE(tr.reservation_start), pr.start_time)),
                 LEAST(tr.reservation_end, TIMESTAMP(DATE(tr.reservation_start), pr.end_time))), 0)
             / 60 * t.table_price_per_hour * (pr.modifier - 1)
       ), 2) AS total_cost
FROM reservations AS r
JOIN table_reservations AS tr ON tr.reservation_id = r.reservation_id
JOIN tables AS t ON t.table_id = tr.table_id
JOIN pricing_rules AS pr ON pr.days_of_week = DAYNAME(tr.reservation_start)
WHERE tr.reservation_start < TIMESTAMP(DATE(tr.reservation_start), pr.end_time)
  AND tr.reservation_end > TIMESTAMP(DATE(tr.reservation_start), pr.start_time)
GROUP BY r.reservation_id
ORDER BY r.reservation_id;
