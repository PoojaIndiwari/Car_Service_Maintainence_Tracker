<%@ page contentType="text/html; charset=UTF-8" language="java"
         import="lk.sliit.carservicemanagementgp99.projectname.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

    if (session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("currentUser");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
          rel="stylesheet">
    <style>
        body, html { margin:0; padding:0; height:100%; color:#fff; }
        .dashboard-section {
            position:relative;
            background:url('images/car-repair.jpg') center/cover no-repeat;
            height:100vh; display:flex; align-items:center; justify-content:center;
        }
        .dashboard-section::before {
            content:""; position:absolute; inset:0; background:rgba(0,0,0,0.6);
        }
        .dashboard-content {
            position:relative; z-index:2;
            width:100%; max-width:1200px; text-align:center;
        }
        .dashboard-option {
            display: block;
            background-color: rgba(0, 0, 0, 0.75);
            border-radius: 15px;
            padding: 30px 20px;
            box-shadow: 0 0 15px white;
            transition: transform 0.3s ease;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }

        .dashboard-option:hover {
            transform: scale(1.05);
            color: white;
            text-decoration: none;
        }
        .dashboard-icon { font-size:40px; margin-bottom:10px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">AutoPulse</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="dashboard-section">
    <div class="dashboard-content container">
        <h1 class="mb-5">Welcome, <%= user.getFullName() %>!</h1>

        <div class="row g-4 justify-content-center mb-5">
            <div class="col-md-3">
                <a href="invoice.jsp" class="dashboard-option">
                    <div class="dashboard-icon"><i class="bi bi-receipt"></i></div>
                    <h5>Invoices</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="appointmentmanagement.jsp" class="dashboard-option">
                    <div class="dashboard-icon"><i class="bi bi-calendar-check"></i></div>
                    <h5>Appointments</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="feedback.jsp" class="dashboard-option">
                    <div class="dashboard-icon"><i class="bi bi-chat-dots"></i></div>
                    <h5>Feedback</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="customer_profile.jsp" class="dashboard-option">
                    <div class="dashboard-icon"><i class="bi bi-pencil-square"></i></div>
                    <h5>Update Profile</h5>
                </a>
            </div>
        </div>

        <h2 class="mb-4">My Vehicles</h2>
        <jsp:include page="myVehicles.jsp" />
    </div>
</section>

<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
