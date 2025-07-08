<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - AutoPulse</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

  <style>
    body.login-page {
      background: url('https://png.pngtree.com/background/20250119/original/pngtree-auto-mechanic-repairs-car-engine-picture-image_15516569.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      position: relative;
    }

    .overlay {
      background-color: rgba(0, 0, 0, 0.6);
      position: absolute;
      inset: 0;
      z-index: 0;
    }
    .card-login {
      background-color: rgba(110, 96, 96, 0.8); /* Dark ash transparent background */
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      z-index: 1;
    }

    .navbar {
      background-color: #8B0000;
    }

    .navbar-brand, .nav-link {
      color: white !important;
      font-weight: bold;
    }

    .btn-login {
      background-color: #dc3545;
      color: white;
      font-weight: bold;
    }

    .btn-login:hover {
      background-color: #bb2d3b;
    }

    .text-link {
      color: #dc3546;
      font-weight: bold;
      text-decoration: none;
    }

    .text-link:hover {
      color: #bb2d3b;
    }

    footer {
      background-color: #8B0000;
      color: white;
      text-align: center;
      padding: 15px 0;
    }
  </style>
</head>
<body class="login-page">

<!-- Overlay Background -->
<div class="overlay"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand" href="home.jsp">
      <i class="fas fa-car me-2"></i>AutoPulse
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Login Form -->
<div class="container d-flex align-items-center justify-content-center" style="min-height: 85vh; position: relative; z-index: 1;">
  <div class="col-md-6 col-lg-5">
    <div class="card card-login">
      <h2 class="text-center mb-4">AutoPulse Login</h2>

      <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger text-center">
        <%= request.getAttribute("error") %>
      </div>
      <% } %>

      <form action="login" method="post">
        <div class="mb-3">
          <input type="text" name="username" class="form-control" placeholder="Username" required />
        </div>
        <div class="mb-3">
          <input type="password" name="password" class="form-control" placeholder="Password" required />
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-login">Login</button>
        </div>
      </form>

      <div class="text-center mt-3">
        <a href="register.jsp" class="text-link">Create Account</a>
      </div>
      <div class="text-center mt-3">
        <a href="home.jsp" class="text-link"><i class="fas fa-arrow-left me-2"></i>Back to Home</a>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
