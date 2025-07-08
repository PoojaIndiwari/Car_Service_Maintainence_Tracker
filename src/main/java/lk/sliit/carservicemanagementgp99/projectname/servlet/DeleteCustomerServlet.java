// DeleteCustomerServlet.java
package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sliit.carservicemanagementgp99.projectname.model.User;
import lk.sliit.carservicemanagementgp99.projectname.model.UserManager;

import java.io.IOException;

@WebServlet(name = "DeleteCustomerServlet", urlPatterns = {"/deleteCustomer"})
public class DeleteCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Authorization check
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");
        if (!"Admin".equals(currentUser.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }

        String username = request.getParameter("username");
        if (username == null || username.trim().isEmpty()) {
            session.setAttribute("error", "Username parameter is missing");
            response.sendRedirect("customer_list.jsp");
            return;
        }

        UserManager userManager = new UserManager();
        boolean deletionResult = userManager.deleteUser(username);

        if (deletionResult) {
            session.setAttribute("success", "Customer '" + username + "' deleted successfully");
        } else {
            session.setAttribute("error", "Failed to delete customer '" + username + "'");
        }

        response.sendRedirect("customer_list.jsp");
    }
}