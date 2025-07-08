<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.Appointments" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AutoPulse | My Appointments</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-red: #a00815;
            --dark-bg: #121212;
            --glass-bg: rgba(40, 40, 40, 0.6);
            --card-bg: rgba(30, 30, 30, 0.85);
            --text-light: #f8f9fa;
            --text-muted: #adb5bd;
            --accent-gold: #5a0921;
        }
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Montserrat', sans-serif;
            background:
                    linear-gradient(rgba(0,0,0,0.85), rgba(0,0,0,0.9)),
                    url('https://www.certifiedmastertech.com/wp-content/uploads/2019/02/9e05cab5bad8e5b48e587d7e6ddf4c71-1024x682.jpeg') no-repeat center center fixed;
            background-size: cover;
            color: var(--text-light);
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background: rgba(20,20,20,0.95) !important;
            border-bottom: 2px solid var(--primary-red);
            backdrop-filter: blur(10px);
        }
        .navbar-brand {
            font-weight: 700;
            letter-spacing: 1px;
            font-size: 1.5rem;
            background: linear-gradient(to right, var(--primary-red), var(--accent-gold));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transition: transform 0.3s;
        }
        .navbar-brand:hover { transform: scale(1.02); }
        .nav-link {
            margin: 0 0.75rem;
            font-weight: 500;
            color: var(--text-light) !important;
            position: relative;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0; height: 2px;
            bottom: -2px; left: 0;
            background: var(--primary-red);
            transition: width 0.3s;
        }
        .nav-link:hover, .nav-link.active {
            color: var(--primary-red) !important;
        }
        .nav-link:hover::after, .nav-link.active::after {
            width: 100%;
        }
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }
        .hero-box {
            background: var(--glass-bg);
            border-radius: 15px;
            padding: 2rem;
            max-width: 1000px;
            width: 100%;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .hero-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
            background: linear-gradient(to right, var(--text-light), var(--accent-gold));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        th, td {
            padding: 0.75rem;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            color: var(--text-light);
        }
        th {
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.05em;
            color: var(--accent-gold);
        }
        tr:hover {
            background: rgba(255,255,255,0.05);
        }
        .badge-status {
            padding: 0.4em 0.75em;
            font-size: 0.9rem;
            border-radius: 0.25rem;
            text-transform: uppercase;
        }
        .badge-pending { background: var(--accent-gold); color: var(--dark-bg); }
        .badge-approved { background: #28a745; color: #fff; }
        .btn-outline-light {
            border: 1px solid var(--text-light);
            color: var(--text-light);
        }
        .btn-outline-light:hover {
            background: var(--text-light);
            color: var(--dark-bg);
        }
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-red), var(--dark-red));
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(221,11,29,0.4);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(221,11,29,0.6);
        }
        .form-container {
            background: var(--card-bg);
            border-radius: 1rem;
            padding: 2.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
        }
        .section-title {
            color: var(--primary-red);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .form-control, .form-select {
            background: rgba(40,40,40,0.8);
            border: 1px solid rgba(255,255,255,0.1);
            color: var(--text-light);
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-red);
            box-shadow: 0 0 0 .25rem rgba(221,11,29,0.25);
            background: rgba(50,50,50,0.9);
        }
        footer {
            background: rgba(20,20,20,0.95);
            padding: 1rem 0;
            text-align: center;
        }
        footer p {
            margin: 0;
            color: var(--text-muted);
            font-size: 0.9rem;
        }
    </style>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="appointmentmanagement.jsp">
            <i class="bi bi-car-front me-2"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="navMenu" class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addAppointment.jsp">Book Appointment</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="AppointmentServlet">My Appointments</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main>
    <div class="hero-box">

        <!-- Inline edit form -->
        <c:if test="${not empty appointment}">
            <div class="form-container animate__animated animate__fadeIn mb-5">
                <h3 class="section-title">
                    <i class="bi bi-pencil-square me-2"></i>Edit Appointment
                </h3>
                <form method="post" action="AppointmentServlet">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="id" value="${appointment.id}"/>
                    <div class="mb-3">
                        <label class="form-label">Customer ID</label>
                        <input type="text" name="customerId" value="${appointment.customerId}" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Vehicle Type</label>
                        <input type="text" name="vehicleType" value="${appointment.vehicleType}" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Service Type</label>
                        <select name="serviceType" class="form-select" required>
                            <option${appointment.serviceType=='Oil Change'?' selected':''}>Oil Change</option>
                            <option${appointment.serviceType=='Tire Rotation'?' selected':''}>Tire Rotation</option>
                            <option${appointment.serviceType=='Brake Inspection'?' selected':''}>Brake Inspection</option>
                        </select>
                    </div>
                    <div class="row g-3 mb-4">
                        <div class="col">
                            <label class="form-label">Date</label>
                            <input type="date" name="date" value="${appointment.date}" class="form-control" required/>
                        </div>
                        <div class="col">
                            <label class="form-label">Time</label>
                            <input type="time" name="time" value="${appointment.time}" class="form-control" required/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="bi bi-save me-2"></i>Update Appointment
                    </button>
                </form>
            </div>
        </c:if>

        <!-- Appointment table -->
        <h1 class="hero-title"><i class="bi bi-calendar-check me-2"></i>My Appointments</h1>
        <table>
            <thead>
            <tr>
                <th>Vehicle</th><th>Service</th><th>Date</th><th>Time</th><th>Status</th><th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty appointments}">
                    <tr>
                        <td colspan="6" class="text-center py-4">No appointments found.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="a" items="${appointments}">
                        <tr>
                            <td>${a.vehicleType}</td>
                            <td>${a.serviceType}</td>
                            <td>${a.date}</td>
                            <td>${a.time}</td>
                            <td>
                                <span class="badge-status ${a.approved ? 'badge-approved' : 'badge-pending'}">
                                        ${a.approved ? 'Approved' : 'Pending'}
                                </span>
                            </td>
                            <td>
                                <c:if test="${!a.approved}">
                                    <a href="AppointmentServlet?action=edit&id=${a.id}" class="btn btn-outline-light btn-sm me-1">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </a>
                                    <form method="post" action="AppointmentServlet" style="display:inline">
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="id" value="${a.id}"/>
                                        <button class="btn btn-outline-light btn-sm">
                                            <i class="bi bi-trash"></i> Cancel
                                        </button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="appointmentmanagement.jsp" class="btn btn-outline-light me-2">
                <i class="bi bi-arrow-left"></i> Back to Home
            </a>
            <a href="addAppointment.jsp" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Create New
            </a>
        </div>
    </div>
</main>

<!-- Footer -->
<footer>
    <p>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
