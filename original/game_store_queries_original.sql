-- Game Store Query Challenges

-- 1. What is the average price of all miniatures that are 32mm
--    scale and made of metal? (Ronald)
SELECT AVG(p.price) AS avg_price_of_metal
FROM products p
JOIN product_attributes pa1 ON p.product_id = pa1.product_id
JOIN product_attributes pa2 ON p.product_id = pa2.product_id
-- att.14 = Scale(mm) & att.8 = Material 
WHERE pa1.attribute_id = 14 AND pa1.value_numerical = 32
    AND pa2.attribute_id = 8 AND pa2.value_categorical = 'Metal';

-- 2. Which customer has spent the most money on board games in
--    the last 6 months? (Czanel)
SELECT c.customer_name, SUM(tr.item_quantity * p.price) AS total_spent
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
JOIN transaction_records tr ON t.transaction_id = tr.transaction_id
JOIN inventory i ON tr.inventory_id = i.inventory_id
JOIN products p ON i.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
WHERE cat.category_name = "Board Games"
    AND t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 3. Count the number of tables that can seat 6 or more players
--    and have a built-in screen (Ronald)
SELECT COUNT(DISTINCT t.table_id) AS table_count
FROM tables t
JOIN table_features tf1 ON t.table_id = tf1.table_id
JOIN table_features tf2 ON t.table_id = tf2.table_id
-- feature_id 1 = seats, feature_id 3 = screen
WHERE tf1.feature_id = 1 AND tf1.value_numerical >= 6
    AND tf2.feature_id = 3 AND tf2.value_numerical >= 1;

-- 4. Can I book 3 of those tables from noon to 6 pm next week (no)
--    Tuesday, and how much would it cost if they’re available? (Team)

SELECT t.table_id, t.table_price_per_hour
FROM tables t
    -- join to check seating capacity
    JOIN table_features tf1 ON t.table_id = tf1.table_id
    -- join again to check screen feature (same table, different feature)
    JOIN table_features tf2 ON t.table_id = tf2.table_id
    -- feature_id 1 = seats, feature_id 3 = screen
WHERE tf1.feature_id = 1 AND tf1.value_numerical >= 6
    AND tf2.feature_id = 3 AND tf2.value_numerical >= 1
    -- exclude tables that are already booked during the requested time
    AND t.table_id NOT IN (SELECT tr.table_id FROM table_reservations tr
        -- check for overlapping time with requested booking
        WHERE '2026-04-01 10:00:00' + INTERVAL (8 - WEEKDAY('2026-04-01 10:00:00')) DAY < tr.reservation_end
        AND '2026-04-01 10:00:00' + INTERVAL (8 - WEEKDAY('2026-04-01 10:00:00')) DAY > tr.reservation_start);


-- 5. What was our busiest day for table rentals last month,
--    measured by total number of table-hours booked? (Troy)
SELECT DATE(reservation_start) AS day, SUM(TIMESTAMPDIFF(HOUR, reservation_start, reservation_end)) AS total_hours
FROM table_reservations
WHERE reservation_start BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, "%Y-%m-01") 
                            AND DATE_FORMAT(CURDATE(), "%Y-%m-01")
GROUP BY day
ORDER BY total_hours DESC
LIMIT 1;

-- 6. Show all dice products that come in sets of 7 or more,
-- ordered by price per die. (Team)
SELECT p.product_name, p.price AS price_per_die
FROM products p
JOIN product_attributes pa ON p.product_id = pa.product_id
WHERE pa.attribute_id = 9 AND pa.value_numerical >= 7
ORDER BY price_per_die DESC;

-- 7. Which product category generated the highest revenue in
-- the last 12 months? (Team)
SELECT cat.category_name, SUM(t.transaction_total) AS revenue
FROM categories cat
JOIN products p ON cat.category_id = p.category_id
JOIN inventory i ON p.product_id = i.product_id
JOIN transaction_records tr ON i.inventory_id = tr.inventory_id
JOIN transactions t ON tr.transaction_id = t.transaction_id
WHERE t.transaction_date > DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY cat.category_name
ORDER BY revenue DESC
LIMIT 1;

-- 8. Find all table reservations that overlap with peak pricing
-- hours and calculate each of their total costs, including peak
-- prices for the portions that are in peak hours. (Troy)
SELECT r.reservation_id,SUM(
        -- Base cost (full duration at normal price)
        (TIMESTAMPDIFF (MINUTE, tr.reservation_start, tr.reservation_end) / 60) * t.table_price_per_hour +
        -- Extra cost for peak-time portion
        (GREATEST(TIMESTAMPDIFF(MINUTE,GREATEST(tr.reservation_start,
                        CONCAT(DATE(tr.reservation_start), ' ', pr.start_time)),
         LEAST(tr.reservation_end,CONCAT(DATE(tr.reservation_start), ' ', pr.end_time))),0) / 60) 
         * t.table_price_per_hour * (pr.modifier - 1)) AS total_cost
