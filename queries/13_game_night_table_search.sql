-- Q13 (Sebastian): 5 friends want to buy "Betrayal at House on the Hill" at
-- store 1 and play it on a table with drink holders. Which tables are free
-- for the game's average playtime?
-- The team scenario used 2026-04-01 14:00 as the requested start time.
-- Changes: added the missing semicolon (the original file stopped here);
-- the view now lives in sql/03_views.sql; the stock check returns units in
-- stock instead of counting inventory rows.
SET @game = 'Betrayal at House on the Hill';
SET @store_id = 1;
SET @game_start = '2026-04-01 14:00:00';
SET @playtime_min = (
    SELECT pa.value_numerical
    FROM products AS p
    JOIN product_attributes AS pa ON pa.product_id = p.product_id
    JOIN attributes AS a ON a.attribute_id = pa.attribute_id
    WHERE p.product_name = @game AND a.attribute_name = 'Average Playtime (Min)'
);
SET @game_end = @game_start + INTERVAL @playtime_min MINUTE;

-- Step 1: is the game in stock at the store?
SELECT p.product_name, i.store_id, i.stock
FROM inventory AS i
JOIN products AS p ON p.product_id = i.product_id
WHERE p.product_name = @game AND i.store_id = @store_id;

-- Step 2: free tables that seat 5+ and have cupholders.
SELECT w.table_id, w.store_id, w.capacity, w.cupholders,
       @game_start AS game_start, @game_end AS game_end
FROM table_features_wide AS w
WHERE w.store_id = @store_id AND w.capacity >= 5 AND w.cupholders > 0
  AND NOT EXISTS (
      SELECT 1 FROM table_reservations AS tr
      WHERE tr.table_id = w.table_id
        AND tr.reservation_start < @game_end
        AND tr.reservation_end > @game_start
  )
ORDER BY w.table_id;
