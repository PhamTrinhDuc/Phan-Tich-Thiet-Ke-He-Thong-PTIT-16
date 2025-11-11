import psycopg2
from datetime import datetime, timedelta
import random
from faker import Faker

# Khởi tạo Faker tiếng Việt
fake = Faker('vi_VN')

# === KẾT NỐI DATABASE ===
conn = psycopg2.connect(
    dbname="cinema",   # Thay tên DB nếu cần
    user="postgres",   # Thay user
    password="duc8504",# Thay password
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Xóa và tạo lại bảng (nếu cần)
cur.execute("DROP TABLE IF EXISTS tickets, bills, showtimes, seats, rooms, customers, staffs, movies CASCADE;")
conn.commit()

# === TẠO BẢNG ===
cur.execute("""
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
""")
conn.commit()

# === DỮ LIỆU CƠ BẢN ===
room_types = ['2D', '2D', '3D', '3D', 'IMAX']
room_names = ['Phòng 101', 'Phòng 102', 'Phòng 201', 'Phòng 202', 'Phòng 301']
capacities = [80, 90, 100, 110, 120]

# Tạo phòng
room_ids = []
for name, rtype, cap in zip(room_names, room_types, capacities):
    cur.execute("INSERT INTO rooms (name, type, capacity) VALUES (%s, %s, %s) RETURNING id", (name, rtype, cap))
    room_ids.append(cur.fetchone()[0])
conn.commit()

# Tạo ghế
seat_id_map = {}
for room_id, cap in zip(room_ids, capacities):
    seats_in_room = []
    rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'][:cap // 12 + 1]
    for row in rows:
        for col in range(1, 13):
            if len(seats_in_room) >= cap:
                break
            pos = f"{row}{col}"
            seat_type = 'đôi' if col in [2, 5, 8, 11] else 'đơn'
            cur.execute("INSERT INTO seats (type, position, room_id) VALUES (%s, %s, %s) RETURNING id",
                        (seat_type, pos, room_id))
            seat_id = cur.fetchone()[0]
            seats_in_room.append((seat_id, seat_type))
    seat_id_map[room_id] = seats_in_room
conn.commit()

# Tạo phim
movie_names = [
    "Inception", "Avatar 2", "Mắt Biếc", "Oppenheimer", "Dune", "The Batman", "Top Gun: Maverick",
    "Parasite", "Your Name", "Spirited Away", "Godzilla x Kong", "Deadpool & Wolverine",
    "Inside Out 2", "Kẻ Ăn Hồn", "Lật Mặt 7"
]
movie_genres = ["Science Fiction", "Action", "Romance", "Drama", "Sci-Fi", "Action", "Action",
                "Thriller", "Animation", "Animation", "Action", "Action", "Animation", "Horror", "Action"]
movie_durations = [148, 190, 115, 180, 155, 176, 131, 132, 90, 125, 166, 128, 96, 110, 120]
movie_languages = ["English"] * 12 + ["Vietnamese"] * 3

movie_ids = []
for name, genre, dur, lang in zip(movie_names, movie_genres, movie_durations, movie_languages):
    desc = fake.sentence(nb_words=6)
    cur.execute("""INSERT INTO movies (name, description, duration, genre, language)
                   VALUES (%s, %s, %s, %s, %s) RETURNING id""",
                (name, desc, dur, genre, lang))
    movie_ids.append(cur.fetchone()[0])
conn.commit()

# Tạo khách hàng
customer_ids = []
for i in range(200):
    name = fake.name()
    username = name.lower().replace(" ", "")[:10] + str(i)
    email = f"{username}@gmail.com"
    birthday = fake.date_between(start_date='-30y', end_date='-18y')
    address = fake.address().replace("\n", ", ")
    gender = random.choice(['M', 'F'])
    code = f"CUST{1000+i:04d}"
    cur.execute("""INSERT INTO customers (name, username, email, birthday, address, gender, password, code_customer)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s) RETURNING id""",
                (name, username, email, birthday, address, gender, '123', code))
    customer_ids.append(cur.fetchone()[0])
conn.commit()

# Tạo nhân viên
staff_names = ["Nguyễn Văn A", "Trần Thị B", "Lê Văn C", "Phạm Thị D", "Hoàng Văn E", "Vũ Thị F"]
staff_positions = ["Manager", "Cashier", "Cashier", "Cashier", "Usher", "Usher"]
staff_ids = []
for name, pos in zip(staff_names, staff_positions):
    username = name.lower().replace(" ", "")[:8]
    email = f"{username}@cinema.com"
    birthday = fake.date_between(start_date='-35y', end_date='-22y')
    address = fake.address().replace("\n", ", ")
    gender = 'M' if 'Văn' in name else 'F'
    cur.execute("""INSERT INTO staffs (name, username, email, birthday, address, gender, password, position)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s) RETURNING id""",
                (name, username, email, birthday, address, gender, '123', pos))
    staff_ids.append(cur.fetchone()[0])
conn.commit()

# === TẠO SUẤT CHIẾU (6 tháng gần nhất) ===
start_date = datetime.now() - timedelta(days=90)
showtime_ids = []
showtime_data = []

for _ in range(500):
    room_id = random.choice(room_ids)
    movie_id = random.choice(movie_ids)
    date = start_date + timedelta(days=random.randint(0, 90))
    hour = random.choice([14, 17, 19, 21])
    minute = random.choice([0, 30])
    time_start = date.replace(hour=hour, minute=minute, second=0, microsecond=0)
    cur.execute("SELECT duration FROM movies WHERE id = %s", (movie_id,))
    duration = cur.fetchone()[0]
    time_end = time_start + timedelta(minutes=duration)

    cur.execute("""INSERT INTO showtimes (time_start, time_end, movie_id, room_id)
                   VALUES (%s, %s, %s, %s) RETURNING id""",
                (time_start, time_end, movie_id, room_id))
    showtime_id = cur.fetchone()[0]
    showtime_ids.append(showtime_id)
    showtime_data.append((showtime_id, room_id, time_start))
conn.commit()

# === TẠO HÓA ĐƠN & VÉ (300 hóa đơn) ===
booked_seats = {sid: set() for sid in showtime_ids}
customer_showtime = set()

price_base = {
    '2D': {'đơn': 90000, 'đôi': 160000},
    '3D': {'đơn': 120000, 'đôi': 210000},
    'IMAX': {'đơn': 180000, 'đôi': 300000}
}

payment_methods = ['cash', 'credit', 'momo', 'zalo_pay']
bill_types = ['online', 'offline']

for _ in range(1000):
    # Chọn suất chiếu
    showtime_id, room_id, time_start = random.choice(showtime_data)
    cur.execute("SELECT type FROM rooms WHERE id=%s", (room_id,))
    room_type = cur.fetchone()[0]


    # Ghế trống
    all_seats = seat_id_map[room_id]
    available = [(sid, stype) for sid, stype in all_seats if sid not in booked_seats[showtime_id]]
    if len(available) < 1:
        continue

    num_tickets = random.randint(1, min(4, len(available)))
    chosen = random.sample(available, num_tickets)

    # Khách chưa mua suất này
    valid_customers = [cid for cid in customer_ids if (cid, showtime_id) not in customer_showtime]
    if not valid_customers:
        continue
    customer_id = random.choice(valid_customers)

    staff_id = random.choice(staff_ids)
    create_at = time_start + timedelta(minutes=random.randint(-180, 60))
    if create_at > datetime.now():
        create_at = datetime.now() - timedelta(hours=random.randint(1, 24))

    bill_type = random.choices(bill_types, weights=[0.65, 0.35])[0]
    payment_method = random.choice(payment_methods)

    # Tính tiền
    total = 0
    tickets = []
    for seat_id, seat_type in chosen:
        base = price_base[room_type][seat_type]
        price = round(base * random.uniform(0.9, 1.1), -3)
        total += price
        tickets.append((price, create_at, seat_id, showtime_id))

    points = total // 1000
    cur.execute("UPDATE customers SET point = point + %s WHERE id = %s", (points, customer_id))

    # Thêm hóa đơn
    cur.execute("""INSERT INTO bills (create_at, payment_method, total_amount, status, type, staff_id, customer_id)
                   VALUES (%s, %s, %s, 'Paid', %s, %s, %s) RETURNING id""",
                (create_at, payment_method, total, bill_type, staff_id, customer_id))
    bill_id = cur.fetchone()[0]

    # Thêm vé
    for price, cat, sid, stid in tickets:
        cur.execute("""INSERT INTO tickets (price, create_at, seat_id, showtime_id, bill_id)
                       VALUES (%s, %s, %s, %s, %s)""", (price, cat, sid, stid, bill_id))

    # Cập nhật trạng thái
    for sid, _ in chosen:
        booked_seats[showtime_id].add(sid)
    customer_showtime.add((customer_id, showtime_id))

    conn.commit()

# === HOÀN TẤT ===
print("HOÀN TẤT! Đã tạo toàn bộ dữ liệu hợp lý:")
print(f"   • {len(room_ids)} phòng chiếu")
print(f"   • {sum(len(v) for v in seat_id_map.values())} ghế")
print(f"   • {len(movie_ids)} phim")
print(f"   • {len(showtime_ids)} suất chiếu (3 tháng)")
print(f"   • {len(customer_ids)} khách hàng")
print(f"   • {len(staff_ids)} nhân viên")
print(f"   • ~300 hóa đơn, ~600 vé")
print(f"   • Thời gian trải đều từ {start_date.strftime('%d/%m/%Y')} đến nay")
print("   • Đã tích điểm tự động")

cur.close()
conn.close()