<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            color: white;
        }

        .dashboard-section {
            position: relative;
            background: url('images/admin_dashboard.jpg') no-repeat center center;
            background-size: cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .dashboard-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .dashboard-content {
            position: relative;
            z-index: 2;
            text-align: center;
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

        .dashboard-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
    }
    User user = (User) session.getAttribute("currentUser");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">AutoPulse</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Dashboard Content -->
<section class="dashboard-section">
    <div class="container dashboard-content">
        <h1 class="mb-5 fw-bold text-white">Welcome, <%= user.getFullName() %>!</h1>
        <div class="row g-4 justify-content-center">
            <div class="col-md-3">
                <a href="viewAppointments.jsp" class="dashboard-option">
                    <div class="dashboard-icon">✅</div>
                    <h5>Appointment Accepting</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="invoice_details.jsp" class="dashboard-option">
                    <div class="dashboard-icon">🧾</div>
                    <h5>Invoice Accepting</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="viewFeedback.jsp" class="dashboard-option">
                    <div class="dashboard-icon">🧾</div>
                    <h5>FeedBack view</h5>
                </a>
            </div>
            <div class="col-md-3">
                <a href="staff_management.jsp" class="dashboard-option">
                    <div class="dashboard-icon">👥</div>
                    <h5>Staff Management</h5>
                </a>
            </div>

            <div class="col-md-3">
                <a href="customer_list.jsp" class="dashboard-option">
                    <div class="dashboard-icon">👥</div>
                    <h5>Customer Management</h5>
                </a>
            </div>
        </div>
    </div>
</section>




<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>