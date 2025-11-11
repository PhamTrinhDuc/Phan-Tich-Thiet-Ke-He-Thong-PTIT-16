package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.StatisticMovieDao;
import org.example.model.StatisticMovie;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/statistic-movie")
public class StatisticMovieServlet extends HttpServlet {

    private StatisticMovieDao movieDao = new StatisticMovieDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String startTimeStr = request.getParameter("startDate");
        String endTimeStr = request.getParameter("endDate");

        if (startTimeStr == null || endTimeStr == null || startTimeStr.isEmpty() || endTimeStr.isEmpty()) {
            // Nếu không có tham số, chuyển hướng về trang
            request.getRequestDispatcher("/WEB-INF/views/StatisticMovie.jsp").forward(request, response);
            return;
        }

        // Nếu có tham số thì chuyển kiểu String sang Date và thực hiện lấy thống kê
        Date startDate = Date.valueOf(startTimeStr);
        Date endDate = Date.valueOf(endTimeStr);
        List<StatisticMovie> movieStats = movieDao.getMovieStatistic(startDate, endDate);

        request.setAttribute("movieStats", movieStats);
        request.setAttribute("startDate", startTimeStr);
        request.setAttribute("endDate", endTimeStr);

        request.getRequestDispatcher("/WEB-INF/views/StatisticMovie.jsp").forward(request, response);
    }
}
