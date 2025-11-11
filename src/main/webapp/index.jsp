<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cinema - Index</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            text-align: center;
            width: 320px;
        }
        h1 {
            font-size: 22px;
            margin-bottom: 25px;
            color: #333;
        }
        .option {
            display: block;
            margin: 14px 0;
            padding: 14px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }
        .option:hover {
            background: #45a049;
        }
    </style>
</head>
    <body>
        <div class="container">
            <h1>Cinema - Home</h1>
            <a class="option" href="<%= request.getContextPath() %>/register">Register Member</a>
            <a class="option" href="<%= request.getContextPath() %>/option-statistic">Statistic</a>
        </div>
    </body>
</html>
