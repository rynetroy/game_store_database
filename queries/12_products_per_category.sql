-- Q12 (Czanel): Categories ordered by number of products.
-- Change: LEFT JOIN so a category with no products would still appear with 0.
SELECT cat.category_name, COUNT(p.product_id) AS number_of_products
FROM categories AS cat
LEFT JOIN products AS p ON p.category_id = cat.category_id
GROUP BY cat.category_id, cat.category_name
ORDER BY number_of_products DESC, cat.category_name;
