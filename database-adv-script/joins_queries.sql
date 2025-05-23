-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.start_date,
    bookings.end_date
FROM
    bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if user has no booking or booking is not linked to a user
SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date
FROM
    users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
