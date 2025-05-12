# Normalization Report – Airbnb Database

## Objective

The goal of this document is to demonstrate the normalization of the Airbnb database schema up to the **Third Normal Form (3NF)** to reduce redundancy and ensure data integrity.

---

## Step-by-Step Normalization Process

### 🔹 First Normal Form (1NF)

**Rule:** Eliminate repeating groups; ensure atomic values.

- All tables have uniquely identifiable rows (primary keys).
- Each field contains atomic (indivisible) data.
- No repeating groups or arrays.

**✅ Achieved:** 
- `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message` all contain atomic fields.

---

### 🔹 Second Normal Form (2NF)

**Rule:** Must be in 1NF and remove partial dependencies (no non-prime attribute should depend on part of a composite key).

**Actions Taken:**
- All tables use **single-column primary keys (UUIDs)** — no composite keys.
- Therefore, no partial dependency exists.

**✅ Achieved:** 
- Every non-key column is fully dependent on the whole primary key in its respective table.

---

### 🔹 Third Normal Form (3NF)

**Rule:** Must be in 2NF and remove transitive dependencies (non-key attributes should depend only on the primary key, not on other non-key attributes).

**Checks and Fixes:**
- In `User`, `email` and `phone_number` are dependent only on `user_id`, not on `first_name` or `role`, so no transitive dependency.
- In `Property`, `host_id` is the only foreign key and the rest (location, price, etc.) depend only on `property_id`.
- In `Booking`, all fields depend solely on `booking_id`.
- In `Payment`, `amount` and `payment_date` depend only on `payment_id`, not indirectly on `booking_id`.
- No calculated or derivable fields are stored.

**✅ Achieved:**
- All transitive dependencies were avoided by using properly separated tables and foreign keys.

---

## Summary

| Table      | 1NF | 2NF | 3NF |
|------------|-----|-----|-----|
| User       | ✅  | ✅  | ✅  |
| Property   | ✅  | ✅  | ✅  |
| Booking    | ✅  | ✅  | ✅  |
| Payment    | ✅  | ✅  | ✅  |
| Review     | ✅  | ✅  | ✅  |
| Message    | ✅  | ✅  | ✅  |

---

## Notes

- All entities were normalized using relational design best practices.
- Foreign keys were added to represent real-world relationships.
- No derived or redundant data is stored — ensuring efficient storage and integrity.

---

## References

- [Database Normalization Explained](https://www.studytonight.com/dbms/database-normalization.php)
- [Draw.io ER Diagrams](https://draw.io)
- Airbnb relational modeling guides
