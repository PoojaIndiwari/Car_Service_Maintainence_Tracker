<%-- customer_list.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>


<%
    session = request.getSession(false);
    if (session == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserManager userManager = new UserManager();
    List<User> customers = userManager.getAllUsers().stream()
            .filter(u -> u.getRole().equals("Customer"))
            .toList();

    // Display success/error messages if they exist
    String successMsg = (String) session.getAttribute("success");
    String errorMsg = (String) session.getAttribute("error");
    session.removeAttribute("success");
    session.removeAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Customers - AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #2c0d0d, #b71c1c);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .action-btn { width: 100px; }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
        .nav-link { margin-right: 15px; }
        .table-container { background-color: #343a40; border-radius: 10px; padding: 20px; }
        .message-alert { position: fixed; top: 80px; right: 20px; z-index: 1000; width: 300px; }

        footer {
            background-color: #2c0d0d;
            color: #ccc;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">AutoPulse</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="admin_dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="customer_list.jsp">
                        <i class="fas fa-users-cog"></i> Manage Customers
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="nav-link">
                        <i class="fas fa-user-circle"></i> <%= currentUser.getFullName() %>
                    </span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Success/Error Messages -->
<% if (successMsg != null) { %>
<div class="message-alert">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= successMsg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<% } %>

<% if (errorMsg != null) { %>
<div class="message-alert">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= errorMsg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<% } %>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-users"></i> Customer Management</h2>
    </div>

    <div class="table-container">
        <table class="table table-dark table-striped table-hover">
            <thead class="thead-dark">
            <tr>
                <th><i class="fas fa-user"></i> Username</th>
                <th><i class="fas fa-id-card"></i> Full Name</th>
                <th><i class="fas fa-envelope"></i> Email</th>
                <th><i class="fas fa-phone"></i> Phone</th>
                <th><i class="fas fa-cog"></i> Actions</th>
            </tr>
            </thead>
            <tbody>
            <% if (customers.isEmpty()) { %>
            <tr>
                <td colspan="5" class="text-center">No customers found</td>
            </tr>
            <% } else {
                for (User customer : customers) { %>
            <tr>
                <td><%= customer.getUsername() %></td>
                <td><%= customer.getFullName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPhone() %></td>
                <td>
                    <div class="d-flex gap-2">
                        <a href="edit_customer.jsp?username=<%= customer.getUsername() %>"
                           class="btn btn-warning btn-sm action-btn">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <button class="btn btn-danger btn-sm action-btn"
                                onclick="confirmDelete('<%= customer.getUsername() %>')">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </div>
                </td>
            </tr>
            <% }
            } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-white">
            <div class="modal-header">
                <h5 class="modal-title"><i class="fas fa-exclamation-triangle"></i> Confirm Deletion</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this customer? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <form id="deleteForm" method="post" action="deleteCustomer">
                    <input type="hidden" name="username" id="deleteUsername">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times"></i> Cancel
                    </button>
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<footer>
    &copy; 2025 AutoPulse. All Rights Reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(username) {
        document.getElementById('deleteUsername').value = username;
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }

    // Auto-dismiss alerts after 5 seconds
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                bootstrap.Alert.getInstance(alert).close();
            }, 5000);
        });
    });
</script>
</body>
</html>
