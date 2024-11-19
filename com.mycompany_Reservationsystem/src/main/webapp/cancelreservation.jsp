<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Reservation</title>
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

        .cancel-form-container {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 50%;
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

        .input-field {
            padding: 10px;
            margin-top: 20px;
            width: 100%;
            max-width: 400px;
            margin-bottom: 20px;
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

    <div class="cancel-form-container">
        <h1>Cancel Your Reservation</h1>
        
        <!-- Display message based on the cancellation result -->
        <p><strong>${message}</strong></p>
        
        <form action="ConfirmCancellationServlet" method="post">
            <p>PNR: ${pnrNumber}</p>
            <p>Name: ${name}</p>
            <p>Train Number: ${trainNumber}</p>
            <p>Train Name: ${trainName}</p>
            <p>Class Type: ${classType}</p>
            <p>Journey Date: ${journeyDate}</p>
            <p>From: ${fromLocation}</p>
            <p>To: ${destination}</p>
            
            <input type="hidden" name="pnrNumber" value="${pnrNumber}">
            
            <button type="submit">Confirm Cancellation</button>
        </form>
    </div>

</body>
</html>
