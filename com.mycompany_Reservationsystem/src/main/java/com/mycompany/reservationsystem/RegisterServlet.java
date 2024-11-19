package com.mycompany.reservationsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve form data
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            try (Connection conn = DBConnection.getConnection()) {
                // Check if the email is already registered
                String checkSql = "SELECT email FROM users WHERE email = ?";
                PreparedStatement checkPs = conn.prepareStatement(checkSql);
                checkPs.setString(1, email);
                ResultSet rs = checkPs.executeQuery();

                if (rs.next()) {
                    // Email already exists
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Email already registered! Please login.');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                } else {
                    // Insert new user
                    String insertSql = "INSERT INTO users (username, email, phone, password) VALUES (?, ?, ?, ?)";
                    PreparedStatement insertPs = conn.prepareStatement(insertSql);
                    insertPs.setString(1, username);
                    insertPs.setString(2, email);
                    insertPs.setString(3, phone);
                    insertPs.setString(4, password);

                    int result = insertPs.executeUpdate();

                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Registration Successful! Please login.');");
                        out.println("location='Login.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<h2>Registration Failed. Try again!</h2>");
                    }
                }

                checkPs.close();
                rs.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }
        }
    }
}
