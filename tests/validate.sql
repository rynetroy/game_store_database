-- Run after loading 01_schema, 02_seed and 03_views. Every row should say PASS.
-- Read-only checks on the demo data; they do not block bad data on insert.
SELECT check_name, expected, actual,
       CASE WHEN expected = actual THEN 'PASS' ELSE 'FAIL' END AS result
FROM (
    SELECT 'Tables in schema' AS check_name, 17 AS expected, COUNT(*) AS actual
        FROM information_schema.tables
        WHERE table_schema = DATABASE() AND table_type = 'BASE TABLE'
    UNION ALL SELECT 'Stores', 8, COUNT(*) FROM store_info
    UNION ALL SELECT 'Employees', 34, COUNT(*) FROM employees
    UNION ALL SELECT 'Customers', 30, COUNT(*) FROM customers
    UNION ALL SELECT 'Products', 30, COUNT(*) FROM products
    UNION ALL SELECT 'Inventory rows', 35, COUNT(*) FROM inventory
    UNION ALL SELECT 'Transactions', 60, COUNT(*) FROM transactions
    UNION ALL SELECT 'Transaction lines', 60, COUNT(*) FROM transaction_records
    UNION ALL SELECT 'Reservations', 24, COUNT(*) FROM reservations
    UNION ALL SELECT 'Table bookings', 35, COUNT(*) FROM table_reservations
    UNION ALL SELECT 'Rental tables', 26, COUNT(*) FROM tables
    UNION ALL SELECT 'Bookings that end before they start', 0, COUNT(*)
        FROM table_reservations WHERE reservation_end <= reservation_start
    UNION ALL SELECT 'Double-booked tables', 0, COUNT(*)
        FROM table_reservations AS a
        JOIN table_reservations AS b ON b.table_id = a.table_id
          AND a.table_reservations_id < b.table_reservations_id
          AND a.reservation_start < b.reservation_end
          AND b.reservation_start < a.reservation_end
    UNION ALL SELECT 'Prices at or below zero', 0,
        (SELECT COUNT(*) FROM products WHERE price <= 0)
      + (SELECT COUNT(*) FROM tables WHERE table_price_per_hour <= 0)
    UNION ALL SELECT 'Negative stock', 0, COUNT(*) FROM inventory WHERE stock < 0
    UNION ALL SELECT 'Transactions with no line items', 0, COUNT(*)
        FROM transactions AS t
        WHERE NOT EXISTS (SELECT 1 FROM transaction_records AS r
                          WHERE r.transaction_id = t.transaction_id)
    UNION ALL SELECT 'Returns larger than quantity sold', 0, COUNT(*)
        FROM transaction_records WHERE returned_quantity > item_quantity
    UNION ALL SELECT 'Totals that do not match line items', 0, COUNT(*)
        FROM transactions AS t
        JOIN (SELECT r.transaction_id, SUM(r.item_quantity * p.price) AS line_total
              FROM transaction_records AS r
              JOIN inventory AS i ON i.inventory_id = r.inventory_id
              JOIN products AS p ON p.product_id = i.product_id
              GROUP BY r.transaction_id) AS l ON l.transaction_id = t.transaction_id
        WHERE ABS(t.transaction_total - l.line_total) > 0.005
    UNION ALL SELECT 'Product attributes with no value', 0, COUNT(*)
        FROM product_attributes
        WHERE value_numerical IS NULL AND value_categorical IS NULL
) AS checks;
