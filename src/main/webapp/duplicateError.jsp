<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg: #000;
            --card-bg: #1a1a1a;
            --white: #fff;
            --light-gray: #e6e6e6;
        }
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
            background: var(--dark-bg) url('https://quickcarvaluation.com/wp-content/uploads/2018/02/Vehicle-Repair-Centers.jpg') no-repeat center center fixed;
            background-size: cover;
            color: var(--white);
            position: relative;
            font-family: Arial, sans-serif;
        }
        body::before {
            content: '';
            position: absolute; top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.7);
            z-index: -1;
        }
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
            padding: .5rem 1rem !important;
            margin: 0 .25rem !important;
            transition: all .3s;
        }
        .nav-link:hover,
        .nav-link.active {
            color: var(--primary-red) !important;
        }
        .error-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 2rem;
        }
        .error-card {
            background: rgba(26,26,26,0.9);
            padding: 3rem;
            max-width: 600px;
            border-radius: 10px;
            border-top: 4px solid var(--primary-red);
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }
        .error-icon {
            font-size: 4rem;
            color: var(--primary-red);
            margin-bottom: 1.5rem;
        }
        .error-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-transform: uppercase;
        }
        .error-subtitle {
            font-size: 1.25rem;
            color: var(--light-gray);
            margin-bottom: 2rem;
        }
        .plate-display {
            background-color: rgba(221, 11, 29, 0.1);
            border-left: 3px solid var(--primary-red);
            padding: .75rem 1.5rem;
            border-radius: 5px;
            font-family: monospace;
            font-size: 1.5rem;
            display: inline-block;
            margin: 1rem 0;
        }
        .btn-red {
            background-color: var(--primary-red);
            border: none;
            color: #fff;
            padding: .75rem 2rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all .3s;
            margin-top: 1rem;
        }
        .btn-red:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }
        footer {
            background: var(--card-bg);
            color: #fff;
            text-align: center;
            padding: 1.5rem 0;
            border-top: 3px solid var(--primary-red);
        }
        .copyright {
            font-size: .9rem;
            color: var(--light-gray);
            margin: 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="vehicleManagement.jsp">
            <i class="fas fa-car me-2"></i>AutoPulse
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="vehicleManagement.jsp">
                        <i class="fas fa-home me-1"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="addVehicle.jsp">
                        <i class="fas fa-plus me-1"></i>Add Vehicle
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VehicleServlet">
                        <i class="fas fa-list me-1"></i>View Vehicles
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="error-container">
    <div class="error-card">
        <div class="error-icon"><i class="fas fa-exclamation-triangle"></i></div>
        <h1 class="error-title">Duplicate Vehicle</h1>
        <p class="error-subtitle">The following license plate is already registered in our system:</p>

        <div class="plate-display">
            <i class="fas fa-car me-2"></i>${param.plate}
        </div>

        <p>Please verify the plate number or contact support if you believe this is an error.</p>

        <a href="addVehicle.jsp" class="btn btn-red">
            <i class="fas fa-arrow-left me-1"></i> Back to Form
        </a>
    </div>
</div>

<footer>
    <div class="container">
        <p class="copyright">
            © 2025 AutoPulse. All rights reserved. Designed by PGNO 99
        </p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
