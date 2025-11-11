package org.example.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.StatisticShowtimeDao;
import org.example.model.StatisticShowtime;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/statistic-showtime")
public class StatisticShowtimeServlet extends HttpServlet {

    private StatisticShowtimeDao showtimeDao = new StatisticShowtimeDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Movie id: " + request.getParameter("movieId"));
        System.out.println("Start time: " + request.getParameter("startDate"));
        System.out.println("End time: " + request.getParameter("endDate"));

        Integer movieId = Integer.valueOf(request.getParameter("movieId"));
        String startTimeStr = request.getParameter("startDate");
        String endTimeStr = request.getParameter("endDate");

        if (startTimeStr == null || endTimeStr == null || startTimeStr.isEmpty() || endTimeStr.isEmpty()) {
            // Nếu không có tham số, chuyển hướng về trang
            request.getRequestDispatcher("/WEB-INF/views/StatisticMovie.jsp").forward(request, response);
            return;
        }

        Date startDate = Date.valueOf(startTimeStr);
        Date endDate = Date.valueOf(endTimeStr);

        List<StatisticShowtime> showtimeStats = showtimeDao.getShowtimeStatistic(movieId, startDate, endDate);

        request.setAttribute("showtimeStats", showtimeStats);
        request.setAttribute("startTime", startTimeStr);
        request.setAttribute("endTime", endTimeStr);

        request.getRequestDispatcher("/WEB-INF/views/StatisticShowtime.jsp").forward(request, response);
    }
}
