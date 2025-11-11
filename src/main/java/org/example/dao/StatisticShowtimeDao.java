package org.example.dao;

import org.example.model.StatisticShowtime;

import java.sql.*;
import java.sql.Date;
import java.util.*;


public class StatisticShowtimeDao extends  Dao{

    public ArrayList<StatisticShowtime> getShowtimeStatistic(Integer movieId, Date startDate, Date endDate) {
        String sql = "SELECT " +
                "    st.id AS showtime_id, " +
                "    st.time_start AS showtime_start, " +
                "    COUNT(t.id) AS total_tickets, " +
                "    SUM(t.price) AS total_revenues " +
                "FROM movies AS m " +
                "JOIN showtimes AS st ON m.id = st.movie_id " +
                "JOIN tickets AS t ON t.showtime_id = st.id " +
                "JOIN bills AS b ON b.id = t.bill_id " +
                "WHERE m.id = ? " +
                "  AND b.status = 'Paid' " +
                "  AND b.create_at BETWEEN ? AND ? " +
                "GROUP BY st.id, st.time_start " +
                "ORDER BY total_revenues DESC;";

        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setDate(2, startDate); // ví dụ: "2025-09-01"
            ps.setDate(3, endDate);   // ví dụ: "2025-10-31"
            ResultSet rs = ps.executeQuery();

            ArrayList<StatisticShowtime> showtimeArrayList = new ArrayList<>();

            while (rs.next()) {
                int showtimeId = rs.getInt("showtime_id");
                String showtimStart = rs.getString("showtime_start");
                int totalTickets = rs.getInt("total_tickets");
                double totalRevenues = rs.getDouble("total_revenues");

                StatisticShowtime statisticShowtime = new StatisticShowtime();
                statisticShowtime.setId(showtimeId);
                statisticShowtime.setStartTime(Timestamp.valueOf(showtimStart));
                statisticShowtime.setTotalTickets(totalTickets);
                statisticShowtime.setTotalRevenue(totalRevenues);

                showtimeArrayList.add(statisticShowtime);
            }
            return showtimeArrayList;

        } catch (SQLException e){
            System.out.println("Lỗi trong khi lấy thống kê showtime: Error: " + e);
            e.printStackTrace();
            return  new ArrayList<>();
        }
    }
}
