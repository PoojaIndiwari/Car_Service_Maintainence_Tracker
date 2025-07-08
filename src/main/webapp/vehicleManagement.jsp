<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.VehicleManager,
                 lk.sliit.carservicemanagementgp99.projectname.Vehicle" %>
<%
    String plate = request.getParameter("numberPlate");
    VehicleManager mgr = new VehicleManager();
    Vehicle v = mgr.getVehicle(plate);
    if (v == null) {
        response.sendRedirect("VehicleServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle – AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg: #000;
            --card-bg: #1a1a1a;
            --white: #ffffff;
            --light-gray: #e6e6e6;
        }

        /* ensure full-height flex layout */
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            color: var(--white);
            background: var(--dark-bg)
            url('https://quickcarvaluation.com/wp-content/uploads/2018/02/Vehicle-Repair-Centers.jpg')
            no-repeat center center fixed;
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
        .nav-btn {
            border-radius: 30px;
            padding: .5rem 1.5rem !important;
            margin: 0 .5rem !important;
            transition: all .3s ease;
        }
        .add-btn {
            background-color: var(--primary-red);
            color: var(--white) !important;
        }
        .view-btn {
            border: 2px solid var(--primary-red);
            color: var(--primary-red) !important;
        }
        .add-btn:hover,
        .view-btn:hover {
            background-color: #cc0000;
            color: var(--white) !important;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }

        .main-content {
            flex: 1 0 auto;
            padding: 2rem 0;
        }
        .form-box {
            max-width: 700px;
            margin: auto;
            background: rgba(26,26,26,0.9);
            padding: 2rem;
            border-radius: 10px;
            border-top: 4px solid var(--primary-red);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }
        .form-label {
            color: var(--light-gray);
            font-weight: 500;
        }
        .form-label.required-field::after {
            content: " *";
            color: var(--primary-red);
        }
        .form-control, .form-select {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: var(--white);
            padding: .75rem;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(255,255,255,0.2);
            border-color: var(--primary-red);
            box-shadow: 0 0 0 .25rem rgba(255,0,0,0.25);
            color: var(--white);
        }
        .btn-red {
            background-color: var(--primary-red);
            color: var(--white);
            border: none;
            font-weight: 600;
            padding: .75rem 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all .3s;
        }
        .btn-red:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }
        .btn-outline-red {
            background: transparent;
            color: var(--primary-red);
            border: 2px solid var(--primary-red);
            font-weight: 600;
            padding: .75rem 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all .3s;
        }
        .btn-outline-red:hover {
            background-color: var(--primary-red);
            color: var(--white);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,0,0,0.4);
        }

        footer {
            background: var(--card-bg);
            color: var(--white);
            text-align: center;
            padding: 1.5rem 0;
            border-top: 3px solid var(--primary-red);
            margin-top: auto;
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
                    <a class="nav-link nav-btn add-btn" href="addVehicle.jsp">
                        <i class="fas fa-plus me-1"></i>Add Vehicle
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-btn view-btn active" href="VehicleServlet">
                        <i class="fas fa-list me-1"></i>View Vehicles
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="container">
        <div class="form-box">
            <h2 class="text-center mb-4">Edit Vehicle</h2>
            <form action="VehicleServlet" method="post">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="originalNumberPlate" value="<%= v.getNumberPlate() %>"/>

                <div class="mb-3">
                    <label class="form-label">Registration Number</label>
                    <input type="text" name="registrationNumber" class="form-control"
                           value="<%= v.getRegistrationNumber() %>" placeholder="Optional"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Number Plate</label>
                    <input type="text" name="numberPlate" class="form-control" required
                           value="<%= v.getNumberPlate() %>"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Vehicle Type</label>
                    <input type="text" name="vehicleType" class="form-control" required
                           value="<%= v.getVehicleType() %>"/>
                </div>
                <div class="mb-3">
                    <label class="form-label required-field">Owner</label>
                    <input type="text" name="owner" class="form-control" required
                           value="<%= v.getOwner() %>"/>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Mileage</label>
                        <input type="number" name="mileage" class="form-control" required
                               value="<%= v.getMileage() %>"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Model</label>
                        <input type="text" name="model" class="form-control" required
                               value="<%= v.getModel() %>"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label required-field">Year</label>
                        <input type="number" name="year" class="form-control" required
                               value="<%= v.getYear() %>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label required-field">Appointment Type</label>
                        <select name="appointment" class="form-select" required>
                            <option value="Appointment" <%= "Appointment".equals(v.getAppointment()) ? "selected" : "" %>>
                                Appointment
                            </option>
                            <option value="Direct" <%= "Direct".equals(v.getAppointment()) ? "selected" : "" %>>
                                Direct
                            </option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label required-field">Service Type</label>
                        <input type="text" name="serviceType" class="form-control" required
                               value="<%= v.getServiceType() %>"/>
                    </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                    <button type="submit" class="btn btn-red">
                        <i class="fas fa-save me-1"></i> Save Changes
                    </button>
                    <a href="VehicleServlet" class="btn btn-outline-red">
                        <i class="fas fa-list me-1"></i> Back to List
                    </a>
                </div>
            </form>
        </div>
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
