-- Q6 (Team): Dice sets with 7 or more dice, ordered by price per die.
-- Change: the original labeled the set price as "price_per_die" and sorted
-- by it. Price per die is set price divided by the number of dice.
SELECT p.product_name, p.price AS set_price, pa.value_numerical AS dice_in_set,
       ROUND(p.price / pa.value_numerical, 2) AS price_per_die
FROM products AS p
JOIN product_attributes AS pa ON pa.product_id = p.product_id
JOIN attributes AS a ON a.attribute_id = pa.attribute_id
WHERE a.attribute_name = 'Number of Dices in Set' AND pa.value_numerical >= 7
ORDER BY price_per_die DESC, p.product_name;
