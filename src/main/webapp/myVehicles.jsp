<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.carservicemanagementgp99.projectname.Vehicle" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
  <c:when test="${empty myVehicles}">
    <div class="alert alert-warning text-center text-dark">
      <i class="bi bi-car-front fa-2x"></i>
      <p class="mt-2">You have no vehicles registered.</p>
    </div>
  </c:when>
  <c:otherwise>
    <div class="table-responsive">
      <table class="table table-dark table-striped align-middle">
        <thead>
        <tr>
          <th>#</th>
          <th>Plate</th>
          <th>Type</th>
          <th>Model</th>
          <th>Year</th>
          <th>Service</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="v" items="${myVehicles}" varStatus="st">
          <tr>
            <td>${st.index + 1}</td>
            <td>${v.numberPlate}</td>
            <td>${v.vehicleType}</td>
            <td>${v.model}</td>
            <td>${v.year}</td>
            <td>${v.serviceType}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </c:otherwise>
</c:choose>

