-- INNER JOIN: Bookings with their Users
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Properties with their Reviews (including properties with no reviews)
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: Users and Bookings (even if disconnected)
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
