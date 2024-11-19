package com.mycompany.reservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.lang.ClassNotFoundException;  // Import this

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FetchTrainNameServlet")
public class FetchTrainNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String trainNumber = request.getParameter("trainNumber");
        String trainName = "";

        System.out.println("Train number received: " + trainNumber);  // Debugging

        try {
            // Ensure the JDBC driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT train_name FROM trains WHERE train_number = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, trainNumber);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    trainName = rs.getString("train_name");
                }

                System.out.println("Train name fetched: " + trainName);  // Debugging
                response.setContentType("text/plain");
                response.getWriter().write(trainName);

            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("");  // Empty response on failure
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Error: JDBC Driver not found");
        }
    }
}
