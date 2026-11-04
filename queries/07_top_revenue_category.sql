-- Q7 (Team): Which product category earned the most in the last 12 months?
-- Changes: the original summed transaction_total once per line item, which
-- counts a multi-item sale's whole total against every category in it.
-- Revenue is now line quantity x price, net of returns. Fixed snapshot date.
SET @as_of = '2026-04-01';

SELECT cat.category_name,
       SUM((tr.item_quantity - tr.returned_quantity) * p.price) AS revenue
FROM categories AS cat
JOIN products AS p ON p.category_id = cat.category_id
JOIN inventory AS i ON i.product_id = p.product_id
JOIN transaction_records AS tr ON tr.inventory_id = i.inventory_id
JOIN transactions AS t ON t.transaction_id = tr.transaction_id
WHERE t.transaction_date >= @as_of - INTERVAL 12 MONTH
  AND t.transaction_date < @as_of
GROUP BY cat.category_id, cat.category_name
ORDER BY revenue DESC
LIMIT 1;
