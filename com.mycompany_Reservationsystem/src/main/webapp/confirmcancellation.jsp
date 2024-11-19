<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancellation Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('train.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .confirmation-container {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 60%;
        }

        h1 {
            color: #dc3545;
            font-size: 32px;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        .message {
            font-size: 18px;
            color: green;
            margin-top: 20px;
        }

        .back-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #218838;
        }

        button {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="confirmation-container">
        <h1>Reservation Cancelled</h1>
        
        <!-- Show the success message -->
        <c:if test="${not empty cancellationMessage}">
            <p class="message">${cancellationMessage}</p>
        </c:if>

        <!-- Button to go back to reservation form -->
        <a href="reservationform.jsp" class="back-button">Back to Reservation Form</a>

    </div>

</body>
</html>
