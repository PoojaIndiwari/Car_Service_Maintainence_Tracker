<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Service" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Service Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    :root {
      --primary-red: #e63900;
      --light-gray: #ccc;
      --white: #ffffff;
      --card-bg: #212529;
    }

    .navbar {
      background-color: var(--card-bg) !important;
      border-bottom: 3px solid var(--primary-red);
      position: relative;
      z-index: 1;
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
    }

    .nav-link:hover {
      color: var(--primary-red) !important;
    }

    .nav-link.active {
      color: var(--primary-red) !important;
      font-weight: 600;
    }

    body {
      background: url('images/19613.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      margin: 0;
    }

    .page-overlay {
      background-color: rgba(0, 0, 0, 0.6);
      padding: 40px;
      border-radius: 15px;
      margin-top: 30px;
    }

    .btn-orange-red {
      background-color: var(--primary-red);
      color: white;
      border: none;
    }

    .btn-orange-red:hover {
      background-color: #cc3300;
      color: white;
    }

    .table-dark {
      background-color: rgba(33, 37, 41, 0.9);
    }

    .text-black {
      color: #000 !important;
    }

    .card {
      background-color: rgba(255, 255, 255, 0.9);
    }

    .card-header {
      background-color: var(--card-bg);
      color: white;
      font-weight: bold;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp">Auto Pulse</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="service?view=tracker">Service Tracker</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container page-overlay">
  <div class="card mb-4">
    <div class="card-header">Add Service Record</div>
    <div class="card-body">
      <form method="post" action="service">
        <input type="hidden" name="action" value="addService"/>
        <div class="mb-3">
          <label class="text-black">Service Type</label>
          <select name="serviceType" class="form-control" required>
            <option value="Regular">Regular</option>
            <option value="MajorRepair">Major Repair</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="text-black">Specific Service</label>
          <select name="specificServiceType" class="form-control" required>
            <option value="Oil Change">Oil Change</option>
            <option value="Engine Repair">Engine Repair</option>
            <option value="Battery Service">Battery Service</option>
            <option value="Tire Services">Tire Services</option>
            <option value="Detailing">Detailing</option>
            <option value="Electrical Systems">Electrical Systems</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="text-black">Customer Name</label>
          <input type="text" name="customerName" class="form-control" required/>
        </div>

        <div class="mb-3">
          <label class="text-black">Vehicle Number Plate</label>
          <input type="text" name="numberPlate" class="form-control" required/>
        </div>

        <div class="mb-3">
          <label class="text-black">Date</label>
          <input type="date" name="date" class="form-control" required/>
        </div>

        <div class="mb-3">
          <label class="text-black">Cost</label>
          <input type="number" name="cost" class="form-control" step="0.01" required/>
        </div>

        <div class="mb-3">
          <label class="text-black">Status</label>
          <select name="status" class="form-control" required>
            <option value="Sent">Sent to Service</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
          </select>
        </div>

        <button type="submit" class="btn btn-orange-red">Add Service</button>
      </form>
    </div>
  </div>

  <%
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    if (message != null) {
  %>
  <div class="alert alert-success"><%= message %></div>
  <% } else if (error != null) { %>
  <div class="alert alert-danger"><%= error %></div>
  <% } %>

  <div class="d-flex justify-content-between align-items-center mb-2">
    <h4 class="text-white">Service Records</h4>
    <form method="get" action="service">
      <input type="hidden" name="view" value="services"/>
      <button class="btn btn-outline-light">View All Services</button>
    </form>
  </div>

  <%
    List<Service> services = (List<Service>) request.getAttribute("services");

    if (services != null && !services.isEmpty()) {
  %>
  <table class="table table-dark table-striped table-bordered">
    <thead>
    <tr>
      <th>Service ID</th>
      <th>Customer</th>
      <th>Number Plate</th>
      <th>Type</th>
      <th>Specific</th>
      <th>Date</th>
      <th>Cost</th>
      <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Service s : services) {
        String statusClass = switch (s.getStatus()) {
          case "Sent" -> "badge bg-warning text-dark";
          case "In Progress" -> "badge bg-info text-dark";
          case "Completed" -> "badge bg-success";
          default -> "badge bg-secondary";
        };
    %>
    <tr>
      <td><%= s.getServiceId() %></td>
      <td><%= s.getCustomerName() %></td>
      <td><%= s.getNumberPlate() %></td>
      <td><%= s.getServiceType() %></td>
      <td><%= s.getSpecificServiceType() %></td>
      <td><%= s.getFormattedDate() %></td>
      <td><%= s.getCost() %></td>
      <td><span class="<%= statusClass %>"><%= s.getStatus() %></span></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
  } else {
  %>
  <p class="text-white">No service records found.</p>
  <%
    }
  %>
</div>

<jsp:include page="serviceFooter.jsp" />

</body>
</html>

