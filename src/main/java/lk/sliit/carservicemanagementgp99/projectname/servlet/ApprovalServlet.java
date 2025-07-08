package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.AppointmentManager;
import lk.sliit.carservicemanagementgp99.projectname.Appointments;

import java.io.IOException;
import java.util.*;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    private final AppointmentManager mgr = new AppointmentManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        String decision = req.getParameter("decision");
        List<Appointments> all = mgr.loadAll();
        for (Appointments a : all) {
            if (a.getId().equals(id)) {
                a.setApproved("approve".equals(decision));
                break;
            }
        }
        mgr.saveAll(all);
        resp.sendRedirect("AppointmentServlet");
    }
}
