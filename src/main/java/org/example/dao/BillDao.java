package org.example.dao;
import org.example.model.Bill;
import java.util.ArrayList;
import java.sql.*;

public class BillDao extends Dao{

    public ArrayList<Bill> getBillStatistic(Integer showtimeId, Date startDate, Date endDate) {
        String sql = "SELECT " +
                "    b.id AS bill_id, " +
                "    b.create_at AS time_purchase, " +
                "    b.payment_method AS payment_method, " +
                "    COUNT(t.id) AS total_tickets, " +
                "    SUM(t.price) AS total_revenues " +
                "FROM showtimes AS st " +
                "JOIN tickets AS t ON st.id = t.showtime_id " +
                "JOIN bills AS b ON b.id = t.bill_id " +
                "WHERE st.id = ? " +
                "  AND b.status = 'Paid' " +
                "  AND b.create_at BETWEEN ? AND ? " +
                "GROUP BY b.id, b.create_at, b.payment_method " +
                "ORDER BY total_revenues DESC;";

        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, showtimeId);
            ps.setDate(2, startDate); // ví dụ: "2025-09-01"
            ps.setDate(3, endDate);   // ví dụ: "2025-10-31"
            ResultSet rs = ps.executeQuery();

            ArrayList<Bill> billArrayList = new ArrayList<>();

            while (rs.next()) {
                int bill_id = rs.getInt("bill_id");
                String timePurchase = rs.getString("time_purchase");
                String paymentMethod = rs.getString("payment_method");
                int totalTickets = rs.getInt("total_tickets");
                double totalRevenues = rs.getDouble("total_revenues");

                Bill bill = new Bill();

                bill.setId(bill_id);
                bill.setCreateAt(Timestamp.valueOf(timePurchase));
                bill.setPaymentMethod(paymentMethod);
                bill.setTotalRevenue(totalRevenues);
                bill.setTotalTickets(totalTickets);

                billArrayList.add(bill);

            }
            return billArrayList;

        } catch (SQLException e){
            System.out.println("Lỗi trong khi lấy thống kê showtime: Error: " + e);
            e.printStackTrace();
            return  new ArrayList<>();
        }
    }
}
