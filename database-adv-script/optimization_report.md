# Query Optimization Report

## Initial Query
The initial query joins 4 tables: `bookings`, `users`, `properties`, and `payments`, and selects multiple fields including IDs and names. While functionally correct, it retrieves more data than needed, and lacks performance tuning.

## Performance Analysis Using EXPLAIN

**Before Optimization:**

```sql
EXPLAIN ANALYZE
SELECT ...
FROM bookings
JOIN users ...
JOIN properties ...
JOIN payments ...
