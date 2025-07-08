package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.AppointmentManager;
import lk.sliit.carservicemanagementgp99.projectname.Appointments;
import lk.sliit.carservicemanagementgp99.projectname.Vehicle;
import lk.sliit.carservicemanagementgp99.projectname.VehicleManager;
import lk.sliit.carservicemanagementgp99.projectname.model.User;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/customerDashboard")
public class CustomerDashboardServlet extends HttpServlet {
    private VehicleManager vehicleManager;
    private AppointmentManager appointmentManager;

    @Override
    public void init() throws ServletException {
        vehicleManager     = new VehicleManager();
        appointmentManager = new AppointmentManager();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");
        String userId    = currentUser.getUsername();

        // 1) only this customer’s vehicles
        List<Vehicle> myVehicles = vehicleManager.getVehicles().stream()
                .filter(v -> userId.equalsIgnoreCase(v.getOwner()))
                .collect(Collectors.toList());
        req.setAttribute("myVehicles", myVehicles);

        // 2) only this customer’s appointments
        List<Appointments> myAppointments = appointmentManager.loadAll().stream()
                .filter(a -> userId.equalsIgnoreCase(a.getCustomerId()))
                .collect(Collectors.toList());
        req.setAttribute("myAppointments", myAppointments);

        req.getRequestDispatcher("customer_dashboard.jsp").forward(req, resp);
    }
}
