package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.UserDao;
import org.example.model.Customer;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/Register.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String validatePassword = req.getParameter("validatePassword");
        String day = req.getParameter("day");
        String month = req.getParameter("month");
        String year = req.getParameter("year");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");

//        System.out.println("name:\t" + name + '\n' + "email:\t" + email + '\n' + "username:\t" + username + '\n');
//        System.out.println("password:\t" + password + '\n' + "validatePassword:\t" + validatePassword);
//        System.out.println("day:\t" + day + '\n' + "month:\t" + month + '\n' + "year:\t" + year);
//        System.out.println("gender:\t" + gender + '\n' + "address:\t" + address);

        String birthDay = day+"/"+month+"/"+year;
        String codeCustomer = username + " " +  birthDay;

        Customer customer = new Customer(
                name, username, email, birthDay, address, gender, password, codeCustomer
        );

        boolean is_sucess = userDao.addCustomer(customer);
//        boolean is_sucess = true;
        if (is_sucess) {
            req.setAttribute("message", "Đăng ký thành công");
            req.setAttribute("code", 200);
        } else {
            req.setAttribute("code", 404);
            req.setAttribute("message", "Đăng ký thất bại, vui lòng thử lại");
        }
        req.getRequestDispatcher("/WEB-INF/views/Register.jsp").forward(req, resp);
    }
}