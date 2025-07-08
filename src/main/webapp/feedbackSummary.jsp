<%@ page language="java" import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<html>
<head>
    <title>Feedback Summary | AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background: url('images/feedback-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            flex-direction: column;
        }

        .summary-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
            background: rgba(0, 0, 0, 0.85);
            margin: auto;
            border-radius: 10px;
            max-width: 800px;
            width: 90%;
            box-shadow: 0 0 20px rgba(0,0,0,0.6);
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
            padding: 15px 0;
            margin-top: 60px;
            border-top: 2px solid #dc3545;
        }
    </style>
</head>
<body>

<%

    List<Integer> ratings = new ArrayList<>();
    try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\ASUS\\Desktop\\ProjectFile/feedback.txt"))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",", 4);
            if (parts.length >= 3) {
                try {
                    ratings.add(Integer.parseInt(parts[2]));
                } catch (NumberFormatException ignored) {}
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
    }

    int totalFeedback = ratings.size();
    double averageRating = ratings.stream().mapToInt(r -> r).average().orElse(0.0);
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="home.jsp"><i class="fas fa-car"></i> AutoPulse</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="customer_dashboard.jsp">Back</a></li>
                <li class="nav-item"><a class="nav-link" href="viewPublicFeedback.jsp">View Feedback</a></li>
                <li class="nav-item"><a class="nav-link active" href="feedbackSummary.jsp">Feedback Summary</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Summary Content -->
<div class="container summary-container">
    <h2 class="text-center"><i class="fas fa-chart-bar"></i> Feedback Summary</h2>
    <div class="text-center mt-4">
        <h4>Total Feedback Submissions: <span class="text-warning"><%= totalFeedback %></span></h4>
        <h4>Average Rating: <span class="text-success"><%= String.format("%.2f", averageRating) %> / 5</span></h4>
    </div>

    <div class="mt-4">
        <canvas id="ratingChart" height="120"></canvas>
    </div>

    <div class="text-center mt-4">
        <a href="customer_dashboard.jsp" class="btn btn-outline-light"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <div>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</div>
</footer>

<!-- Chart.js Script -->
<script>
    const ratingCounts = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
    <% for (int r : ratings) { %>
    ratingCounts[<%= r %>] = (ratingCounts[<%= r %>] || 0) + 1;
    <% } %>

    const ctx = document.getElementById('ratingChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['1★', '2★', '3★', '4★', '5★'],
            datasets: [{
                label: 'Rating Count',
                data: [ratingCounts[1], ratingCounts[2], ratingCounts[3], ratingCounts[4], ratingCounts[5]],
                backgroundColor: '#ffc107'
            }]
        },
        options: {
            plugins: { legend: { display: false } },
            scales: { y: { beginAtZero: true, ticks: { precision: 0 } } }
        }
    });
</script>

</body>
</html>
