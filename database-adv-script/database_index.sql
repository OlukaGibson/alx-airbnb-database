-- Index on users.id (commonly used in JOINs and WHERE clauses)
CREATE INDEX idx_users_id ON users(id);

-- Index on bookings.user_id (used in JOINs and WHERE clauses)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id (used in JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.start_date (used in ORDER BY or range queries)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index on properties.id (used in JOINs)
CREATE INDEX idx_properties_id ON properties(id);

-- Index on reviews.property_id (used in JOINs and subqueries)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on reviews.rating (used in filtering and aggregation)
CREATE INDEX idx_reviews_rating ON reviews(rating);
