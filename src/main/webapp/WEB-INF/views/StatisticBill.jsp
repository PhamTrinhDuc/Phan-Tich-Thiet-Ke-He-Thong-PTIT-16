<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="org.example.model.Bill" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Chi tiết hóa đơn suất chiếu</title>
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
    <div style="position: absolute; top: 130px; left: 135px;">
        <button onclick="history.back()">
            Quay lại
        </button>
    </div>
    <div class="container">
        <h1>Chi tiết hóa đơn cho phim: <%= request.getParameter("movieName") %>. Suất chiếu có ID: <%= request.getParameter("showtimeId") %></h1>
        <div class="info">
            <h2>Từ ngày: <%= request.getParameter("startDate")%></h2>
            <h2>Đến ngày: <%= request.getParameter("endDate") %></h2>
        </div>


        <!-- Chỉ hiển thị bảng khi có dữ liệu -->
        <%
            List<Bill> billStats= (List<Bill>) request.getAttribute("billStats");

            if (billStats != null) {
        %>

        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Hóa đơn id</th>
                <th>Thời gian mua</th>
                <th>Số vé</th>
                <th>Tổng tiền (VND)</th>
                <th>Phương thức thanh toán</th>
            </tr>
            </thead>
            <tbody>
                <% int index = 1; %>
                <% for (Bill stat : billStats) { %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= stat.getId() %></td>
                    <td><%= stat.getCreateAt()%></td>
                    <td><%= stat.getTotalTickets() %></td>
                    <td><%= String.format("%,.0f", stat.getTotalRevenue()) %></td>
                    <td><%= stat.getPaymentMethod() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="summary">
            <p>Tổng doanh thu : <%= String.format("%,.0f",
               billStats.stream().mapToDouble(Bill::getTotalRevenue).sum()) %> VND</p>
            <p>Tổng số vé bán ra: <%= billStats.stream().mapToInt(Bill::getTotalTickets).sum() %></p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
