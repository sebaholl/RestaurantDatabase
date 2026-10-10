-- first query

SELECT table_id, table_number, capacity
FROM dining_table
WHERE restaurant_id = 1
ORDER BY table_number;



-- second query

SELECT
    booking.booking_id,
    booking.booking_date,
    booking.start_time,
    booking.end_time,
    booking.guest_count,
    dining_table.table_number,
    restaurant.name AS restaurant_name
FROM booking
JOIN dining_table
    ON booking.table_id = dining_table.table_id
JOIN restaurant
    ON dining_table.restaurant_id = restaurant.restaurant_id
WHERE booking.customer_id = 1
ORDER BY booking.booking_date, booking.start_time;