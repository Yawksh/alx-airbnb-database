-- Analyze performance of a complex query using EXPLAIN
EXPLAIN
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE b.start_date >= '2023-01-01'
  AND b.end_date <= '2023-12-31'
  AND pay.status = 'completed';
