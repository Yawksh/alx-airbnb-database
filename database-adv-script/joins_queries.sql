-- INNER JOIN: Bookings with their Users, ordered by booking start_date
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
ORDER BY b.start_date DESC;

-- LEFT JOIN: Properties with their Reviews, including properties without reviews
-- Ordered by number of reviews (NULLs last)
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY r.rating DESC NULLS LAST;

-- FULL OUTER JOIN: Users and Bookings, ordered by booking start_date and user name
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id
ORDER BY b.start_date DESC NULLS LAST, u.name ASC;
