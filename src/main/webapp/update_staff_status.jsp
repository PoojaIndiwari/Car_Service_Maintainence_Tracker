<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.StaffManager, lk.sliit.carservicemanagementgp99.projectname.Staff, java.util.List" %>
<%
  String success = request.getParameter("success");
  String error = request.getParameter("error");
  StaffManager manager = new StaffManager();
  List<Staff> staffList = manager.getAllStaff();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Staff – AutoPulse</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    :root {
      --primary-red: #dd0b1d;
      --dark-bg: #121212;
      --card-bg: #2e2d2d;
      --white: #ffffff;
      --light-gray: #e6e6e6;
      --form-bg: rgba(26, 26, 26, 0.9);
    }

    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      background: url('images/car3.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      position: relative;
      display: flex;
      flex-direction: column;
      color: var(--white);
    }

    .overlay {
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 0;
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

    .update-container {
      position: relative;
      z-index: 1;
      background: var(--form-bg);
      max-width: 1200px;
      margin: 2rem auto;
      padding: 2rem;
      border-radius: 10px;
      border-top: 4px solid var(--primary-red);
      box-shadow: 0 10px 20px rgba(0,0,0,0.4);
    }

    .table-dark {
      --bs-table-bg: var(--card-bg);
      --bs-table-striped-bg: #383838;
      --bs-table-hover-bg: #444444;
    }

    .badge-available {
      background-color: #198754;
    }

    .badge-assigned {
      background-color: #dc3545;
    }

    .btn-sm {
      padding: 0.25rem 0.5rem;
      font-size: 0.875rem;
    }

    footer {
      position: relative;
      z-index: 1;
      background: var(--card-bg);
      color: var(--light-gray);
      text-align: center;
      padding: 1rem 0;
      border-top: 3px solid var(--primary-red);
      margin-top: auto;
    }

    .alert-success {
      background-color: rgba(40, 167, 69, 0.9);
      color: white;
      border: none;
    }

    .alert-danger {
      background-color: rgba(220, 53, 69, 0.9);
      color: white;
      border: none;
    }

    .action-buttons {
      white-space: nowrap;
    }
  </style>
</head>
<body>
<div class="overlay"></div>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <i class="fas fa-car me-2"></i>AutoPulse
    </a>
    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="staff_management.jsp"><i class="fas fa-home me-1"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="staff_management.jsp">
            <i class="fas fa-users me-1"></i>Staff Management
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="update-container">
    <h2 class="text-center mb-4 text-white">Update Staff Details</h2>

    <% if (success != null) { %>
    <div class="alert alert-success text-center mb-4">
      <i class="fas fa-check-circle me-2"></i><%= success %>
    </div>
    <% } %>

    <% if (error != null) { %>
    <div class="alert alert-danger text-center mb-4">
      <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
    </div>
    <% } %>

    <div class="table-responsive">
      <table class="table table-dark table-hover align-middle">
        <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Role</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Status</th>
          <th>Date</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Staff staff : staffList) { %>
        <tr>
          <td><%= staff.getId() %></td>
          <td><%= staff.getFullName() %></td>
          <td><%= staff.getRole() %></td>
          <td><%= staff.getEmail() %></td>
          <td><%= staff.getPhoneNumber() %></td>
          <td>
                        <span class="badge <%= staff.getStatus().equalsIgnoreCase("Available") ? "badge-available" : "badge-assigned" %>">
                            <%= staff.getStatus() %>
                        </span>
          </td>
          <td>
            <%= staff.getAssignmentDate() != null ? staff.getAssignmentDate().toString().replace("T", " ").substring(0, 16) : "N/A" %>
          </td>
          <td class="action-buttons">
            <a href="edit_staff.jsp?id=<%= staff.getId() %>" class="btn btn-sm btn-primary me-2">
              <i class="fas fa-edit me-1"></i>Edit
            </a>
            <form action="StaffServlet" method="post" style="display: inline;">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="staffId" value="<%= staff.getId() %>">
              <button type="submit" class="btn btn-sm" style="background-color: white; color: black; border: 1px solid #ccc;">
                <i class="fas fa-trash-alt me-1"></i>Delete
              </button>

            </form>
          </td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<footer>
  <div class="container">
    <p>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>