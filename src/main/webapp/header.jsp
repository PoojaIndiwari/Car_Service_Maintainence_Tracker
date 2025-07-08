
<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    :root {
        --primary-red: #e63900;
        --light-gray: #ccc;
        --white: #ffffff;
        --card-bg: #212529;
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
        color: var(--primary-red) !important;
        font-weight: 600;
    }
</style>

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="serviceAndInvoiceindex.jsp">Auto Pulse</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="service.jsp">Manage Services</a></li>
                <li class="nav-item"><a class="nav-link" href="service?view=tracker">Service Tracker</a></li>
            </ul>
        </div>
    </div>
</nav>