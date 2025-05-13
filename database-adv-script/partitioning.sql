-- Partition bookings by start_date (monthly)
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    ...
) PARTITION BY RANGE (start_date);

-- Example partition
CREATE TABLE bookings_2025_01 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');
