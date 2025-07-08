package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.User;

import java.io.IOException;


public class DashboardRedirectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("currentUser");
        String role = user.getRole() != null ? user.getRole().trim().toLowerCase() : "";
        String subrole = user.getSubrole() != null ? user.getSubrole().trim().toLowerCase() : "";

        switch (role) {
            case "admin":
                response.sendRedirect("admin_dashboard.jsp");
                break;
            case "customer":
                response.sendRedirect("customer_dashboard.jsp");
                break;
            case "staff":
                // Match management subroles
                if (subrole.equals("manager") || subrole.equals("operationhead") || subrole.equals("supervisor")) {
                    response.sendRedirect("management_staff_dashboard.jsp");
                }
                // Match service subroles
                else if (subrole.equals("technician") || subrole.equals("enginespecialist") ||
                        subrole.equals("detailer") || subrole.equals("lotattendant")) {
                    response.sendRedirect("service_staff_dashboard.jsp");
                }
                else {
                    request.setAttribute("error", "Unrecognized staff subrole.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                break;
            default:
                request.setAttribute("error", "Unrecognized user role.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                break;
        }
    }
}
