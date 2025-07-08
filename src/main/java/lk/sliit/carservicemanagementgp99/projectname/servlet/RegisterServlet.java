package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.model.Staff;
import lk.sliit.carservicemanagementgp99.projectname.model.UserManager;
import lk.sliit.carservicemanagementgp99.projectname.model.*;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1. Gather & trim
        String username = trim(req.getParameter("username"));
        String password = trim(req.getParameter("password"));
        String fullName = trim(req.getParameter("fullName"));
        String email    = trim(req.getParameter("email"));
        String phone    = trim(req.getParameter("phone"));

        //  If no role was sent, assume Customer
        String role     = trim(req.getParameter("role"));
        if (role.isEmpty()) {
            role = "Customer";
        }

        // 2. Required checks (exclude role so customers don’t fail here)
        if (anyEmpty(username, password, fullName, email, phone)) {
            req.setAttribute("error", "Username, password, full name, email & phone are required.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 3. No duplicate usernames
        if (userManager.getUser(username) != null) {
            req.setAttribute("error", "That username is already taken.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // 4. Build the appropriate User subtype
        User newUser;
        if ("Staff".equalsIgnoreCase(role)) {
            String department = trim(req.getParameter("department"));  // e.g. "Management" or "Service"
            String subrole    = trim(req.getParameter("subrole"));     // e.g. "Technician"
            String id         = trim(req.getParameter("id"));          // staff ID

            if (anyEmpty(department, subrole, id)) {
                req.setAttribute("error", "Department, sub-role & staff ID are required for staff.");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return;
            }

            // <-- pass department, subrole, id in that order -->
            newUser = new Staff(
                    username,
                    password,
                    fullName,
                    email,
                    phone,
                    department,
                    subrole,
                    id
            );

        } else if ("Admin".equalsIgnoreCase(role)) {
            newUser = new Admin(username, password, fullName, email, phone);

        } else {
            // default and catch-all: Customer
            newUser = new Customer(username, password, fullName, email, phone);
        }

        // 5. Persist & redirect to login
        userManager.addUser(newUser);
        resp.sendRedirect("login.jsp");
    }

    // === helpers ===
    private String trim(String s) {
        return s == null ? "" : s.trim();
    }
    private boolean anyEmpty(String... ss) {
        for (String s : ss) {
            if (s == null || s.isEmpty()) return true;
        }
        return false;
    }
}
