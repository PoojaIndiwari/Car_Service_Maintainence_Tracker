package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.AppointmentManager;
import lk.sliit.carservicemanagementgp99.projectname.Appointments;

import java.io.IOException;
import java.util.*;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private final AppointmentManager mgr = new AppointmentManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        List<Appointments> all = mgr.loadAll();
        mgr.sortByDateTime(all);

        if ("edit".equals(action)) {
            String id = req.getParameter("id");
            for (Appointments a : all) {
                if (a.getId().equals(id)) {
                    req.setAttribute("appointment", a);
                    break;
                }
            }
        }


        req.setAttribute("appointments", all);

        req.getRequestDispatcher("viewAppointments.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        List<Appointments> all = mgr.loadAll();

        switch (action) {
            case "create":
                Appointments newA = new Appointments(
                        UUID.randomUUID().toString(),
                        req.getParameter("customerId"),
                        req.getParameter("vehicleType"),
                        req.getParameter("serviceType"),
                        req.getParameter("date"),
                        req.getParameter("time"),
                        false
                );
                all.add(newA);
                break;

            case "update":
                String updId = req.getParameter("id");
                for (Appointments a : all) {
                    if (a.getId().equals(updId)) {
                        a.setCustomerId(req.getParameter("customerId"));
                        a.setVehicleType(req.getParameter("vehicleType"));
                        a.setServiceType(req.getParameter("serviceType"));
                        a.setDate(req.getParameter("date"));
                        a.setTime(req.getParameter("time"));
                        break;
                    }
                }
                break;

            case "delete":
                String delId = req.getParameter("id");
                all.removeIf(a -> a.getId().equals(delId));
                break;
        }

        mgr.saveAll(all);

        resp.sendRedirect("AppointmentServlet");
    }
}
