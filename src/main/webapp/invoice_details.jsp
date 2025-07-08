<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Invoice Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body {
      background: url('images/19613.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      margin: 0;
    }

    .page-overlay {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 40px;
      border-radius: 15px;
      margin-top: 40px;
    }

    .text-label {
      color: #f8f9fa;
    }

    .text-value {
      color: #ffc107;
    }

    .btn-back {
      background-color: #e63900;
      color: white;
    }

    .btn-back:hover {
      background-color: #cc3300;
    }
  </style>
</head>
<body>
<div class="container page-overlay">
  <h2 class="mb-4 text-white">Invoice Details</h2>

  <%
    String invoiceId = request.getParameter("invoiceId");
    String customerName = request.getParameter("customerName");
    String serviceType = request.getParameter("serviceType");
    String totalAmount = request.getParameter("totalAmount");
  %>

  <div class="row mb-3">
    <div class="col-md-4 text-label">Invoice ID:</div>
    <div class="col-md-8 text-value"><%= invoiceId %></div>
  </div>
  <div class="row mb-3">
    <div class="col-md-4 text-label">Customer Name:</div>
    <div class="col-md-8 text-value"><%= customerName %></div>
  </div>
  <div class="row mb-3">
    <div class="col-md-4 text-label">Service Type:</div>
    <div class="col-md-8 text-value"><%= serviceType %></div>
  </div>
  <div class="row mb-3">
    <div class="col-md-4 text-label">Total Amount:</div>
    <div class="col-md-8 text-value">Rs. <%= totalAmount %></div>
  </div>

  <a href="invoice.jsp" class="btn btn-back mt-4">Back to Invoice List</a>
</div>
<jsp:include page="serviceFooter.jsp" />
</body>
</html>