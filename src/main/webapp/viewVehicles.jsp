<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.VehicleManager,
                 lk.sliit.carservicemanagementgp99.projectname.Vehicle,
                 java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  VehicleManager mgr = new VehicleManager();
  List<Vehicle> vehicles = mgr.getVehicles();
  request.setAttribute("vehicles", vehicles);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AutoPulse – View Vehicles</title>
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
    .content-box {
      background: rgba(26,26,26,0.9);
      border-radius: 10px;
      padding: 2rem;
      box-shadow: 0 10px 20px rgba(0,0,0,0.3);
      border-top: 4px solid var(--primary-red);
    }
    .btn-red {
      background-color: var(--primary-red);
      color: var(--white);
      border: none;
      font-weight: 600;
      padding: .75rem 2rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      margin: 0 10px;
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
      margin: 0 10px;
      transition: all .3s;
    }
    .btn-outline-red:hover {
      background-color: var(--primary-red);
      color: var(--white);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(255,0,0,0.4);
    }
    .badge-plate {
      background: var(--primary-red);
      color: var(--white);
      border-radius: .5rem;
      padding: .35em .65em;
    }
    .badge-app-direct { background: #198754; }
    .badge-app-apt { background: #0dcaf0; }
    table th {
      border-bottom: 2px solid var(--primary-red) !important;
      color: var(--light-gray);
    }
    table td { color: var(--light-gray); }
    .action-btn {
      width: 36px;
      height: 36px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
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
          <a class="nav-link" href="service_staff_dashboard.jsp">
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
    <div class="content-box">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">All Vehicles</h2>
        <div>
          <a href="vehicleManagement.jsp" class="btn btn-outline-red">
            <i class="fas fa-home me-1"></i> Home
          </a>
          <a href="addVehicle.jsp" class="btn btn-red">
            <i class="fas fa-plus me-1"></i> Add Vehicle
          </a>
        </div>
      </div>

      <c:choose>
        <c:when test="${empty vehicles}">
          <div class="alert alert-warning text-center py-4 mb-0">
            <i class="fas fa-car-alt fa-3x mb-3 text-warning"></i>
            <h4>No vehicles found</h4>
            <p class="mb-0">Start by adding your first vehicle</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
              <thead>
              <tr>
                <th>#</th>
                <th>Plate</th>
                <th>Type</th>
                <th>Owner</th>
                <th>Mileage</th>
                <th>Model</th>
                <th>Year</th>
                <th>Appointment</th>
                <th>Service</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="v" items="${vehicles}" varStatus="loop">
                <tr>
                  <td>${loop.index + 1}</td>
                  <td><span class="badge-plate">${v.numberPlate}</span></td>
                  <td>${v.vehicleType}</td>
                  <td>${v.owner}</td>
                  <td>${v.mileage} km</td>
                  <td>${v.model}</td>
                  <td>${v.year}</td>
                  <td>
                    <c:choose>
                      <c:when test="${v.appointment eq 'Direct'}">
                        <span class="badge badge-app-direct">${v.appointment}</span>
                      </c:when>
                      <c:otherwise>
                        <span class="badge badge-app-apt">${v.appointment}</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>${v.serviceType}</td>
                  <td>
                    <a href="VehicleServlet?action=edit&numberPlate=${v.numberPlate}"
                       class="btn btn-warning btn-sm action-btn me-1" title="Edit">
                      <i class="fas fa-edit"></i>
                    </a>
                    <form action="VehicleServlet" method="post" class="d-inline"
                          onsubmit="return confirm('Delete this vehicle?');">
                      <input type="hidden" name="action" value="delete"/>
                      <input type="hidden" name="numberPlate" value="${v.numberPlate}"/>
                      <button class="btn btn-danger btn-sm action-btn" title="Delete">
                        <i class="fas fa-trash-alt"></i>
                      </button>
                    </form>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
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
