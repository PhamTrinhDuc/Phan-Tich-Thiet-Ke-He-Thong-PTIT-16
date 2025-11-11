<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String message = (String) request.getAttribute("message");
    Integer code = (Integer) request.getAttribute("code");
    if (message != null) {
        %>
        <script>
            alert("<%= message %>");
            <%if(code != null && code == 200) { %>
                window.location.href = "<%= request.getContextPath() %>/index.jsp";
               <% } %>
        </script>
        <%
    }
%>

<html>
<head>
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
        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 14px;
            color: #555;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .dob {
            display: flex;
            gap: 8px;
        }
        .dob input {
            flex: 1;
        }
        .gender {
            display: flex;

            gap: 20px;
            margin-bottom: 14px;
        }
        .gender label {
            font-weight: normal;
            display: flex;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Đăng ký thành viên</h2>
    <form action="register" method="post">
        <label for="name">Tên <span style="color:red;">*</span></label>
        <input type="text" name="name" required>

        <label for="email">Email</label>
        <input type="email"  name="email">

        <label for="username"> Tên tài khoản <span style="color:red;">*</span></label>
        <input type="text" name="username" required>

        <label for="password">Mật khẩu <span style="color:red;">*</span> </label>
        <input type="password" name="password" required>

        <label for="validatePassword">Xác nhận mật khẩu <span style="color:red;">*</span> </label>
        <input type="password" name="validatePassword" required>

        <label>Ngày sinh <span style="color:red;">*</span> </label>
        <div class="dob">
            <input type="number" name="day" placeholder="Ngày" min="1" max="31" required>
            <input type="number" name="month" placeholder="Tháng" min="1" max="12" required>
            <input type="number" name="year" placeholder="Năm" min="1900" max="2100" required>
        </div>

        <label>Giới tính</label>
        <div class="gender">
            <label><input type="radio" name="gender" value="Nam"> Nam</label>
            <label><input type="radio" name="gender" value="Nữ"> Nữ</label>
            <label><input type="radio" name="gender" value = "Khác">Khác</label>
        </div>

        <label for="address">Địa chỉ</label>
        <input
            type="text"
            name="address"
            placeholder="Nhập đia chỉ (VD: Hà Nội, Đà Nẵng, TP.HCM...)"
        >
        <button type="submit">Đăng ký</button>
    </form>
</div>
</body>
</html>
