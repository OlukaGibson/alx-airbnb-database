-- Enable UUID generator (if not already enabled)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Sample Users
INSERT INTO users (user_id, first_name, last_name, email, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Smith', 'alice@example.com', '1234567890', 'host'),
  (gen_random_uuid(), 'Bob', 'Johnson', 'bob@example.com', '0987654321', 'guest'),
  (gen_random_uuid(), 'Carol', 'Williams', 'carol@example.com', '1112223333', 'guest');

-- Fetch User IDs for use in foreign key inserts (for clarity, hardcode them or use SELECTs in dev)
-- Here we use specific UUIDs for reusability in example (replace with actual UUIDs or subqueries)
-- e.g.,
-- SELECT user_id FROM users WHERE email = 'alice@example.com';

-- Manually defined UUIDs (sample only — replace with actual or let DB generate)
-- Assume: Alice = 'uuid-host', Bob = 'uuid-guest1', Carol = 'uuid-guest2'

-- Sample Properties
INSERT INTO properties (property_id, host_id, title, description, location, price_per_night, max_guests)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'alice@example.com'), 'Cozy Apartment', 'A sunny 2-bedroom apartment', 'Kampala, Uganda', 60.00, 4),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'alice@example.com'), 'Beachside Bungalow', 'A beachfront paradise', 'Entebbe, Uganda', 120.00, 6);

-- Sample Bookings
INSERT INTO bookings (booking_id, property_id, guest_id, start_date, end_date, total_price)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM properties WHERE title = 'Cozy Apartment'),
   (SELECT user_id FROM users WHERE email = 'bob@example.com'),
   '2025-05-10', '2025-05-15', 300.00),
  (gen_random_uuid(),
   (SELECT property_id FROM properties WHERE title = 'Beachside Bungalow'),
   (SELECT user_id FROM users WHERE email = 'carol@example.com'),
   '2025-05-20', '2025-05-25', 600.00);

-- Sample Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  (gen_random_uuid(),
   (SELECT booking_id FROM bookings LIMIT 1),
   300.00, 'credit_card'),
  (gen_random_uuid(),
   (SELECT booking_id FROM bookings ORDER BY created_at DESC LIMIT 1),
   600.00, 'paypal');

-- Sample Reviews
INSERT INTO reviews (review_id, property_id, guest_id, rating, comment)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM properties WHERE title = 'Cozy Apartment'),
   (SELECT user_id FROM users WHERE email = 'bob@example.com'),
   5, 'Excellent place!'),
  (gen_random_uuid(),
   (SELECT property_id FROM properties WHERE title = 'Beachside Bungalow'),
   (SELECT user_id FROM users WHERE email = 'carol@example.com'),
   4, 'Great view but a bit noisy.');
