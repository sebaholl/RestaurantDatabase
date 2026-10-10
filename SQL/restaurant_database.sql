CREATE DATABASE IF NOT EXISTS restaurant_db;

USE restaurant_db;

CREATE TABLE restaurant_manager (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    manager_id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES restaurant_manager(manager_id)
);

CREATE TABLE dining_table (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    table_number INT NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id),
    UNIQUE (restaurant_id, table_number)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(30),
    email VARCHAR(254) NOT NULL
);

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    table_id INT NOT NULL,
    booking_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    guest_count INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (table_id) REFERENCES dining_table(table_id)
);

INSERT INTO restaurant_manager (first_name, last_name)
VALUES
    ('Anna', 'Larsen'),
    ('Jonas', 'Holm');

INSERT INTO restaurant (manager_id, name, address)
VALUES
    (1, 'Harbour Kitchen', '12 Harbour Street, Esbjerg'),
    (2, 'Green Garden', '45 Park Avenue, Aarhus');

INSERT INTO dining_table (restaurant_id, table_number, capacity)
VALUES
    (1, 1, 2),
    (1, 2, 4),
    (1, 3, 4),
    (1, 4, 6),
    (1, 5, 8),
    (2, 1, 2),
    (2, 2, 4),
    (2, 3, 6);


INSERT INTO customer (first_name, last_name, phone, email)
VALUES
    ('Emma', 'Jensen', '+45 20 11 30 41', 'emma.jensen@example.com'),
    ('Oliver', 'Nielsen', '+45 22 46 18 90', 'oliver.nielsen@example.com'),
    ('Sofia', 'Hansen', NULL, 'sofia.hansen@example.com'),
    ('Noah', 'Andersen', '+45 31 70 25 14', 'noah.andersen@example.com'),
    ('Clara', 'Madsen', '+45 42 63 91 08', 'clara.madsen@example.com'),
    ('Lucas', 'Christensen', '+45 51 84 37 26', 'lucas.christensen@example.com');



INSERT INTO booking
    (customer_id, table_id, booking_date, start_time, end_time, guest_count)
VALUES
    (1, 2, '2026-10-15', '18:00:00', '19:30:00', 4),
    (2, 2, '2026-10-15', '20:00:00', '21:30:00', 3),
    (1, 4, '2026-10-18', '19:00:00', '21:00:00', 5),
    (3, 1, '2026-10-15', '18:30:00', '20:00:00', 2),
    (4, 3, '2026-10-16', '17:30:00', '19:00:00', 4),
    (5, 5, '2026-10-17', '19:30:00', '22:00:00', 7),
    (6, 6, '2026-10-15', '18:00:00', '19:30:00', 2),
    (2, 7, '2026-10-19', '20:00:00', '21:30:00', 4),
    (1, 3, '2026-10-22', '18:30:00', '20:30:00', 4),
    (4, 2, '2026-10-15', '22:00:00', '23:30:00', 2);