<!DOCTYPE html>
<html>
<head>
  <title>Car Service and Maintenance Tracker</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: url('images/pexels-cottonbro-4488642.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      margin: 0;

    }

    .overlay {
      background-color: rgba(0, 0, 0,0.6);
      padding: 50px;
      border-radius: 15px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
      max-width: 600px;
      width: 100%;
      text-align: center;
    }
    .text-outline {
      color: white;
      text-shadow:
              -1px -1px 0 #000,
              1px -1px 0 #000,
              -1px 1px 0 #000,
              1px 1px 0 #000;
    }

    .btn-orange-red {
      background-color: #e63900;
      color: white;
      border: none;
    }
    .btn-orange-red:hover {
      background-color: #cc3300;
      color: white;
    }
  </style>
</head>
<body class="bg-light">

<jsp:include page="header.jsp" />

<div class="main-wrapper d-flex justify-content-center align-items-center" style="min-height: 90vh;">
  <div class="overlay text-center">
    <h1 class="mb-4 text-outline">Welcome to Car Service and Maintenance Tracker</h1>
    <p class="lead text-white mb-4">Easily manage vehicle services, track progress, and generate invoices.</p>

    <div class="d-grid gap-3 col-6 mx-auto">
      <a href="service.jsp" class="btn btn-orange-red btn-lg">Manage Services</a>
      <a href="service?view=tracker" class="btn btn-orange-red btn-lg">Service Tracker</a>
    </div>
  </div>
</div>

<jsp:include page="serviceFooter.jsp" />

</body>
</html>
