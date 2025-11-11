
-- tạo bảng

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    position VARCHAR(100),
    room_id INTEGER REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    duration INTEGER,
    genre VARCHAR(255),
    language VARCHAR(255)
);

CREATE TABLE showtimes (
    id SERIAL PRIMARY KEY,
    time_start TIMESTAMP,
    time_end TIMESTAMP,
    movie_id INTEGER REFERENCES movies(id) ON DELETE CASCADE,
    room_id INTEGER REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    birthday DATE NOT NULL,
    address TEXT,
    gender VARCHAR(10),
    password VARCHAR(255) NOT NULL,
    code_customer VARCHAR(50) NOT NULL UNIQUE,
    point INT DEFAULT 0
);

CREATE TABLE staffs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    birthday DATE,
    address VARCHAR(255),
    gender VARCHAR(10),
    password VARCHAR(255) NOT NULL,
    position VARCHAR(10)
);

CREATE TABLE bills (
    id SERIAL PRIMARY KEY,
    create_at TIMESTAMP,
    payment_method VARCHAR(255),
    total_amount FLOAT,
    status VARCHAR(255),
    type VARCHAR(255),
    staff_id INTEGER REFERENCES staffs(id) ON DELETE SET NULL,
    customer_id INTEGER REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    price FLOAT,
    create_at TIMESTAMP,
    seat_id INTEGER REFERENCES seats(id) ON DELETE CASCADE,
    showtime_id INTEGER REFERENCES showtimes(id) ON DELETE CASCADE,
    bill_id INTEGER REFERENCES bills(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS bills CASCADE;
DROP TABLE IF EXISTS staffs CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS seats CASCADE;
DROP TABLE IF EXISTS showtimes CASCADE;