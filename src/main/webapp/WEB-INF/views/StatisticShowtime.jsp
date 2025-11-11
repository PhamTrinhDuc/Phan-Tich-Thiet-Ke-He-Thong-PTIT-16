<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="org.example.model.StatisticShowtime" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Thống kê suất chiếu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            text-align: center;
        }

        h1 {
            color: #4CAF50;
            text-transform: uppercase;
            margin-bottom: 30px;
        }

        .filter {
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            margin-right: 8px;
            color: #333;
        }

        input[type="date"] {
            padding: 8px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            margin-right: 10px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
        }


        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            border: 1px solid #4CAF50;
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .summary {
            margin-top: 25px;
            font-size: 18px;
            font-weight: bold;
        }

        .summary p {
            margin: 5px 0;
        }
        .detail-link {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            transition: 0.2s;
        }

    </style>
</head>
<body>
    <div style="position: absolute; top: 150px; left: 135px;">
        <button onclick="history.back()">
            Quay lại
        </button>
    </div>
    <div class="container">
        <h1>Thống kê suất chiếu của phim: <%= request.getParameter("movieName")%></h1>
        <div class="info">
            <h2>Từ ngày: <%= request.getParameter("startDate")%></h2>
            <h2>Đến ngày: <%= request.getParameter("endDate") %></h2>
        </div>

        <!-- Chỉ hiển thị bảng khi có dữ liệu -->
        <%
            List<StatisticShowtime> showtimeStats = (List<StatisticShowtime>) request.getAttribute("showtimeStats");
            String start = (String) request.getParameter("startDate");
            String end = (String) request.getParameter("endDate");

            if (showtimeStats != null) {
        %>

        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã suất chiếu</th>
                <th>Ngày chiếu</th>
                <th>Giờ chiếu</th>
                <th>Tổng số vé</th>
                <th>Tổng doanh thu (VND)</th>
                <th>Xem chi tiết</th>
            </tr>
            </thead>
            <tbody>
                <% int index = 1; %>
                <% for (StatisticShowtime stat : showtimeStats) { %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= stat.getId() %></td>
                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(stat.getStartTime()) %></td>
                    <td><%= new java.text.SimpleDateFormat("HH:mm:ss").format(stat.getStartTime()) %></td>
                    <td><%= stat.getTotalTickets() %></td>
                    <td><%= String.format("%,.0f", stat.getTotalRevenue()) %></td>
                    <td>
                        <a class="detail-link"
                           href="<%= request.getContextPath() %>/statistic-bill?movieName=<%= request.getParameter("movieName") %>&showtimeId=<%= java.net.URLEncoder.encode(String.valueOf(stat.getId()), "UTF-8") %>&startDate=<%= start %>&endDate=<%= end %>">
                            Xem
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="summary">
            <p>Tổng doanh thu : <%= String.format("%,.0f",
               showtimeStats.stream().mapToDouble(StatisticShowtime::getTotalRevenue).sum()) %>VND</p>
            <p>Tổng số vé bán ra: <%= showtimeStats.stream().mapToInt(StatisticShowtime::getTotalTickets).sum() %></p>
        </div>

        <%
            }
        %>
    </div>
</body>
</html>
