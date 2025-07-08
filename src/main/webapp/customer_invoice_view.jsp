<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Invoice" %>

<%
    List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Invoice View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: url('images/19613.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar-custom {
            background-color: #1c1c1c;
            border-bottom: 3px solid orange;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-custom .brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar-custom .nav-link {
            color: white;
            text-decoration: none;
        }

        .overlay-container {
            background-color: rgba(0, 0, 0, 0.7);
            margin: 40px auto;
            padding: 30px;
            border-radius: 12px;
            max-width: 1000px;
        }

        .table th, .table td {
            vertical-align: middle;
            color: white;
        }

        .thead-dark th {
            background-color: #343a40;
            color: #ffc107;
        }

        .form-inline input {
            width: 300px;
        }

        .btn-custom {
            background-color: #e63900;
            color: white;
        }

        .btn-custom:hover {
            background-color: #cc3300;
        }

        .btn-info {
            background-color: #17a2b8;
            border: none;
        }

        h2 {
            color: #fff;
            margin-bottom: 25px;
        }

        .form-control {
            background-color: #f9f9f9;
        }

        .alert-warning {
            background-color: #ffc107;
            color: #000;
        }
    </style>
</head>
<body>
<div class="navbar-custom">
    <div class="brand">Auto Pulse</div>
    <div><a href="service_tracker.jsp" class="nav-link">Service Tracker</a></div>
</div>

<div class="container overlay-container">
    <h2>View Your Invoices</h2>

    <form action="service" method="get" class="form-inline d-flex mb-4">
        <input type="hidden" name="view" value="customerInvoices">
        <input type="text" name="search" class="form-control me-2" placeholder="Enter Name or Service ID" required>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <% if (invoices != null && !invoices.isEmpty()) { %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
            <tr>
                <th>Invoice ID</th>
                <th>Customer Name</th>
                <th>Service ID</th>
                <th>Base Amount</th>
                <th>Total Amount</th>
                <th>Service Type</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (Invoice invoice : invoices) { %>
            <tr>
                <td><%= invoice.getInvoiceId() %></td>
                <td><%= invoice.getCustomerName() %></td>
                <td><%= invoice.getServiceId() %></td>
                <td>LKR <%= String.format("%.2f", invoice.getBaseAmount()) %></td>
                <td>LKR <%= String.format("%.2f", invoice.getTotalAmount()) %></td>
                <td><%= invoice.getSpecificServiceType() %></td>
                <td>
                    <a href="invoice_details.jsp?invoiceId=<%= invoice.getInvoiceId() %>&customerName=<%= invoice.getCustomerName() %>&serviceType=<%= invoice.getSpecificServiceType() %>&totalAmount=<%= invoice.getTotalAmount() %>"
                       class="btn btn-info btn-sm">View</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else if (request.getParameter("search") != null) { %>
    <div class="alert alert-warning">No invoices found for your search.</div>
    <% } %>

    <a href="home.jsp" class="btn btn-custom mt-4">Back to Home</a>
</div>

<jsp:include page="serviceFooter.jsp" />
</body>
</html>
