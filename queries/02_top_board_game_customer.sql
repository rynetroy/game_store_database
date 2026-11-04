-- Q2 (Czanel): Who spent the most on board games in the last 6 months?
-- Changes: fixed snapshot date instead of CURDATE(), spend is net of returns,
-- and ties are shown instead of being cut by LIMIT 1.
SET @as_of = '2026-04-01';

WITH board_game_spend AS (
    SELECT c.customer_id, c.customer_name,
           SUM((tr.item_quantity - tr.returned_quantity) * p.price) AS total_spent
    FROM customers AS c
    JOIN transactions AS t ON t.customer_id = c.customer_id
    JOIN transaction_records AS tr ON tr.transaction_id = t.transaction_id
    JOIN inventory AS i ON i.inventory_id = tr.inventory_id
    JOIN products AS p ON p.product_id = i.product_id
    JOIN categories AS cat ON cat.category_id = p.category_id
    WHERE cat.category_name = 'Board Games'
      AND t.transaction_date >= @as_of - INTERVAL 6 MONTH
      AND t.transaction_date < @as_of
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spent
FROM board_game_spend
WHERE total_spent = (SELECT MAX(total_spent) FROM board_game_spend)
ORDER BY customer_id;
