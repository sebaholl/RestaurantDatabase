-- first query

SELECT table_id, table_number, capacity
FROM dining_table
WHERE restaurant_id = 1
ORDER BY table_number;