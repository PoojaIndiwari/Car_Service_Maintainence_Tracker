<%@ page language="java" import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<html>
<head>
  <title>Feedback Records | AutoPulse Admin</title>
  <!-- Bootstrap & FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

  <!-- DataTables & Buttons -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css">

  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      background: url('images/feedback-bg.jpg') no-repeat center center fixed;
      background-size: cover;
      color: white;
    }

    .content-container {
      flex: 1; /* Takes remaining space */
      background: rgba(0, 0, 0, 0.85);
      padding: 30px;
      border-radius: 10px;
      margin: 30px auto 20px;
      width: 95%;
      max-width: 1200px;
    }

    footer {
      background-color: #111;
      color: #ccc;
      text-align: center;
      padding: 10px 0;
      border-top: 2px solid #dc3545;
      margin-top: auto; /* Push to bottom */
      width: 100%;
    }

    .table {
      background: white;
      color: black;
    }
    .navbar-custom {
      background-color: #111;
      border-bottom: 3px solid #dc3545;
    }
    .navbar-brand {
      font-weight: bold;
      color: #dc3545 !important;
    }
    .nav-link {
      color: #fff !important;
    }
    .nav-link:hover {
      color: #ffc107 !important;
    }
    .filter-bar {
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
  <div class="container-fluid px-4">
    <a class="navbar-brand" href="home.jsp"><i class="fas fa-car"></i> AutoPulse</a>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="customer_dashboard.jsp">Back</a></li>
        <li class="nav-item"><a class="nav-link" href="feedbackSummary.jsp">Feedback Summary</a></li>
        <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<%
  List<String[]> feedbackList = new ArrayList<>();
  try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\ASUS\\Desktop\\ProjectFile/feedback.txt"))) {
    String line;
    while ((line = reader.readLine()) != null) {
      feedbackList.add(line.split(",", 4));
    }
  } catch (IOException e) {
    e.printStackTrace();
  }
%>

<div class="container content-container">
  <h2 class="text-center mb-4"><i class="fas fa-comments"></i> Submitted Feedback</h2>

  <% if (feedbackList.isEmpty()) { %>
  <div class="alert alert-warning text-center">No feedback found.</div>
  <% } else { %>

  <!-- Filter by Rating -->
  <div class="row filter-bar">
    <div class="col-md-4 offset-md-8 text-end">
      <select id="ratingFilter" class="form-select form-select-sm">
        <option value="">Filter by Rating</option>
        <option value="1">1 ⭐</option>
        <option value="2">2 ⭐</option>
        <option value="3">3 ⭐</option>
        <option value="4">4 ⭐</option>
        <option value="5">5 ⭐</option>
      </select>
    </div>
  </div>

  <table id="feedbackTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Rating</th>
      <th>Comments</th>
    </tr>
    </thead>
    <tbody>
    <% for (String[] feedback : feedbackList) { %>
    <tr>
      <td><%= feedback[0] %></td>
      <td><%= feedback[1] %></td>
      <td><%= feedback[2] %></td>
      <td><%= feedback[3] %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } %>

  <div class="text-center mt-4">
    <a href="customer_dashboard.jsp" class="btn btn-outline-light"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>
</div>

<!-- Footer -->
<footer>
  <div>© 2025 AutoPulse. All rights reserved. Designed by PGNO 99</div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>

</body>
</html>
