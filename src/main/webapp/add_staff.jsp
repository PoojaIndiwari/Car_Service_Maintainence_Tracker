<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String success = request.getParameter("success");
    String error   = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Staff – AutoPulse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-red: #dd0b1d;
            --dark-bg:     #121212;
            --form-bg: #2c2c2c;
            --white:       #ffffff;
            --light-gray:  #e6e6e6;
            --card-bg: #353434;
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
        .nav-link.active {
            color: var(--white) !important;
            font-weight: 600;
        }

        .form-box {
            position: relative;
            z-index: 1;
            background: rgba(26, 26, 26, 0.9);
            max-width: 600px;
            margin: 4rem auto;
            padding: 2rem;
            border-radius: 10px;
            border-top: 4px solid var(--primary-red);
            box-shadow: 0 10px 20px rgba(0,0,0,0.4);
        }

        .form-label {
            font-weight: bold;
            color: var(--light-gray);
        }
        .form-label::after {
            content: " *";
            color: var(--primary-red);
        }

        .form-control, .form-select {
            background: #ffffff;
            color: #3c3c3c;
            border: 1px solid #444;
        }

        .btn-danger {
            background: var(--primary-red);
            border: none;
            padding: 10px 20px;
            font-weight: 600;
        }
        .btn-danger:hover {
            background: #b30817;
        }

        .btn-secondary {
            background: #6c757d;
            border: none;
            padding: 10px 20px;
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
    <div class="form-box">
        <h3 class="text-center mb-4 text-white">Add New Staff</h3>

        <% if (success != null) { %>
        <div class="alert alert-success text-center">
            <i class="fas fa-check-circle me-2"></i><%= success %>
        </div>
        <% } else if (error != null) { %>
        <div class="alert alert-danger text-center">
            <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
        </div>
        <% } %>

        <form action="StaffServlet" method="post">
            <input type="hidden" name="action" value="add">

            <div class="mb-3">
                <label class="form-label">Staff ID</label>
                <input type="text" name="staffId" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="staffName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Role</label>
                <select name="staffRole" class="form-select" required>
                    <option value="Manager">Manager</option>
                    <option value="Technician">Technician</option>
                    <option value="Engine Specialist">Engine Specialist</option>
                    <option value="Detailer">Detailer</option>
                    <option value="Lot Attendant">Lot Attendant</option>
                    <option value="Supervisor">Supervisor</option>
                    <option value="OperationHead">SOperation Head</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="staffEmail" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="tel" name="staffPhone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Status</label>
                <select name="staffStatus" class="form-select" required>
                    <option value="Available">Available</option>
                    <option value="Assigned">Assigned</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Date</label>
                <input type="datetime-local" name="assignmentDate" class="form-control">
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-danger">
                    <i class="fas fa-user-plus me-1"></i> Add Staff
                </button>
                <a href="staff_management.jsp" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Go Back
                </a>
            </div>
        </form>
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
