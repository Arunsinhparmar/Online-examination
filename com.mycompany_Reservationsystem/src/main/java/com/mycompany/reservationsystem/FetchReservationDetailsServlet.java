package com.mycompany.reservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FetchReservationDetailsServlet")
public class FetchReservationDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pnrNumber = request.getParameter("pnrNumber");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reservations WHERE pnr_number = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pnrNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Fetch reservation details
                String userName = rs.getString("user_name");
                int age = rs.getInt("age");
                String gender = rs.getString("gender");
                String trainNumber = rs.getString("train_number");
                String trainName = rs.getString("train_name");
                String classType = rs.getString("class_type");
                String journeyDate = rs.getString("journey_date");
                String fromLocation = rs.getString("from_location");
                String destination = rs.getString("destination");

                // Set the reservation details as attributes to show on the confirmation page
                request.setAttribute("userName", userName);
                request.setAttribute("age", age);
                request.setAttribute("gender", gender);
                request.setAttribute("trainNumber", trainNumber);
                request.setAttribute("trainName", trainName);
                request.setAttribute("classType", classType);
                request.setAttribute("journeyDate", journeyDate);
                request.setAttribute("fromLocation", fromLocation);
                request.setAttribute("destination", destination);
                request.setAttribute("pnrNumber", pnrNumber);

                // Forward to the cancellation confirmation page
                request.getRequestDispatcher("confirmcancellation.jsp").forward(request, response);
            } else {
                response.getWriter().println("PNR Number not found. Please check and try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
