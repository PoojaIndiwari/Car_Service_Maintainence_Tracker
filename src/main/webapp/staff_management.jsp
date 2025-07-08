<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Staff Management AutoPulse</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    :root {
      --primary-red: #dd0b1d;
      --dark-bg: #000000;
      --card-bg: #353434;
      --white: #ffffff;
      --light-gray: #e6e6e6;
    }
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      color: var(--white);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: var(--dark-bg) url('images/car3.jpg') no-repeat center center fixed;
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
      background-color: rgba(0, 0, 0, 0.5);
      z-index: -1;
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
    .content-container {
      position: relative;
      z-index: 1;
      max-width: 800px;
      margin: 2rem auto;
      background: rgba(62, 59, 59, 0.8);
      border-radius: 0.5rem;
      padding: 2rem;
      box-shadow: 0 8px 16px rgba(0,0,0,0.3);
      text-align: center;
    }
    .content-container h2 {
      margin-bottom: 1.5rem;
      color: var(--white);
    }
    .btn-danger {
      background-color: var(--primary-red) !important;
      border-color: var(--primary-red) !important;
      min-width: 140px;
      transition: all 0.3s;
    }
    .btn-danger:hover {
      background-color: #cc0000 !important;
      border-color: #cc0000 !important;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(221, 11, 29, 0.4);
    }
    .btn-group-red > .btn {
      margin: 0 .5rem;
    }

    /* Compact Footer Styles */
    .footer-section {
      background-color: var(--card-bg);
      color: var(--white);
      padding: 2rem 0 0.5rem;
      border-top: 3px solid var(--primary-red);
      margin-top: auto;
    }
    .footer-title {
      font-size: 1.3rem;
      font-weight: 700;
      color: var(--white);
      margin-bottom: 1rem;
      display: flex;
      align-items: center;
    }
    .footer-title i {
      color: var(--primary-red);
      margin-right: 0.5rem;
      font-size: 1.1rem;
    }
    .footer-text {
      color: var(--light-gray);
      font-size: 0.85rem;
      line-height: 1.5;
      margin-bottom: 1rem;
    }
    .footer-heading {
      font-size: 1.1rem;
      font-weight: 600;
      color: var(--white);
      margin-bottom: 1rem;
      position: relative;
      padding-bottom: 0.3rem;
    }
    .footer-heading::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 40px;
      height: 2px;
      background: var(--primary-red);
    }
    .footer-heading i {
      color: var(--primary-red);
      margin-right: 0.5rem;
      font-size: 1rem;
    }
    .footer-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .footer-list li {
      margin-bottom: 0.5rem;
      transition: all 0.3s;
    }
    .footer-list li a {
      color: var(--light-gray);
      text-decoration: none;
      font-size: 0.85rem;
      display: flex;
      align-items: center;
      transition: all 0.3s;
    }
    .footer-list li a i {
      color: var(--primary-red);
      margin-right: 0.5rem;
      transition: all 0.3s;
      width: 16px;
      text-align: center;
      font-size: 0.8rem;
    }
    .footer-contact {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .footer-contact li {
      margin-bottom: 0.7rem;
      display: flex;
      align-items: flex-start;
    }
    .footer-contact i {
      color: var(--primary-red);
      margin-top: 0.15rem;
      margin-right: 0.5rem;
      min-width: 16px;
      text-align: center;
      font-size: 0.9rem;
      transition: all 0.3s;
    }
    .footer-contact span {
      color: var(--light-gray);
      font-size: 0.85rem;
      line-height: 1.4;
    }
    .footer-bottom {
      color: var(--light-gray);
      font-size: 0.75rem;
      padding-top: 1rem;
      margin-top: 1.5rem;
      border-top: 1px solid rgba(255,255,255,0.1);
      text-align: center;
    }

    @media (max-width: 767.98px) {
      .footer-section {
        text-align: center;
        padding: 1.5rem 0 0.5rem;
      }

      .footer-heading {
        justify-content: center;
      }

      .footer-heading::after {
        left: 50%;
        transform: translateX(-50%);
      }

      .footer-list li a {
        justify-content: center;
      }

      .footer-contact li {
        justify-content: center;
      }

      .btn-group-red {
        flex-direction: column;
      }

      .btn-group-red > .btn {
        margin: 0.5rem 0;
      }
    }
  </style>
</head>
<body>
<!-- HEADER -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <i class="fas fa-car me-2"></i>AutoPulse
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">
            <i class="fas fa-home me-1"></i>Home
          </a>
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
<!-- /HEADER -->

<div class="content-container">
  <h2>Welcome to AutoPulse Staff Management</h2>
  <div class="btn-group-red d-flex justify-content-center">
    <a href="add_staff.jsp" class="btn btn-danger">Add New Staff member</a>
    <a href="view_staff.jsp" class="btn btn-danger">Staff Overview</a>
    <a href="update_staff_status.jsp" class="btn btn-danger">Update Staff Details</a>
  </div>
</div>

<!-- Compact Footer -->
<footer class="footer-section">
  <div class="container">
    <div class="row g-3">
      <!-- About Section -->
      <div class="col-lg-4 col-md-6">
        <h3 class="footer-title">
          <i class="fas fa-car"></i>AutoPulse Staff
        </h3>
        <p class="footer-text">
          Comprehensive staff management system for administrators.
          Monitor and manage all staff details efficiently.
        </p>
      </div>

      <!-- Quick Links Section -->
      <div class="col-lg-4 col-md-6">
        <h4 class="footer-heading">
          <i class="fas fa-link"></i>Quick Links
        </h4>
        <ul class="footer-list">
          <li>
            <a href="view_staff.jsp">
              <i class="fas fa-chevron-right"></i>Staff Dashboard
            </a>
          </li>
          <li>
            <a href="add_staff.jsp">
              <i class="fas fa-chevron-right"></i>Add Staff
            </a>
          </li>
          <li>
            <a href="update_staff_status.jsp">
              <i class="fas fa-chevron-right"></i>Update Staff
            </a>
          </li>
        </ul>
      </div>

      <!-- Contact Info Section -->
      <div class="col-lg-4 col-md-12">
        <h4 class="footer-heading">
          <i class="fas fa-headset"></i>Admin Support
        </h4>
        <ul class="footer-contact">
          <li>
            <i class="fas fa-envelope"></i>
            <span>admin@autopulse.com</span>
          </li>
          <li>
            <i class="fas fa-phone"></i>
            <span>011-1122467</span>
          </li>
          <li>
            <i class="fas fa-clock"></i>
            <span>24/7 Monitoring</span>
          </li>
        </ul>
      </div>
    </div>

    <!-- Copyright Section -->
    <div class="footer-bottom">
      <p class="mb-0">&copy; 2025 AutoPulse Staff Management. Designed by PGNO 99</p>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>