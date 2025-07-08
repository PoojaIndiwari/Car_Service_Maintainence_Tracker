<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Add Vehicle – AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-red: #ff0000;
            --dark-bg: #000000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: var(--white);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: var(--dark-bg) url('https://quickcarvaluation.com/wp-content/uploads/2018/02/Vehicle-Repair-Centers.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
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
            transition: all 0.3s;
            position: relative;
            padding: 0.5rem 1rem !important;
            margin: 0 0.25rem !important;
        }

        .nav-link:hover {
            color: var(--primary-red) !important;
        }

        .nav-link.active {
            color: var(--primary-red) !important;
            font-weight: 600;
        }

        .nav-btn {
            border-radius: 30px;
            padding: 0.5rem 1.5rem !important;
            margin: 0 0.5rem !important;
            transition: all 0.3s ease;
        }

        .nav-btn.add-btn {
            background-color: var(--primary-red);
            color: white !important;
        }

        .nav-btn.view-btn {
            border: 2px solid var(--primary-red);
            color: var(--primary-red) !important;
        }

        .nav-btn.add-btn:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .nav-btn.view-btn:hover {
            background-color: var(--primary-red);
            color: white !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .form-box {
            max-width: 600px;
            margin: 2rem auto;
            background-color: rgba(26, 26, 26, 0.9);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            border-top: 4px solid var(--primary-red);
            color: var(--white);
        }

        .form-label {
            font-weight: 600;
            color: var(--light-gray);
        }

        .form-label.required-field::after {
            content: " *";
            color: var(--primary-red);
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--white);
            padding: 0.75rem;
        }

        .form-control:focus, .form-select:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: var(--primary-red);
            color: var(--white);
            box-shadow: 0 0 0 0.25rem rgba(255, 0, 0, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-red) !important;
            border: none;
            color: var(--white);
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary:hover {
            background-color: #cc0000 !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        .btn-secondary {
            background-color: transparent !important;
            border: 2px solid var(--primary-red) !important;
            color: var(--primary-red) !important;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-secondary:hover {
            background-color: var(--primary-red) !important;
            color: var(--white) !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
        }

        h2 {
            color: var(--white);
            font-weight: 700;
            text-align: center;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        footer {
            background-color: var(--card-bg);
            color: var(--white);
            padding: 1.5rem 0;
            text-align: center;
            border-top: 3px solid var(--primary-red);
            margin-top: auto;
        }

        .copyright {
            margin: 0;
            font-size: 0.9rem;
            color: var(--light-gray);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
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
                    <a class="nav-link nav-btn add-btn active" href="addVehicle.jsp">
                        <i class="fas fa-plus me-1"></i>Add Vehicle
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-btn view-btn" href="VehicleServlet">
                        <i class="fas fa-list me-1"></i>View Vehicles
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <h2>Add New Vehicle</h2>
    <div class="form-box">
        <form action="VehicleServlet" method="post">
            <input type="hidden" name="action" value="add"/>
            <div class="mb-3">
                <label class="form-label">Registration Number</label>
                <input type="text" name="registrationNumber" class="form-control" placeholder="Optional"/>
            </div>
            <div class="mb-3">
                <label class="form-label required-field">Number Plate</label>
                <input type="text" name="numberPlate" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label class="form-label required-field">Vehicle Type</label>
                <input type="text" name="vehicleType" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label class="form-label required-field">Owner</label>
                <input type="text" name="owner" class="form-control" required/>
            </div>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label class="form-label required-field">Mileage</label>
                    <input type="number" name="mileage" class="form-control" required/>
                </div>
                <div class="col-md-4 mb-3">
                    <label class="form-label required-field">Model</label>
                    <input type="text" name="model" class="form-control" required/>
                </div>
                <div class="col-md-4 mb-3">
                    <label class="form-label required-field">Year</label>
                    <input type="number" name="year" class="form-control" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label required-field">Appointment Type</label>
                    <select name="appointment" class="form-select" required>
                        <option value="">Select Type</option>
                        <option>Appointment</option>
                        <option>Direct</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label required-field">Service Type</label>
                    <input type="text" name="serviceType" class="form-control"
                           placeholder="e.g. Full Service" required/>
                </div>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus me-1"></i> Add Vehicle
                </button>
                <a href="vehicleManagement.jsp" class="btn btn-secondary">
                    <i class="fas fa-home me-1"></i> Back to Home
                </a>
            </div>
        </form>
    </div>
</div>

<footer>
    <div class="container">
        <p class="copyright">© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
