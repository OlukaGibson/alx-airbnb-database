# Complex SQL Joins

This directory contains advanced SQL queries demonstrating the use of different types of joins.

## Files

- **joins_queries.sql**: SQL queries using `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.

## Queries

### 1. INNER JOIN
**Objective**: Retrieve all bookings and the respective users who made those bookings.

```sql
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.start_date,
    bookings.end_date
FROM
    bookings
INNER JOIN users ON bookings.user_id = users.id;  


where does this go
```


### 2. LEFT JOIN
**Objective**: Retrieve all properties and their reviews, including properties that have no reviews.

```sql
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
```

### 3. FULL OUTER JOIN
**Objective**: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

```sql
SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date
FROM
    users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;

```


# SQL Subqueries

This section contains examples of both correlated and non-correlated subqueries.

## 1. Properties with average rating > 4.0 (Non-correlated subquery)

```sql
SELECT id, name
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

## 2. Users with more than 3 bookings (Correlated subquery)

```sql
SELECT id, name
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.id
) > 3;
```

---

# SQL Aggregations and Window Functions

This section includes examples using SQL aggregation and window functions to analyze data.

## 1. Total number of bookings made by each user

**Objective**: Use the `COUNT` function with `GROUP BY` to determine how many bookings each user made.

```sql
SELECT
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name;
```

### 2. Rank properties by total bookings
```sql
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank
FROM
    properties
LEFT JOIN bookings ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name;
```
