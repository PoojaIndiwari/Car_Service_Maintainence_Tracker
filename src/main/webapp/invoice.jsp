<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.model.Invoice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Invoices</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: url('images/19613.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            margin: 0;
        }
        .page-overlay {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 40px;
            border-radius: 15px;
            margin-top: 30px;
        }
        .btn-orange-red {
            background-color: #e63900;
            color: white;
            border: none;
        }
        .btn-orange-red:hover {
            background-color: #cc3300;
        }
        .table thead th {
            color: #e63900;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Invoice List</h2>

    <div class="alert alert-info">
        Invoices are automatically generated when a service is added. You can view or edit them below.
    </div>

    <form class="row mb-4" method="get" action="service">
        <input type="hidden" name="view" value="invoices"/>
        <div class="col-md-4">
            <input type="text" name="search" class="form-control" placeholder="Search by name or Service ID"/>
        </div>
        <div class="col-md-2">
            <button class="btn btn-outline-light">Search</button>
        </div>
    </form>
    <form method="get" action="service" class="mb-3">
        <input type="hidden" name="view" value="invoices">
        <button class="btn btn-outline-light">View Invoice</button>
    </form>

    <%
        List<Invoice> invoices = (List<Invoice>) request.getAttribute("invoices");
        if (invoices != null && !invoices.isEmpty()) {
    %>
    <table class="table table-dark table-striped">
        <thead>
        <tr>
            <th>Invoice ID</th>
            <th>Customer Name</th>
            <th>Service Type</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Invoice invoice : invoices) { %>
        <tr>
            <td><%= invoice.getInvoiceId() %></td>
            <td><%= invoice.getCustomerName() %></td>
            <td><%= invoice.getSpecificServiceType() %></td>
            <td>Rs. <%= invoice.getTotalAmount() %></td>
            <td>
                <form action="invoice_details.jsp" method="get">
                    <input type="hidden" name="invoiceId" value="<%= invoice.getInvoiceId() %>">
                    <input type="hidden" name="customerName" value="<%= invoice.getCustomerName() %>">
                    <input type="hidden" name="serviceType" value="<%= invoice.getSpecificServiceType() %>">
                    <input type="hidden" name="totalAmount" value="<%= invoice.getTotalAmount() %>">
                    <button type="submit" class="btn btn-sm btn-orange-red">View</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <div class="alert alert-warning">No invoices found.</div>
    <% } %>

    <a href="management_staff_dashboard.jsp" class="btn btn-secondary mt-3">Back to Home</a>
</div>

<jsp:include page="serviceFooter.jsp" />
</body>
</html>