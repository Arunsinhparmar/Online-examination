package com.mycompany.reservationsystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmCancellationServlet")
public class ConfirmCancellationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pnrNumber = request.getParameter("pnrNumber");

        try (Connection conn = DBConnection.getConnection()) {
            // Delete the reservation for the given PNR
            String query = "DELETE FROM reservations WHERE pnr_number = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, pnrNumber);
            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                // Set a confirmation message to show on cancelreservation.jsp
                request.setAttribute("message", "Your reservation has been successfully canceled.");
            } else {
                // Set an error message if cancellation failed
                request.setAttribute("message", "Error: Could not cancel the reservation. Please try again.");
            }

            // Forward the request back to cancelreservation.jsp to show the message
            request.getRequestDispatcher("cancelreservation.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
