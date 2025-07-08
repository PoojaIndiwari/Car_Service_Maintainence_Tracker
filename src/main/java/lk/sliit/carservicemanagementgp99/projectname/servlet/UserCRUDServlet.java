package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.*;
import lk.sliit.carservicemanagementgp99.projectname.model.Staff;

import java.io.IOException;

public class UserCRUDServlet extends HttpServlet {
    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String username = request.getParameter("username");

        switch (action.toLowerCase()) {
            case "update":
                handleUpdate(request, response);
                break;
            case "create":
                handleCreate(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String subrole = request.getParameter("subrole");
        String id = request.getParameter("id");

        User updatedUser;
        switch (role.toLowerCase()) {
            case "customer":
                updatedUser = new Customer(username, password, fullName, email, phone);
                break;
            case "staff":
                updatedUser = new Staff(username, password, fullName, email, phone, subrole,id, id);
                break;
            case "admin":
                updatedUser = new Admin(username, password, fullName, email, phone);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid role");
                return;
        }

        userManager.updateUser(updatedUser);
        response.sendRedirect("admin_dashboard.jsp");
    }

    private void handleCreate(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Extract parameters similar to RegisterServlet
        // Add validation and user creation logic
        response.sendRedirect("user_list.jsp");
    }
}