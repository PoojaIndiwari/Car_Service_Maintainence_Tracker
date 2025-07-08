<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.User" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null || !user.getRole().equals("Customer")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile - AutoPulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #2c0d0d, #b71c1c);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            color: black;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 500px;
        }

        .btn-custom {
            background-color: #d32f2f;
            color: white;
        }

        .btn-custom:hover {
            background-color: #b71c1c;
        }

        footer {
            background-color: #2c0d0d;
            color: #ccc;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }

        .navbar .nav-link {
            margin-left: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #2c0d0d;">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="home.jsp">
            <i class="fas fa-car me-2"></i>
            <span>AutoPulse</span>
        </a>
        <div class="d-flex">
            <a class="nav-link text-white" href="customer_dashboard.jsp">Back</a>
            <a class="nav-link text-white" href="logout">Logout</a>
        </div>
    </div>
</nav>

<div class="content">
    <div class="form-container">
        <h3 class="text-center mb-4">Update Your Profile</h3>
        <form action="updateCustomer" method="post">
            <input type="hidden" name="username" value="<%= user.getUsername() %>">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="fullName" value="<%= user.getFullName() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" class="form-control" name="phone" value="<%= user.getPhone() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" value="<%= user.getPassword() %>" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-custom">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<footer>
    &copy; 2025 AutoPulse. All Rights Reserved.
</footer>

</body>
</html>
