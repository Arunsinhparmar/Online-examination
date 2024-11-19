<%-- 
    Document   : TrainReservation
    Created on : 12-Nov-2024, 9:38:56?pm
    Author     : Aniketsinh Darbar
--%>

<%@ page import="java.sql.*" %>
<%
    String trainNumber = request.getParameter("trainNumber");
    String trainName = "";

    try {
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/train_db", "username", "password");
        
        String query = "SELECT train_name FROM Train WHERE train_number = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, trainNumber);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            trainName = rs.getString("train_name");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Set trainName as an attribute and redirect back to the form
    request.setAttribute("trainName", trainName);
    request.getRequestDispatcher("trainReservationForm.jsp").forward(request, response);
%>

