/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author Shahin
 */
@WebServlet("/FetchPNRDetailsServlet")
public class FetchPNRDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pnrNumber = request.getParameter("pnrNumber");
        
        if (pnrNumber == null || pnrNumber.isEmpty()) {
            response.getWriter().write("{\"error\":\"PNR number is required.\"}");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reservations WHERE pnr_number = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pnrNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String json = String.format(
                    "{\"name\":\"%s\", \"trainNumber\":\"%s\", \"journeyDate\":\"%s\", \"fromLocation\":\"%s\", \"destination\":\"%s\"}",
                    rs.getString("user_name"), rs.getString("train_number"), rs.getString("journey_date"),
                    rs.getString("from_location"), rs.getString("destination")
                );
                response.getWriter().write(json);
            } else {
                response.getWriter().write("{\"error\":\"No reservation found for this PNR.\"}");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"Unable to fetch reservation details.\"}");
        }
    }
}
