-- Load after 02_seed.sql.
-- One row per table, with its features turned into columns.
-- Moved here from query 13 so the query file only reads data.
CREATE OR REPLACE VIEW table_features_wide AS
SELECT t.store_id, t.table_id, t.table_price_per_hour,
       MAX(CASE WHEN f.feature_name = 'Capacity' THEN tf.value_numerical END) AS capacity,
       MAX(CASE WHEN f.feature_name = 'Cupholder' THEN tf.value_numerical END) AS cupholders,
       MAX(CASE WHEN f.feature_name = 'Number of Screens' THEN tf.value_numerical END) AS screens
FROM tables AS t
LEFT JOIN table_features AS tf ON tf.table_id = t.table_id
LEFT JOIN features AS f ON f.feature_id = tf.feature_id
GROUP BY t.store_id, t.table_id, t.table_price_per_hour;
