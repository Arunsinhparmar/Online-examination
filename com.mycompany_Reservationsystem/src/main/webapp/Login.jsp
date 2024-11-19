<%-- 
    Document   : Login
    Created on : 12-Nov-2024, 8:23:27 pm
    Author     : Aniketsinh Darbar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation System</title>
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
        .login-container {
            width: 100%;
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            transition: box-shadow 0.3s ease;
            background: #f5f5f5;
        }
        .login-container:hover {
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
        .error {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Reservation system</h2>
    
    <form action="LoginServlet" method="POST">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>

        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <div class="input-group">
            <button type="submit">Login</button>
        </div>
        
        <div class="error">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </div>
    </form>
</div>

</body>
</html>