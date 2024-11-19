<%-- 
    Document   : reservationform
    Created on : 12-Nov-2024, 9:35:54 pm
    Author     : Aniketsinh Darbar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Train Reservation Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('train_reservation.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .register-container {
            width: 100%;
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
             background: #f5f5f5;
        }
        .register-container:hover {
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            color: #555;
        }
        .input-group input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        .input-group input:focus {
            border-color: #6a11cb;
            outline: none;
        }
        .input-group button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .input-group button:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .input-group button:active {
            transform: translateY(0);
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Train Reservation Form</h2>
        <form action="trainReservation.jsp" method="post">
            <div class="input-group">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" required>
            </div>

            <div class="input-group">
                <label for="age">Age:</label>
                <input type="number" name="age" id="age" min="0" required>
            </div>

            <div class="input-group">
                <label for="gender">Gender:</label>
                <select name="gender" id="gender" required>
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="input-group">
                <label for="trainNumber">Train Number:</label>
                <input type="text" name="trainNumber" id="trainNumber" required>
            </div>

            <div class="input-group">
                <label for="trainName">Train Name:</label>
                <input type="text" name="trainName" id="trainName" readonly
                       value="<%= request.getAttribute("trainName") != null ? request.getAttribute("trainName") : "" %>">
            </div>

            <div class="input-group">
                <label for="classType">Class Type:</label>
                <select name="classType" id="classType" required>
                    <option value="">Select</option>
                    <option value="Sleeper">Sleeper</option>
                    <option value="AC">AC</option>
                </select>
            </div>

            <div class="input-group">
                <label for="journeyDate">Date of Journey:</label>
                <input type="date" name="journeyDate" id="journeyDate" required>
            </div>

            <div class="input-group">
                <label for="fromLocation">From:</label>
                <input type="text" name="fromLocation" id="fromLocation" required>
            </div>

            <div class="input-group">
                <label for="destination">To:</label>
                <input type="text" name="destination" id="destination" required>
            </div>

            <div class="input-group">
                <button type="submit">Insert</button>
            </div>
        </form>
        <div class="footer">
            &copy; 12/11/2024 Train Reservation System
        </div>
    </div>
</body>
</html>

