
-- script truy vấn dữ liệu

SELECT * FROM public.tickets
ORDER BY id ASC 


-- thống kê phim theo doanh thu
-- lấy tên phim, tổng vé, tổng doanh thu
SELECT 
    m.name,
    COUNT(t.id) AS total_tickets,
    SUM(t.price) AS total_revenues
FROM movies AS m
JOIN showtimes AS st ON m.id = st.movie_id
JOIN tickets AS t ON t.showtime_id = st.id
JOIN bills AS b ON b.id = t.bill_id
WHERE b.status = 'Paid'
  AND b.create_at BETWEEN '2025-09-01' AND '2025-10-31'
GROUP BY m.id, m.name
ORDER BY total_revenues DESC;



-- thống kê suất chiếu theo doanh thu
-- lấy thời gian chiếu, phòng chiếu, tống số vé, doanh thu
SELECT 
    st.time_start AS showtime_start,
    r.name AS room_name,
    COUNT(t.id) AS total_tickets,
    SUM(t.price) AS total_revenues
FROM movies AS m
JOIN showtimes AS st ON m.id = st.movie_id
JOIN rooms AS r ON st.room_id = r.id
JOIN tickets AS t ON t.showtime_id = st.id
JOIN bills AS b ON b.id = t.bill_id
WHERE m.id = 1 
  AND b.status = 'Paid'
  AND b.create_at BETWEEN '2025-09-01' AND '2025-10-31'
GROUP BY st.id, st.time_start, r.name
ORDER BY total_revenues DESC;


-- thống kê bill
-- lấy thời gian mua, số vé, tổng tiền, phương thức thanh toán, tên khách hàng
SELECT 
	b.create_at AS time_purchase,
	c.name AS customer_name, 
	b.payment_method AS payment_method, 
	COUNT(t.id) AS total_tickets,
    SUM(t.price) AS total_revenues
FROM showtimes AS st 
JOIN tickets AS t ON st.id = t.showtime_id 
JOIN bills AS b ON b.id = t.bill_id
JOIN customers AS c ON b.customer_id=c.id
WHERE 
	st.id=5
  	AND b.status = 'Paid'
  	AND b.create_at BETWEEN '2025-09-01' AND '2025-10-31'
GROUP BY b.id, b.create_at, b.payment_method, c.name

