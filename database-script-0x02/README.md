# Airbnb Sample Data Seeding

This script seeds the database with realistic sample data to simulate the core operations of an Airbnb-like platform.

## Entities Populated

- **Users**: 1 host and 2 guests
- **Properties**: 2 properties hosted by Alice
- **Bookings**: 2 bookings (1 per guest)
- **Payments**: Corresponding payments for each booking
- **Reviews**: Feedback from guests for each property

## Usage

Run this after you've created the schema (from Task 2):

```bash
psql -U your_username -d your_database -f seed.sql
