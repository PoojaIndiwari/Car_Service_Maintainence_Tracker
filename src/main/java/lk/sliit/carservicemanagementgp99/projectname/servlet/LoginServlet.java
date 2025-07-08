package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserManager userManager;

    @Override
    public void init() {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String u = trim(req.getParameter("username"));
        String p = trim(req.getParameter("password"));
        if (u.isEmpty() || p.isEmpty()) {
            req.setAttribute("error", "Username/password required.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        User user = userManager.authenticate(u, p);
        if (user == null) {
            req.setAttribute("error", "Invalid credentials.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(true);
        session.setAttribute("currentUser", user);

        // route by role / subrole
        String role    = user.getRole().toLowerCase();
        String sub     = user.getSubrole().toLowerCase().replaceAll("[^a-z]", "");

        switch (role) {
            case "admin":
                resp.sendRedirect("admin_dashboard.jsp");
                break;
            case "customer":
                resp.sendRedirect("customer_dashboard.jsp");
                break;
            case "staff":
                switch (sub) {
                    case "manager":
                    case "operationhead":
                    case "supervisor":
                        resp.sendRedirect("management_staff_dashboard.jsp");
                        break;
                    case "technician":
                    case "enginespecialist":
                    case "detailer":
                    case "lotattendant":
                        resp.sendRedirect("service_staff_dashboard.jsp");
                        break;
                    default:
                        req.setAttribute("error", "Unknown staff sub-role: “" + user.getSubrole() + "”");
                        req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
                break;
            default:
                req.setAttribute("error", "Unknown role: “" + user.getRole() + "”");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    private String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
