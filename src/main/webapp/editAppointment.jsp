<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.Appointments" %>
<%
    // The servlet must have done: req.setAttribute("appointment", theAppointment);
    Appointments appointment = (Appointments) request.getAttribute("appointment");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Appointment | AutoPulse</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-red: #ff0000;
            --dark-bg: #000000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
            --accent-gold: #5a0921;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            color: var(--white);
            background: var(--dark-bg)
            url('https://www.certifiedmastertech.com/wp-content/uploads/2019/02/9e05cab5bad8e5b48e587d7e6ddf4c71-1024x682.jpeg')
            no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            inset: 0;
            background-color: rgba(0,0,0,0.7);
            z-index: -1;
        }

        /* Navbar */
        .navbar {
            background-color: var(--card-bg) !important;
            border-bottom: 3px solid var(--primary-red);
        }
        .navbar-brand {
            font-weight: 700;
            color: var(--white) !important;
            font-size: 1.5rem;
        }
        .nav-link {
            color: var(--light-gray) !important;
            font-weight: 500;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: var(--primary-red) !important;
        }
        .nav-link.active {
            color: var(--primary-red) !important;
            font-weight: 600;
        }

        /* Form Container */
        .form-container {
            background: rgba(30,30,30,0.85);
            border-radius: 1rem;
            padding: 2.5rem;
            margin: 4rem auto;
            max-width: 600px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .section-title {
            color: var(--accent-gold);
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .form-label { color: var(--white); }
        .form-control, .form-select {
            background: rgba(40,40,40,0.8);
            border: 1px solid rgba(255,255,255,0.1);
            color: var(--white);
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-red);
            box-shadow: 0 0 0 .25rem rgba(255,0,0,0.25);
            background: rgba(50,50,50,0.9);
        }
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-red), #a00815);
            border: none;
            border-radius: 50px;
            padding: 0.75rem 2rem;
            width: 100%;
            text-transform: uppercase;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(255,0,0,0.4);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255,0,0,0.6);
        }

        /* Footer */
        .footer-section {
            background-color: var(--card-bg);
            color: var(--white);
            padding: 2rem 0 0.5rem;
            border-top: 3px solid var(--primary-red);
            margin-top: auto;
            font-size: 0.85rem;
        }
        .footer-title {
            font-size: 1.3rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .footer-title i { color: var(--primary-red); margin-right: .5rem; }
        .footer-text { color: var(--light-gray); line-height: 1.5; margin-bottom: 1rem; }
        .footer-heading { font-weight: 600; color: var(--white); margin-bottom: .75rem; position: relative; padding-bottom: .3rem; }
        .footer-heading::after { content: ''; position: absolute; bottom: 0; left: 0; width: 40px; height: 2px; background: var(--primary-red); }
        .footer-list, .footer-contact { list-style: none; padding: 0; margin: 0; }
        .footer-list li a, .footer-contact li { color: var(--light-gray); text-decoration: none; display: flex; align-items: center; margin-bottom: .5rem; transition: color 0.3s; }
        .footer-list li a i, .footer-contact li i { color: var(--primary-red); margin-right:.5rem; }
        .footer-bottom { color: var(--light-gray); font-size: .75rem; padding-top: 1rem; margin-top: 1.5rem; border-top: 1px solid rgba(255,255,255,0.1); text-align: center; }
    </style>
</head>
<body>
<!-- Header / Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="appointmentmanagement.jsp"><i class="fas fa-car me-2"></i>AutoPulse</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="nav" class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="addAppointment.jsp"><i class="fas fa-calendar-plus me-1"></i>Book Appointment</a></li>
                <li class="nav-item"><a class="nav-link active" href="AppointmentServlet"><i class="fas fa-list-check me-1"></i>Manage Appointments</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Edit Form Container -->
<div class="form-container animate__animated animate__fadeIn">
    <h3 class="section-title"><i class="fas fa-pencil-alt me-2"></i>Edit Appointment</h3>
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
        <button type="submit" class="btn btn-primary"><i class="fas fa-save me-2"></i>Update Appointment</button>
    </form>
</div>

<!-- Footer -->
<footer class="footer-section">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <h3 class="footer-title"><i class="fas fa-car"></i> AutoPulse</h3>
                <p class="footer-text">Manage your bookings with ease.</p>
            </div>
            <div class="col-md-4">
                <h4 class="footer-heading"><i class="fas fa-link"></i> Quick Links</h4>
                <ul class="footer-list">
                    <li><a href="AppointmentServlet"><i class="fas fa-chevron-right"></i>Manage Appointments</a></li>
                    <li><a href="addAppointment.jsp"><i class="fas fa-chevron-right"></i>Book Appointment</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h4 class="footer-heading"><i class="fas fa-headset"></i> Support</h4>
                <ul class="footer-contact">
                    <li><i class="fas fa-envelope"></i><span>support@autopulse.com</span></li>
                    <li><i class="fas fa-phone"></i><span>011-1122467</span></li>
                    <li><i class="fas fa-clock"></i><span>24/7 Service</span></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">&copy; 2025 AutoPulse. All rights reserved.Designed by PGNO 99</div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
