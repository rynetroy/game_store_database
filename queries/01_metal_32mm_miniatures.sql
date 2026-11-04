-- Q1 (Ronald): Average price of 32mm-scale metal miniatures.
-- Change: attributes are matched by name instead of hardcoded IDs 14 and 8.
SELECT ROUND(AVG(p.price), 2) AS avg_price, COUNT(*) AS products_matched
FROM products AS p
JOIN product_attributes AS scale ON scale.product_id = p.product_id
JOIN attributes AS a_scale ON a_scale.attribute_id = scale.attribute_id
JOIN product_attributes AS material ON material.product_id = p.product_id
JOIN attributes AS a_material ON a_material.attribute_id = material.attribute_id
WHERE a_scale.attribute_name = 'Scale of Miniature (mm)' AND scale.value_numerical = 32
  AND a_material.attribute_name = 'Material' AND material.value_categorical = 'Metal';
