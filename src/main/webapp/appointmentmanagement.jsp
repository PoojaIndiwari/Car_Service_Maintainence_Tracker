<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AutoPulse | Appointment System</title>

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

        /* Hero */
        .hero-box {
            background: rgba(30,30,30,0.85);
            border-radius: 1rem;
            padding: 3rem;
            text-align: center;
            max-width: 700px;
            margin: 4rem auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }
        .hero-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--white);
            margin-bottom: 1rem;
            text-transform: uppercase;
        }
        .hero-subtitle {
            color: var(--light-gray);
            margin-bottom: 2rem;
        }
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-red), var(--dark-red));
            border: none;
            border-radius: 50px;
            padding: 0.75rem 2rem;
            margin: 0 0.5rem;
            font-weight: 600;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(255,0,0,0.4);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255,0,0,0.6);
        }
        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary-red);
            color: var(--primary-red);
            border-radius: 50px;
            padding: 0.75rem 2rem;
            margin: 0 0.5rem;
            font-weight: 600;
            text-transform: uppercase;
            transition: background 0.3s, color 0.3s, transform 0.3s;
        }
        .btn-outline:hover {
            background: var(--primary-red);
            color: var(--white);
            transform: translateY(-3px);
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
        .footer-text {
            color: var(--light-gray);
            line-height: 1.5;
            margin-bottom: 1rem;
        }
        .footer-heading {
            font-weight: 600;
            color: var(--white);
            margin-bottom: .75rem;
            position: relative;
            padding-bottom: .3rem;
        }
        .footer-heading::after {
            content: '';
            position: absolute;
            bottom: 0; left: 0;
            width: 40px; height: 2px;
            background: var(--primary-red);
        }
        .footer-list,
        .footer-contact { list-style: none; padding: 0; margin: 0; }
        .footer-list li a,
        .footer-contact li {
            color: var(--light-gray);
            text-decoration: none;
            display: flex;
            align-items: center;
            margin-bottom: .5rem;
            transition: color 0.3s;
        }
        .footer-list li a i,
        .footer-contact li i { color: var(--primary-red); margin-right:.5rem; }
        .footer-bottom {
            color: var(--light-gray);
            font-size: .75rem;
            padding-top: 1rem;
            margin-top: 1.5rem;
            border-top: 1px solid rgba(255,255,255,0.1);
            text-align: center;
        }
    </style>
</head>
<body>
<!-- Header / Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fas fa-car me-2"></i>AutoPulse</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="nav" class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addAppointment.jsp">
                        <i class="fas fa-calendar-plus me-1"></i>Book Appointment
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="AppointmentServlet">
                        <i class="fas fa-list-check me-1"></i>Manage Appointments
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero / Main Content -->
<main class="d-flex align-items-center" style="min-height:80vh;">
    <div class="hero-box animate__animated animate__fadeIn">
        <h1 class="hero-title">Appointment System</h1>
        <p class="hero-subtitle">Schedule and manage your appointments seamlessly</p>
        <div class="d-flex justify-content-center flex-wrap">
            <a href="addAppointment.jsp" class="btn btn-primary animate__animated animate__pulse">
                <i class="fas fa-calendar-plus me-2"></i>Book Appointment
            </a>
            <a href="AppointmentServlet" class="btn btn-outline">
                <i class="fas fa-list-check me-2"></i>View Appointments
            </a>
        </div>
    </div>
</main>

<!-- Footer -->
<footer class="footer-section">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <h3 class="footer-title"><i class="fas fa-car"></i> AutoCare Pro</h3>
                <p class="footer-text">
                    Comprehensive appointment management for your vehicle services.
                </p>
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
                    <li><i class="fas fa-envelope"></i><span>support@autocarepro.com</span></li>
                    <li><i class="fas fa-phone"></i><span>011-1122467</span></li>
                    <li><i class="fas fa-clock"></i><span>24/7 Monitoring</span></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">&copy; 2025 AutoPulse. All rights reserved.Designed by PGNO 99</div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
