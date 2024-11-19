package com.mycompany.reservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String trainNumber = request.getParameter("trainNumber");
        String trainName = request.getParameter("trainName");
        String classType = request.getParameter("classType");
        String journeyDate = request.getParameter("journeyDate");
        String fromLocation = request.getParameter("fromLocation");
        String destination = request.getParameter("destination");

        try (Connection conn = DBConnection.getConnection()) {
            // Insert reservation details without pnr_number
            String insertSQL = "INSERT INTO reservations (user_name, age, gender, train_number, train_name, class_type, journey_date, from_location, destination) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, trainNumber);
            ps.setString(5, trainName);
            ps.setString(6, classType);
            ps.setString(7, journeyDate);
            ps.setString(8, fromLocation);
            ps.setString(9, destination);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int reservationId = rs.getInt(1); // Auto-generated reservation_id
                    String pnr = generatePNR(reservationId);

                    // Update PNR in the database
                    String updateSQL = "UPDATE reservations SET pnr_number = ? WHERE reservation_id = ?";
                    PreparedStatement updatePs = conn.prepareStatement(updateSQL);
                    updatePs.setString(1, pnr);
                    updatePs.setInt(2, reservationId);
                    updatePs.executeUpdate();

                    // Set PNR as a request attribute to forward to the confirmation page
                    request.setAttribute("pnrNumber", pnr);

                    // Forward the request to the confirmation page
                    request.getRequestDispatcher("/confirmation.jsp").forward(request, response);
                }
            } else {
                response.getWriter().println("Error: Unable to process the reservation. Please try again later.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    private String generatePNR(int reservationId) {
        // Example: PNR format "PNR20241114-1001"
        String datePart = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
        return "PNR" + datePart + "-" + reservationId;
    }
}
