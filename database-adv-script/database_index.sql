-- BEFORE indexing
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 5;

EXPLAIN ANALYZE
SELECT * FROM properties
WHERE city = 'Addis Ababa';

EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'test@example.com';

-- CREATE indexes on high-usage columns
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_users_email ON users(email);

-- AFTER indexing
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 5;

EXPLAIN ANALYZE
SELECT * FROM properties
WHERE city = 'Addis Ababa';

EXPLAIN ANALYZE
SELECT * FROM users
WHERE email = 'test@example.com';
