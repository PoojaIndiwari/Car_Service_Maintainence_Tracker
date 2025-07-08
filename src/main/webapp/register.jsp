<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register – AutoPulse</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background: url('https://png.pngtree.com/background/20250119/original/pngtree-auto-mechanic-repairs-car-engine-picture-image_15516569.jpg?w=1200')
      no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      flex-direction: column;
    }
    .overlay {
      background-color: rgba(7, 7, 7, 0.3);
      flex-grow: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px 0;
    }
    .register-form {
      background-color: rgba(50, 42, 42, 0.8);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(64, 59, 59, 0.3);
      max-width: 700px;
      width: 100%;
    }
    h2 { color: #fff; font-weight: bold; text-align: center; }
    .btn-custom {
      background-color: #dc3545;
      color: #fff;
      font-weight: bold;
      transition: 0.3s;
    }
    .btn-custom:hover { background-color: #bb2d3b; }
    .back-to-home {
      color: #dc3545;
      font-weight: bold;
      text-decoration: none;
    }
    .back-to-home:hover { color: #bb2d3b; }
    footer { background-color: #8B0000; color: #fff; text-align: center; padding: 15px 0; }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#8B0000;">
  <div class="container">
    <a class="navbar-brand" href="home.jsp">
      <i class="fas fa-car me-2"></i>AutoPulse
    </a>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">Home</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Register Form -->
<div class="overlay">
  <div class="register-form">
    <h2>Create an Account</h2>
    <form action="RegisterServlet" method="post">
      <div class="mb-3">
        <input type="text" name="username" class="form-control" placeholder="Username" required />
      </div>
      <div class="mb-3">
        <input type="password" name="password" class="form-control" placeholder="Password" required />
      </div>
      <div class="mb-3">
        <input type="text" name="fullName" class="form-control" placeholder="Full Name" required />
      </div>
      <div class="mb-3">
        <input type="email" name="email" class="form-control" placeholder="Email" required />
      </div>
      <div class="mb-3">
        <input type="text" name="phone" class="form-control" placeholder="Phone Number" required />
      </div>

      <div class="mb-3">
        <label for="role" class="form-label text-white">Select Role</label>
        <select name="role" id="role" class="form-select" required onchange="toggleStaffFields()">
          <option value="">-- Choose a Role --</option>
          <option value="Customer">Customer</option>
          <option value="Staff">Staff</option>
          <option value="Admin">Admin</option>
        </select>
      </div>

      <!-- Staff-only fields -->
      <div id="staffFields" style="display:none;">
        <div class="mb-3">
          <label for="department" class="form-label text-white">Department</label>
          <select name="department" id="department" class="form-select" onchange="onDeptChange()">
            <option value="">-- Select Department --</option>
            <option value="management">Management Department</option>
            <option value="service">Service Department</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="subrole" class="form-label text-white">Sub-Role</label>
          <select name="subrole" id="subrole" class="form-select">
            <option value="">-- Select Sub-Role --</option>
          </select>
        </div>
        <div class="mb-3">
          <input type="text" name="id" class="form-control" placeholder="Staff ID" />
        </div>
      </div>

      <div class="d-grid">
        <button type="submit" class="btn btn-custom">Register</button>
      </div>
    </form>

    <div class="text-center mt-3">
      <a href="home.jsp" class="back-to-home">Back to Home</a>
    </div>

    <c:if test="${not empty error}">
      <div class="alert alert-danger mt-3 text-center">
          ${error}
      </div>
    </c:if>
  </div>
</div>

<footer>
  <p>© 2025 AutoPulse</p>
</footer>

<script>
  const subroles = {
    management: ["Manager", "OperationHead", "Supervisor"],
    service:    ["Technician", "EngineSpecialist", "Detailer", "LotAttendant"]
  };

  function toggleStaffFields() {
    const show = document.getElementById('role').value === 'Staff';
    document.getElementById('staffFields').style.display = show ? 'block' : 'none';
    if (!show) {
      document.getElementById('department').value = '';
      onDeptChange();
    }
  }

  function onDeptChange() {
    const dept = document.getElementById('department').value;
    const sub = document.getElementById('subrole');
    sub.innerHTML = '<option value="">-- Select Sub-Role --</option>';
    if (subroles[dept]) {
      subroles[dept].forEach(r => {
        const opt = document.createElement('option');
        opt.value = r; opt.text = r;
        sub.add(opt);
      });
    }
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
