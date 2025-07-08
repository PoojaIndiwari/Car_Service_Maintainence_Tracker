<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/car-repair.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }

        .contact-container {
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            border-radius: 15px;
            padding: 40px;
            max-width: 600px;
            margin: 100px auto;
            color: #ffffff;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        h1, h4 {
            color: #dc3545;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>

<div class="contact-container text-center">
    <h1 class="text-danger">Contact Us</h1>
    <p class="lead">We would love to hear from you!</p>

    <div class="mt-4">
        <h4 class="text-danger">Phone</h4>
        <p>+1 1234 56 780</p>

        <h4 class="text-danger">Email</h4>
        <p>info@carshine.com</p>

        <h4 class="text-danger">Address</h4>
        <p>1234 West Park, NY 12345, United States</p>
    </div>

    <a href="home.jsp" class="btn btn-danger mt-4">Back to Home</a>
</div>

<footer>
    <p>&copy; 2025 CarShine. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
