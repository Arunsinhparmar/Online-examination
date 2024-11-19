<%-- 
    Document   : register
    Created on : 12-Nov-2024, 8:51:40 pm
    Author     : Aniketsinh Darbar
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome  to Reservation System</title>
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
    <h2>Welcome to Reservation System</h2>
    <form action="RegisterServlet" method="post">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
        </div>

        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>

        <div class="input-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>
        </div>

        <div class="input-group">
            <button type="submit">Register</button>
        </div>
    </form>
</div>

</body>
</html>
