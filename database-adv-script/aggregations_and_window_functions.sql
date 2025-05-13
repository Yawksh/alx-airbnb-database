-- Aggregation: Total number of bookings made by each user
SELECT 
    user_id, 
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id
ORDER BY 
    total_bookings DESC;

-- Window Function: Use ROW_NUMBER to rank properties by total bookings
SELECT 
    property_id,
    COUNT(*) AS booking_count,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_rank
FROM 
    bookings
GROUP BY 
    property_id;

-- Window Function: Use RANK to handle ties in ranking of properties
SELECT 
    property_id,
    COUNT(*) AS booking_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM 
    bookings
GROUP BY 
    property_id;
