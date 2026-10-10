# Restaurant Database
Restaurant Booking Database

A MySQL database for managing restaurants, dining tables, customers, and bookings.

Tables

restaurant_manager

restaurant

dining_table

customer

booking

Relationships

One manager manages one restaurant.

One restaurant has many dining tables.

One customer can make many bookings.

One dining table can have many bookings.

Each booking connects one customer with one dining table.

Diagrams

The repository includes:

er_diagram.png

rdm_diagram.png

Normalization

The database is normalized to Third Normal Form to reduce duplicated data and keep information in the correct tables.

SQL files

restaurant_database.sql creates the database tables and inserts test data.

required_queries.sql contains the three required queries.
