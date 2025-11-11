<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Option Statistic</title>
     <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f1f1f1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            h1 {
                color: #4CAF50;
                text-transform: uppercase;
                margin-bottom: 25px;
                letter-spacing: 1px;
            }

            table {
                border-collapse: collapse;
                background: white;
                width: 600px;
                text-align: center;
                border: 2px solid #4CAF50;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                overflow: hidden;
            }

            th {
                background-color: #4CAF50;
                color: white;
                padding: 15px;
                font-size: 16px;
            }

            td {
                border: 1px solid #4CAF50;
                padding: 15px;
            }

            td a {
                text-decoration: none;
                color: #4CAF50;
                display: block;
                padding: 6px;
                border-radius: 5px;
                transition: all 0.2s;
                font-weight: bold;
            }

            td a:hover {
                background-color: #4CAF50;
                color: white;
            }
       </style>
</head>
<body>
    <h1>Chọn Loại Thống kê</h1>

    <table>
        <tr>
            <th>Thống kê phim</th>
            <th>Thống kê doanh thu</th>
            <th>Thống kê khách hàng</th>
        </tr>
        <tr>
            <td>
                <a href="<%= request.getContextPath() %>/statistic-movie">Theo doanh thu</a><br>
                <a href="">Theo lượt xem</a>
            </td>
            <td>
                <a href="">Theo tháng</a><br>
                <a href="">Theo năm</a>
            </td>
            <td>
                <a href="">Tần suất mua vé</a><br>
                <a href="">Khách hàng thân thiết</a>
            </td>
        </tr>
    </table>
</body>
</html>