FROM reservations r
JOIN table_reservations tr USING (reservation_id) -- USING instead of ON (avoid repeating column names)
JOIN tables t USING (table_id) -- Column names are the same in both tables
JOIN pricing_rules pr ON pr.days_of_week = DAYNAME(tr.reservation_start)
-- Only reservations that overlap with peak hours
WHERE tr.reservation_start < CONCAT(DATE(tr.reservation_start), ' ', pr.end_time)
  AND tr.reservation_end   > CONCAT(DATE(tr.reservation_start), ' ', pr.start_time)
GROUP BY r.reservation_id;

-- 9. List all customers who have purchased a rulebook but have
-- never booked a table. (Team)
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    JOIN transaction_records tr ON t.transaction_id = tr.transaction_id
    JOIN inventory i ON tr.inventory_id = i.inventory_id
    JOIN products p ON i.product_id = p.product_id
    JOIN categories ct ON ct.category_id = p.category_id
WHERE c.customer_id NOT IN (SELECT customer_id FROM reservations)
    AND ct.category_name = "Rulebook";

-- 10. Show the top 3 customers by total spending, and each of their
-- top 3 product categories by amount spent. (Sebastian)
SELECT c.customer_id, c.customer_name, ct.category_name, SUM(p.price * tr.item_quantity) AS category_spent
FROM customers c
    JOIN transactions t ON t.customer_id = c.customer_id
    JOIN transaction_records tr ON tr.transaction_id = t.transaction_id
    JOIN inventory i ON i.inventory_id = tr.inventory_id
    JOIN products p ON p.product_id = i.product_id
    JOIN categories ct ON ct.category_id = p.category_id
    JOIN (SELECT c2.customer_id, SUM(p2.price * tr2.item_quantity) AS total_spent
          FROM customers c2
          JOIN transactions t2 ON t2.customer_id = c2.customer_id
          JOIN transaction_records tr2 ON tr2.transaction_id = t2.transaction_id
          JOIN inventory i2 ON i2.inventory_id = tr2.inventory_id
          JOIN products p2 ON p2.product_id = i2.product_id
          JOIN categories ct2 ON ct2.category_id = p2.category_id
          GROUP BY c2.customer_id
          ORDER BY total_spent DESC
          LIMIT 3) AS top_spenders ON top_spenders.customer_id = c.customer_id
GROUP BY c.customer_id, ct.category_name
ORDER BY c.customer_id, category_spent DESC;

-- 11. List all tables that had no reservations in the last 30 days. (Luka)
SELECT t.table_id as table_number, t.store_id as store_number
FROM tables t
WHERE t.table_id NOT IN(SELECT tr.table_id
        FROM table_reservations tr
        WHERE tr.reservation_start >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE());

-- 12.Which category (or combination of categories) appears most often?
-- Show all of them, ordered by number of products. (Czanel)
SELECT c.category_name, COUNT(p.product_id) AS number_of_products
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY number_of_products DESC;

-- 13. A group of 5 friends want to buy the board game
-- “Betrayal at House on the Hill” and reserve a table to play it
-- tomorrow. The players would like a table with drink holders.
-- Find all tables that are available to be booked to meet their needs.
-- Keep in mind the average play time of the board game. (Sebastian)

-- Check whether we have the game in stock
SELECT p.product_name, COUNT(*)
FROM inventory i
JOIN products p on p.product_id = i.product_id
WHERE p.product_name = "Betrayal at House on the Hill" AND i.store_id = 1

-- create view for easy access to table information
CREATE OR REPLACE VIEW open_tables AS
SELECT t.store_id, t.table_id, t.table_price_per_hour,
    -- transpose feature_name and value_numerical into columns for each feature_name
    MAX(CASE WHEN f.feature_name = "Capacity" THEN tf.value_numerical END) AS Capacity,
    MAX(CASE WHEN f.feature_name = "Cupholder" THEN tf.value_numerical END) AS Cupholders,
    MAX(CASE WHEN f.feature_name = "Number of Screens" THEN tf.value_numerical END) AS `Num Screens`
FROM tables t
    LEFT JOIN table_features tf ON tf.table_id = t.table_id
    LEFT JOIN features f ON f.feature_id = tf.feature_id
GROUP BY t.table_id;

SELECT table_id, `Capacity`, store_id
FROM open_tables
WHERE `Capacity` >= 5 AND `Cupholders` > 0 AND store_id = 1
        -- Disclude tables that are booked at that starting time to the end of the game time
    AND table_id NOT IN(SELECT tr.table_id
        FROM table_reservations tr
        WHERE '2026-04-01 14:00:00' < tr.reservation_end
            AND DATE_ADD( '2026-04-01 14:00:00', INTERVAL( SELECT pa.value_numerical FROM products p
                JOIN product_attributes pa ON p.product_id = pa.product_id
                JOIN attributes a ON pa.attribute_id = a.attribute_id
                WHERE p.product_name = 'Betrayal at House on the Hill'
                AND a.attribute_name = 'Average Playtime (Min)') MINUTE) > tr.reservation_start);