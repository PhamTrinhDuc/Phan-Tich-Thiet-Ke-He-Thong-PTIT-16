package org.example.dao;

import org.example.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends Dao{
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (name, username, email, birthday, address, gender, password, code_customer, point)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getUsername());
            stmt.setString(3, customer.getEmail());
            stmt.setString(4, customer.getBirthday());
            stmt.setString(5, customer.getAddress());
            stmt.setString(6, customer.getGender());
            stmt.setString(7, customer.getPassword());
            stmt.setString(8, customer.getCodeCustomer());
            stmt.setInt(9, customer.getPoint());

            int rows = stmt.executeUpdate();
            System.out.println("Thêm khách hàng với rows: " + rows);

            return rows > 0;

        } catch (SQLException e) {
            System.out.println("Lỗi trong khi thêm mới customer. Error: " + e);
            e.printStackTrace();
            return false;
        }
    }

//    public boolean checkUserExisted(String userName) {
//        String sql = "SELECT 1 FROM customers WHERE username = ?";
//        try (Connection connection = getConnection()) {
//            PreparedStatement stmt = connection.prepareStatement(sql);
//
//            stmt.setString(1, userName);
//            ResultSet rs = stmt.executeQuery();
//            return rs.next();
//
//        } catch (SQLException e) {
//            System.out.println("Lỗi trong khi kiểm tra sự tồn tại của: " + userName + "Error: " + e);
//            e.printStackTrace();
//            return false;
//        }
//    }
}
