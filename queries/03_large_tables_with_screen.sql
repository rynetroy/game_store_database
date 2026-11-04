-- Q3 (Ronald): How many tables seat 6+ players and have a built-in screen?
-- Change: uses the table_features_wide view instead of hardcoded feature IDs.
SELECT COUNT(*) AS table_count
FROM table_features_wide
WHERE capacity >= 6 AND screens >= 1;
