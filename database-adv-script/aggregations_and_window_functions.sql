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

-- Window Function: Rank properties based on total number of bookings using ROW_NUMBER
SELECT 
    property_id,
    COUNT(*) AS booking_count,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM 
    bookings
GROUP BY 
    property_id
ORDER BY 
    rank;
