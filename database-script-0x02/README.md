-- Populate Reference Tables
INSERT INTO roles (role_id, name) VALUES
    (uuid_generate_v4(), 'guest'),
    (uuid_generate_v4(), 'host'),
    (uuid_generate_v4(), 'admin');

INSERT INTO booking_statuses (status_id, name) VALUES
    (uuid_generate_v4(), 'pending'),
    (uuid_generate_v4(), 'confirmed'),
    (uuid_generate_v4(), 'canceled');

INSERT INTO payment_methods (method_id, name) VALUES
    (uuid_generate_v4(), 'credit_card'),
    (uuid_generate_v4(), 'paypal'),
    (uuid_generate_v4(), 'stripe');

INSERT INTO locations (location_id, city, state, country) VALUES
    (uuid_generate_v4(), 'Paris', 'Île-de-France', 'France'),
    (uuid_generate_v4(), 'New York', 'NY', 'USA');

-- Create Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role_id) VALUES
    (uuid_generate_v4(), 'Alice', 'Smith', 'alice@example.com', 'hash1', (SELECT role_id FROM roles WHERE name = 'guest')),
    (uuid_generate_v4(), 'Bob', 'Jones', 'bob@example.com', 'hash2', (SELECT role_id FROM roles WHERE name = 'host'));

-- Create Properties
INSERT INTO properties (property_id, host_id, name, description, location_id, pricepernight) VALUES
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE email = 'bob@example.com'), 
     'Cozy Paris Apartment', 
     'A charming apartment near the Eiffel Tower.',
     (SELECT location_id FROM locations WHERE city = 'Paris'),
     150.00);

-- Create Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, status_id) VALUES
    (uuid_generate_v4(),
     (SELECT property_id FROM properties WHERE name = 'Cozy Paris Apartment'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     '2024-01-15',
     '2024-01-20',
     (SELECT status_id FROM booking_statuses WHERE name = 'confirmed'));

-- Create Payments
INSERT INTO payments (payment_id, booking_id, amount, method_id) VALUES
    (uuid_generate_v4(),
     (SELECT booking_id FROM bookings LIMIT 1),
     750.00,
     (SELECT method_id FROM payment_methods WHERE name = 'credit_card'));

-- Create Reviews
INSERT INTO reviews (review_id, booking_id, rating, comment) VALUES
    (uuid_generate_v4(),
     (SELECT booking_id FROM bookings LIMIT 1),
     5,
     'Fantastic stay! Highly recommended.');