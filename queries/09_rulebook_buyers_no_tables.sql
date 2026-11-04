-- Q9 (Team): Customers who bought a rulebook but never booked a table.
-- Change: NOT EXISTS instead of NOT IN (NOT IN returns nothing if the
-- subquery ever contains a NULL). Same result on this data.
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers AS c
JOIN transactions AS t ON t.customer_id = c.customer_id
JOIN transaction_records AS tr ON tr.transaction_id = t.transaction_id
JOIN inventory AS i ON i.inventory_id = tr.inventory_id
JOIN products AS p ON p.product_id = i.product_id
JOIN categories AS cat ON cat.category_id = p.category_id
WHERE cat.category_name = 'Rulebook'
  AND NOT EXISTS (SELECT 1 FROM reservations AS r WHERE r.customer_id = c.customer_id)
ORDER BY c.customer_id;
