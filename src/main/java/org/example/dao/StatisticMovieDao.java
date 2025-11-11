package org.example.dao;
import org.example.model.StatisticMovie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.*;
import java.sql.SQLException;

public class StatisticMovieDao extends Dao {

    public ArrayList<StatisticMovie> getMovieStatistic(Date startDate, Date endDate) {
        String sql = "SELECT " +
                "    m.id AS movie_id, " +
                "    m.name AS movie_name, " +
                "    COUNT(t.id) AS total_tickets, " +
                "    SUM(t.price) AS total_revenues " +
                "FROM movies AS m " +
                "JOIN showtimes AS st ON m.id = st.movie_id " +
                "JOIN tickets AS t ON t.showtime_id = st.id " +
                "JOIN bills AS b ON b.id = t.bill_id " +
                "  AND b.status = 'Paid' " +
                "  AND b.create_at BETWEEN ? AND ? " +
                "GROUP BY m.id, m.name " +
                "ORDER BY total_revenues DESC;";

        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, startDate); // ví dụ: "2025-09-01"
            ps.setDate(2, endDate);   // ví dụ: "2025-10-31"
            ResultSet rs = ps.executeQuery();

            ArrayList<StatisticMovie> movieArrayList = new ArrayList<>();

            while (rs.next()) {
                int movie_id = rs.getInt("movie_id");
                String movie_name = rs.getString("movie_name");
                int totalTickets = rs.getInt("total_tickets");
                double totalRevenues = rs.getDouble("total_revenues");

                StatisticMovie statisticMovie = new StatisticMovie();

                statisticMovie.setId(movie_id);
                statisticMovie.setName(movie_name);
                statisticMovie.setTotalTickets(totalTickets);
                statisticMovie.setTotalRevenue(totalRevenues);
                statisticMovie.setStartDate(startDate);
                statisticMovie.setEndDate(endDate);

                movieArrayList.add(statisticMovie);
            }
            return movieArrayList;

        } catch (SQLException e) {
            System.out.println("Lỗi trong khi lấy thống kê phim. Error: " + e);
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
