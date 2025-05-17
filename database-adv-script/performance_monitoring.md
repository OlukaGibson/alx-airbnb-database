# Performance Monitoring Report

## Initial Analysis

Using EXPLAIN ANALYZE on the key booking retrieval query revealed sequential scans on the bookings table filtering by `start_date`, causing high execution times (~X ms).

## Bottlenecks Identified

- No index on bookings.start_date.
- Joins on user_id and property_id not optimized.

## Changes Implemented

- Created indexes on bookings.start_date, bookings.user_id, bookings.property_id.

## Post-Change Results

Re-running EXPLAIN ANALYZE showed:

- Index scans replaced sequential scans.
- Execution time reduced from ~X ms to ~Y ms (~Z% improvement).
- Join operations performed more efficiently.

## Recommendations

- Monitor query performance regularly.
- Consider partitioning large tables if data grows further.
- Review query patterns periodically to adjust indexing and schema.

