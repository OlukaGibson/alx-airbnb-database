-- Step 1: Create the main partitioned table (no data, just structure)
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    -- other columns as needed
    -- e.g. status, price, created_at, etc.
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions, e.g., yearly partitions
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: (Optional) Create indexes on partitions for faster querying
CREATE INDEX ON bookings_2023 (user_id);
CREATE INDEX ON bookings_2024 (user_id);
CREATE INDEX ON bookings_2025 (user_id);

-- Step 4: Migrate existing data from old bookings table to new partitioned table
-- Example (make sure you test this carefully):
INSERT INTO bookings_partitioned (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date FROM bookings;

-- Step 5: Drop old table and rename new table (if applicable)
-- DROP TABLE bookings;
-- ALTER TABLE bookings_partitioned RENAME TO bookings;
