-- insert dữ liệu

ALTER SEQUENCE seats_id_seq RESTART WITH 1;
ALTER SEQUENCE movies_id_seq RESTART WITH 1;
ALTER SEQUENCE showtimes_id_seq RESTART WITH 1;
ALTER SEQUENCE customers_id_seq RESTART WITH 1;
ALTER SEQUENCE staffs_id_seq RESTART WITH 1;
ALTER SEQUENCE bills_id_seq RESTART WITH 1;
ALTER SEQUENCE tickets_id_seq RESTART WITH 1;

SELECT pg_get_serial_sequence('seats', 'id');


INSERT INTO rooms (name, type, capacity) VALUES
  ('Phòng 101', '2D', 80),
  ('Phòng 202', '3D', 100),
  ('Phòng 301', 'IMAX', 120);


INSERT INTO seats (type, position, room_id) VALUES
  ('đơn', 'A1', 1), ('đơn', 'A2', 1), ('đôi', 'B2', 1),
  ('đơn', 'C1', 2), ('đơn', 'C3', 2), ('đôi', 'C5', 2),
  ('đôi', 'D2', 3), ('đôi', 'D5', 3), ('đơn', 'B5', 3);


INSERT INTO movies (name, description, duration, genre, language) VALUES
  ('Inception', 'Sci-fi thriller', 148, 'Science Fiction', 'English'),
  ('Avatar 2', 'Epic adventure', 190, 'Action', 'English'),
  ('Mắt Biếc', 'Tình cảm Việt Nam', 115, 'Romance', 'Vietnamese'),
  ('Oppenheimer', 'Historical drama', 180, 'Drama', 'English');


INSERT INTO showtimes (time_start, time_end, movie_id, room_id) VALUES
  ('2025-09-20 18:00:00', '2025-09-20 20:30:00', 1, 1),
  ('2025-09-22 20:00:00', '2025-09-22 22:45:00', 2, 2),
  ('2025-10-01 19:00:00', '2025-10-01 21:30:00', 3, 1),
  ('2025-10-05 18:00:00', '2025-10-05 20:45:00', 4, 3),
  ('2025-10-10 21:00:00', '2025-10-10 23:30:00', 1, 2),
  ('2025-10-15 17:30:00', '2025-10-15 20:00:00', 2, 3),
  ('2025-10-20 19:00:00', '2025-10-20 21:45:00', 3, 1);


INSERT INTO customers (name, username, email, birthday, address, gender, password, code_customer, point) VALUES
  ('Nguyễn Văn A', 'nguyenvana', 'a@gmail.com', '2002-04-15', 'Hà Nội', 'M', '123', 'CUST001', 150),
  ('Trần Thị B', 'tranthib', 'b@gmail.com', '2001-07-21', 'TP.HCM', 'F', '123', 'CUST002', 200),
  ('Lê Văn C', 'levanc', 'c@gmail.com', '2003-10-02', 'Đà Nẵng', 'M', '123', 'CUST003', 80),
  ('Phạm Thị D', 'phamthid', 'd@gmail.com', '2002-12-12', 'Hải Phòng', 'F', '123', 'CUST004', 120);


INSERT INTO staffs (name, username, email, birthday, address, gender, password, position) VALUES
  ('Phạm Văn Hiếu', 'hieunv', 'hieunv@cinema.com', '1999-01-01', 'Hà Nội', 'M', '123', 'Manager'),
  ('Nguyễn Thị Ngọc', 'ngocnv', 'ngoc@cinema.com', '2000-06-10', 'TP.HCM', 'F', '123', 'Cashier');



INSERT INTO bills (create_at, payment_method, total_amount, status, type, staff_id, customer_id) VALUES
  ('2025-09-23 00:00:00', 'cash', 270000, 'Paid', 'online', 1, 2),
  ('2025-09-25 00:00:00', 'credit', 310000, 'Paid', 'offline', 2, 3),
  ('2025-09-27 00:00:00', 'cash', 450000, 'Paid', 'online', 2, 1),
  ('2025-09-29 00:00:00', 'cash', 220000, 'Paid', 'online', 1, 4),
  ('2025-10-03 00:00:00', 'credit', 380000, 'Paid', 'offline', 2, 1),
  ('2025-10-06 00:00:00', 'cash', 520000, 'Paid', 'online', 2, 2),
  ('2025-10-08 00:00:00', 'cash', 190000, 'Paid', 'online', 1, 3),
  ('2025-10-12 00:00:00', 'credit', 460000, 'Paid', 'offline', 1, 4),
  ('2025-10-18 00:00:00', 'cash', 250000, 'Paid', 'online', 2, 1),
  ('2025-10-21 00:00:00', 'credit', 320000, 'Paid', 'offline', 2, 2),
  ('2025-10-23 00:00:00', 'cash', 410000, 'Paid', 'online', 1, 3),
  ('2025-10-25 00:00:00', 'cash', 275000, 'Paid', 'online', 2, 4),
  ('2025-10-27 00:00:00', 'cash', 365000, 'Paid', 'online', 1, 1),
  ('2025-10-29 00:00:00', 'credit', 480000, 'Paid', 'offline', 2, 3);


INSERT INTO tickets (price, create_at, seat_id, showtime_id, bill_id) VALUES
  (135000, '2025-09-23 00:00:00', 1, 1, 1),
  (135000, '2025-09-23 00:00:00', 2, 1, 1),

  (155000, '2025-09-25 00:00:00', 4, 2, 2),
  (155000, '2025-09-25 00:00:00', 5, 2, 2),

  (225000, '2025-09-27 00:00:00', 6, 2, 3),
  (225000, '2025-09-27 00:00:00', 7, 3, 3),

  (110000, '2025-09-29 00:00:00', 3, 3, 4),
  (110000, '2025-09-29 00:00:00', 9, 4, 4),

  (190000, '2025-10-03 00:00:00', 1, 5, 5),
  (190000, '2025-10-03 00:00:00', 2, 5, 5),

  (260000, '2025-10-06 00:00:00', 3, 4, 6),
  (260000, '2025-10-06 00:00:00', 4, 4, 6),

  (95000, '2025-10-08 00:00:00', 5, 5, 7),
  (95000, '2025-10-08 00:00:00', 6, 5, 7),

  (230000, '2025-10-12 00:00:00', 7, 6, 8),
  (230000, '2025-10-12 00:00:00', 8, 6, 8),

  (125000, '2025-10-18 00:00:00', 9, 7, 9),
  (125000, '2025-10-18 00:00:00', 1, 7, 9),

  (160000, '2025-10-21 00:00:00', 2, 1, 10),
  (160000, '2025-10-21 00:00:00', 3, 1, 10),

  (205000, '2025-10-23 00:00:00', 4, 2, 11),
  (205000, '2025-10-23 00:00:00', 5, 2, 11),

  (135000, '2025-10-25 00:00:00', 6, 3, 12),
  (135000, '2025-10-25 00:00:00', 7, 3, 12),

  (180000, '2025-10-27 00:00:00', 8, 4, 13),
  (185000, '2025-10-27 00:00:00', 9, 4, 13),

  (240000, '2025-10-29 00:00:00', 3, 5, 14),
  (240000, '2025-10-29 00:00:00', 4, 6, 14);

