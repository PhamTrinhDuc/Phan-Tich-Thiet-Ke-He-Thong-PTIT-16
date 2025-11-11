ALTER SEQUENCE rooms_id_seq RESTART WITH 1;
ALTER SEQUENCE seats_id_seq RESTART WITH 1;
ALTER SEQUENCE movies_id_seq RESTART WITH 1;
ALTER SEQUENCE showtimes_id_seq RESTART WITH 1;
ALTER SEQUENCE customers_id_seq RESTART WITH 1;
ALTER SEQUENCE staffs_id_seq RESTART WITH 1;
ALTER SEQUENCE bills_id_seq RESTART WITH 1;
ALTER SEQUENCE tickets_id_seq RESTART WITH 1;


-- 1. PHÒNG CHIẾU (6 phòng)
INSERT INTO rooms (name, type, capacity) VALUES
  ('Phòng A1', '2D', 80),
  ('Phòng A2', '2D', 80),
  ('Phòng B1', '3D', 100),
  ('Phòng B2', '3D', 100),
  ('Phòng C1', 'IMAX', 120),
  ('Phòng C2', 'IMAX', 120);

-- 2. GHẾ (mỗi phòng 10 ghế, đa dạng vị trí và loại)
INSERT INTO seats (type, position, room_id) VALUES
  -- Phòng A1 (2D)
  ('đơn', 'A1', 1), ('đơn', 'A2', 1), ('đơn', 'A3', 1), ('đơn', 'A4', 1),
  ('đôi', 'B1', 1), ('đôi', 'B2', 1), ('đơn', 'C1', 1), ('đơn', 'C2', 1),
  ('đơn', 'D1', 1), ('đôi', 'D2', 1),
  -- Phòng A2 (2D)
  ('đơn', 'A1', 2), ('đơn', 'A2', 2), ('đơn', 'A3', 2), ('đôi', 'B1', 2),
  ('đôi', 'B2', 2), ('đơn', 'C1', 2), ('đơn', 'C2', 2), ('đơn', 'D1', 2),
  ('đôi', 'D2', 2), ('đơn', 'E1', 2),
  -- Phòng B1 (3D)
  ('đơn', 'A1', 3), ('đơn', 'A2', 3), ('đôi', 'B1', 3), ('đôi', 'B2', 3),
  ('đơn', 'C1', 3), ('đơn', 'C2', 3), ('đôi', 'D1', 3), ('đôi', 'D2', 3),
  ('đơn', 'E1', 3), ('đơn', 'E2', 3),
  -- Phòng B2 (3D)
  ('đơn', 'A1', 4), ('đơn', 'A2', 4), ('đơn', 'A3', 4), ('đôi', 'B1', 4),
  ('đôi', 'B2', 4), ('đơn', 'C1', 4), ('đơn', 'C2', 4), ('đôi', 'D1', 4),
  ('đơn', 'E1', 4), ('đơn', 'E2', 4),
  -- Phòng C1 (IMAX)
  ('đôi', 'VIP1', 5), ('đôi', 'VIP2', 5), ('đơn', 'A1', 5), ('đơn', 'A2', 5),
  ('đơn', 'B1', 5), ('đơn', 'B2', 5), ('đôi', 'C1', 5), ('đôi', 'C2', 5),
  ('đơn', 'D1', 5), ('đơn', 'D2', 5),
  -- Phòng C2 (IMAX)
  ('đôi', 'VIP1', 6), ('đôi', 'VIP2', 6), ('đơn', 'A1', 6), ('đơn', 'A2', 6),
  ('đơn', 'B1', 6), ('đơn', 'B2', 6), ('đôi', 'C1', 6), ('đôi', 'C2', 6),
  ('đơn', 'D1', 6), ('đơn', 'D2', 6);