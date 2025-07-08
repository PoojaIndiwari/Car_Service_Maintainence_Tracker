<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error – AutoPulse</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #1a1a1a;
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
        }
        .error-box {
            background: #2b2b2b;
            border: 2px solid #ff0000;
            padding: 2rem;
            border-radius: 10px;
            max-width: 600px;
            text-align: center;
        }
        .error-box h2 {
            color: #ffffff;
            margin-bottom: 1rem;
        }
        .btn-back {
            background: #ff0000;
            border: none;
            margin-top: 1.5rem;
        }
        .btn-back:hover {
            background: #cc0000;
        }
    </style>
</head>
<body>
<div class="error-box">
    <h2><i class="fas fa-exclamation-triangle"></i> Error</h2>
    <%
        String reason = request.getParameter("reason");
        if ("duplicateId".equals(reason)) {
    %>
    <p>A staff member with this <strong>ID</strong> already exists.</p>
    <% } else if ("duplicateEmail".equals(reason)) { %>
    <p>This <strong>email</strong> is already in use by another staff member.</p>
    <% } else if ("duplicatePhone".equals(reason)) { %>
    <p>This <strong>phone number</strong> is already registered.</p>
    <% } else { %>
    <p>An unexpected error occurred. Please try again.</p>
    <% } %>

    <a href="add_staff.jsp" class="btn btn-back text-white">
        <i class="fas fa-arrow-left"></i> Go Back
    </a>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
