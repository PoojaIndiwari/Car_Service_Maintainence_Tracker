<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Feedback | AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/feedback-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .feedback-container {
            background: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 10px;
            margin-top: 50px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 0 20px rgba(0,0,0,0.6);
        }
        .form-control {
            background: rgba(255,255,255,0.1);
            color: white;
        }
        .form-control::placeholder {
            color: #ccc;
        }
        .navbar-custom {
            background-color: #111;
            border-bottom: 3px solid #dc3545;
        }
        .navbar-brand {
            font-weight: bold;
            color: #dc3545 !important;
        }
        .nav-link {
            color: #fff !important;
        }
        .nav-link:hover {
            color: #ffc107 !important;
        }
        footer {
            background-color: #111;
            color: #ccc;
            padding: 20px 0;
            margin-top: 60px;
            border-top: 2px solid #dc3545;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="home.jsp"><i class="fas fa-car"></i> AutoPulse</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="feedbackSummary.jsp">Feedback Summary</a></li>
                <li class="nav-item"><a class="nav-link active" href="viewPublicFeedback.jsp">View Feedbacks</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Feedback Form -->
<div class="container">
    <div class="feedback-container">
        <h3 class="text-center mb-4"><i class="fas fa-comment-dots"></i> Feedback Form</h3>
        <form action="FeedbackServlet" method="POST">
            <div class="mb-3">
                <label><i class="fas fa-user"></i> Name:</label>
                <input type="text" name="name" class="form-control" placeholder="Your name" required>
            </div>
            <div class="mb-3">
                <label><i class="fas fa-envelope"></i> Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Your email" required>
            </div>
            <div class="mb-3">
                <label><i class="fas fa-star"></i> Rating:</label>
                <select class="form-control" name="rating" required>
                    <option value="" disabled selected>Rate our service</option>
                    <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; - Excellent</option>
                    <option value="4">&#9733;&#9733;&#9733;&#9733; - Good</option>
                    <option value="3">&#9733;&#9733;&#9733; - Average</option>
                    <option value="2">&#9733;&#9733; - Poor</option>
                    <option value="1">&#9733; - Very Poor</option>
                </select>
            </div>
            <div class="mb-3">
                <label><i class="fas fa-comment"></i> Comments:</label>
                <textarea name="comments" class="form-control" rows="4" placeholder="Your feedback..." required></textarea>
            </div>
            <button type="submit" class="btn btn-success w-100"><i class="fas fa-paper-plane"></i> Submit Feedback</button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="text-center mt-5">
    <div>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</div>
</footer>

</body>
</html>

