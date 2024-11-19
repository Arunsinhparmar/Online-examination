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

@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pnrNumber = request.getParameter("pnrNumber");

        // Fetch reservation details for the given PNR
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM reservations WHERE pnr_number = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, pnrNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If reservation exists, fetch details and forward to the cancellation form
                request.setAttribute("pnrNumber", rs.getString("pnr_number"));
                request.setAttribute("name", rs.getString("user_name"));
                request.setAttribute("trainNumber", rs.getString("train_number"));
                request.setAttribute("trainName", rs.getString("train_name"));
                request.setAttribute("classType", rs.getString("class_type"));
                request.setAttribute("journeyDate", rs.getString("journey_date"));
                request.setAttribute("fromLocation", rs.getString("from_location"));
                request.setAttribute("destination", rs.getString("destination"));

                // Forward to cancellation confirmation page
                request.getRequestDispatcher("confirmcancellation.jsp").forward(request, response);
            } else {
                // If no reservation found, show error message
                response.getWriter().println("Error: No reservation found for this PNR.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
