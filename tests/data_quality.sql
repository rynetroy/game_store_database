-- Known data issues in the demo data. These are reported, not failed:
-- the schema allows them, and a real system would need rules to stop them.
-- See docs/findings.md for what each one means.
SELECT issue, rows_affected
FROM (
    SELECT 1 AS n, 'Table bookings outside store opening hours' AS issue, COUNT(*) AS rows_affected
        FROM table_reservations AS tr
        JOIN tables AS t ON t.table_id = tr.table_id
        JOIN store_hours AS sh ON sh.store_id = t.store_id
         AND sh.days_of_week = WEEKDAY(tr.reservation_start) + 1
        WHERE TIME(tr.reservation_start) < sh.opening_hours
           OR TIME(tr.reservation_end) > sh.closing_hours
    UNION ALL SELECT 2, 'Reservations with tables in more than one store', COUNT(*)
        FROM (SELECT tr.reservation_id
              FROM table_reservations AS tr JOIN tables AS t ON t.table_id = tr.table_id
              GROUP BY tr.reservation_id HAVING COUNT(DISTINCT t.store_id) > 1) AS x
    UNION ALL SELECT 3, 'Reservations with more guests than seats', COUNT(*)
        FROM (SELECT r.reservation_id
              FROM reservations AS r
              JOIN table_reservations AS tr ON tr.reservation_id = r.reservation_id
              JOIN table_features_wide AS w ON w.table_id = tr.table_id
              GROUP BY r.reservation_id, r.num_guests
              HAVING r.num_guests > SUM(w.capacity)) AS x
    UNION ALL SELECT 4, 'Reservations where num_tables does not match bookings', COUNT(*)
        FROM (SELECT r.reservation_id
              FROM reservations AS r
              JOIN table_reservations AS tr ON tr.reservation_id = r.reservation_id
              GROUP BY r.reservation_id, r.num_tables
              HAVING r.num_tables <> COUNT(*)) AS x
    UNION ALL SELECT 5, 'Reservations paid by a different customer''s transaction', COUNT(*)
        FROM reservations AS r JOIN transactions AS t ON t.transaction_id = r.transaction_id
        WHERE t.customer_id <> r.customer_id
    UNION ALL SELECT 6, 'Sale lines rung up by staff from another store', COUNT(*)
        FROM transactions AS t
        JOIN employees AS e ON e.employee_id = t.employee_id
        JOIN transaction_records AS r ON r.transaction_id = t.transaction_id
        JOIN inventory AS i ON i.inventory_id = r.inventory_id
        WHERE e.store_id <> i.store_id
    UNION ALL SELECT 7, 'Stores with no rental tables', COUNT(*)
        FROM store_info AS s
        WHERE NOT EXISTS (SELECT 1 FROM tables AS t WHERE t.store_id = s.store_id)
) AS issues
ORDER BY n;
