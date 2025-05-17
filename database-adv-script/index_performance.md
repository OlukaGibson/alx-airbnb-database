# Index Performance Analysis

This file documents the performance of key queries before and after creating indexes to optimize database operations.

## Indexed Columns and Justification

- **users.id** – Frequently used in JOINs with bookings.
- **bookings.user_id** – Used in WHERE and JOIN clauses.
- **bookings.property_id** – Used in JOINs with properties.
- **bookings.start_date** – Often sorted or filtered for time-based queries.
- **properties.id** – Used in JOINs and subqueries.
- **reviews.property_id** – Used in subqueries and joins to fetch reviews.
- **reviews.rating** – Used in filtering and aggregate functions.

## Sample Query: Total number of bookings by user

```sql
EXPLAIN ANALYZE
SELECT
    users.id,
    users.name,
    COUNT(bookings.id)
FROM
    users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name;
