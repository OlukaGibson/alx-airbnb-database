-- Initial query with all details
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.name AS property_name,
    payments.id AS payment_id,
    payments.amount,
    payments.status,
    bookings.start_date,
    bookings.end_date
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;


-- Optimized version of the above query
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pm.amount,
    pm.status,
    b.start_date,
    b.end_date
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pm ON b.id = pm.booking_id;

