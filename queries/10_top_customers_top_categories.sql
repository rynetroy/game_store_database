-- Q10 (Sebastian): Top 3 customers by total spending, and each one's top 3
-- categories by amount spent.
-- Change: the original returned every category for each top customer.
-- ROW_NUMBER() now keeps only the top 3. Spend is net of returns.
WITH category_spend AS (
    SELECT c.customer_id, c.customer_name, cat.category_name,
           SUM((tr.item_quantity - tr.returned_quantity) * p.price) AS category_spent
    FROM customers AS c
    JOIN transactions AS t ON t.customer_id = c.customer_id
    JOIN transaction_records AS tr ON tr.transaction_id = t.transaction_id
    JOIN inventory AS i ON i.inventory_id = tr.inventory_id
    JOIN products AS p ON p.product_id = i.product_id
    JOIN categories AS cat ON cat.category_id = p.category_id
    GROUP BY c.customer_id, c.customer_name, cat.category_name
),
customer_totals AS (
    SELECT customer_id, SUM(category_spent) AS total_spent,
           ROW_NUMBER() OVER (ORDER BY SUM(category_spent) DESC, customer_id) AS customer_rank
    FROM category_spend
    GROUP BY customer_id
),
ranked AS (
    SELECT cs.*, ct.total_spent, ct.customer_rank,
           ROW_NUMBER() OVER (PARTITION BY cs.customer_id
                              ORDER BY cs.category_spent DESC, cs.category_name) AS category_rank
    FROM category_spend AS cs
    JOIN customer_totals AS ct ON ct.customer_id = cs.customer_id
    WHERE ct.customer_rank <= 3
)
SELECT customer_rank, customer_id, customer_name, total_spent,
       category_rank, category_name, category_spent
FROM ranked
WHERE category_rank <= 3
ORDER BY customer_rank, category_rank;
