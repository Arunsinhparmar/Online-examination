<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Confirmation</title>
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
        }

        h1 {
            color: #28a745;
            font-size: 32px;
            margin-bottom: 10px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #218838;
        }

        .cancel-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .cancel-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="confirmation-container">
        <h1>Reservation Confirmed!</h1>
        <p>Thank you for booking with us. Your reservation has been successfully processed.</p>
        <p>Your PNR: ${pnrNumber}</p>
        
        <a href="reservationform.jsp">Make Another Reservation</a>
        
        <!-- Cancel reservation button -->
        <form action="CancelReservationServlet" method="post">
            <input type="hidden" name="pnrNumber" value="${pnrNumber}">
            <button type="submit" class="cancel-button">Cancel Reservation</button>
        </form>
    </div>

</body>
</html>
