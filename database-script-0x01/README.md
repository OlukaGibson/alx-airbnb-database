# Airbnb Database Schema

## Overview

This SQL script defines the relational database schema for a simplified Airbnb-like application.

### Entities Modeled

- **Users**: Represents both guests and hosts. Identified by `user_id`.
- **Properties**: Listings created by hosts. Linked to `host_id` in `users`.
- **Bookings**: Reservations made by guests for properties.
- **Payments**: Tracks transactions linked to a booking.
- **Reviews**: User-generated feedback on properties.

## Highlights

- All tables use `UUID` primary keys for unique identification.
- Foreign key constraints ensure relational integrity between entities.
- Indexes added on foreign key fields and location to optimize search and joins.

## Normalization

The schema is normalized up to **Third Normal Form (3NF)**, avoiding redundant data and ensuring that every attribute depends only on the primary key.

## Setup

To create the schema:

```bash
psql -U your_username -d your_database -f schema.sql
