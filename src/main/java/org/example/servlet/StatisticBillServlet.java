package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.BillDao;
import org.example.model.Bill;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/statistic-bill")
public class StatisticBillServlet extends HttpServlet {

    private BillDao billDao = new BillDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer showtimeId = Integer.valueOf(request.getParameter("showtimeId"));
        String movieName = request.getParameter("movieName");
        String startTimeStr = request.getParameter("startDate");
        String endTimeStr = request.getParameter("endDate");

//        if (startTimeStr == null || endTimeStr == null || startTimeStr.isEmpty() || endTimeStr.isEmpty()) {
//            // Nếu không có tham số, chuyển hướng về trang
//            request.getRequestDispatcher("/WEB-INF/views/StatisticBill.jsp").forward(request, response);
//            return;
//        }

        Date startDate = Date.valueOf(startTimeStr);
        Date endDate = Date.valueOf(endTimeStr);

        List<Bill> billStats = billDao.getBillStatistic(showtimeId, startDate, endDate);

//        System.out.println("billStats: " +  billStats);

        request.setAttribute("billStats", billStats);
        request.setAttribute("movieName", movieName);
        request.setAttribute("startTime", startTimeStr);
        request.setAttribute("endTime", endTimeStr);


        request.getRequestDispatcher("/WEB-INF/views/StatisticBill.jsp").forward(request, response);
    }
}
