package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.sliit.carservicemanagementgp99.projectname.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(StaffServlet.class.getName());
    private final StaffManager manager = new StaffManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            redirectWithError(response, "error_staff.jsp", "Missing action parameter");
            return;
        }

        try {
            switch (action) {
                case "add"     -> handleAddStaff(request, response);
                case "delete"  -> handleDeleteStaff(request, response);
                case "update"  -> handleUpdateStaff(request, response);
                default        -> redirectWithError(response, "error_staff.jsp", "Invalid action specified");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing staff action: " + action, e);
            redirectWithError(response, "error_staff.jsp", "Server error occurred");
        }
    }

    private void handleAddStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String duplicateReason = checkForDuplicates(request);
        if (duplicateReason != null) {
            response.sendRedirect("error_staff.jsp?reason=" + URLEncoder.encode(duplicateReason, StandardCharsets.UTF_8));
            return;
        }


        boolean success = processStaff(request);
        if (success) {
            response.sendRedirect("add_staff.jsp?success=Staff member added successfully");
        } else {
            redirectWithError(response, "error_staff.jsp", "Failed to add staff member");
        }
    }

    private void handleDeleteStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String staffId = request.getParameter("staffId");
        if (staffId != null && manager.removeStaff(staffId)) {
            response.sendRedirect("update_staff_status.jsp?success=Staff member deleted successfully");
        } else {
            redirectWithError(response, "error_staff.jsp", "Failed to delete staff member");
        }
    }

    private void handleUpdateStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String staffId = request.getParameter("staffId");
        if (staffId != null) {
            manager.removeStaff(staffId);
        }

        boolean success = processStaff(request);
        if (success) {
            response.sendRedirect("staff_management.jsp?success=Staff member updated successfully");
        } else {
            redirectWithError(response, "error_staff.jsp", "Failed to update staff member");
        }
    }


    private String checkForDuplicates(HttpServletRequest request) {
        String id = request.getParameter("staffId");
        String email = request.getParameter("staffEmail");
        String phone = request.getParameter("staffPhone");

        if (manager.existsById(id)) {
            return "duplicateId";
        }
        if (manager.existsByEmail(email)) {
            return "duplicateEmail";
        }
        if (manager.existsByPhone(phone)) {
            return "duplicatePhone";
        }
        return null;
    }

    private boolean processStaff(HttpServletRequest request) {
        String id = request.getParameter("staffId");
        String name = request.getParameter("staffName");
        String role = request.getParameter("staffRole");
        String status = request.getParameter("staffStatus");
        String email = request.getParameter("staffEmail");
        String phone = request.getParameter("staffPhone");
        String dateStr = request.getParameter("assignmentDate");


        if (id == null || name == null || role == null || status == null || email == null || phone == null) {
            LOGGER.warning("Missing required staff parameters");
            return false;
        }


        Staff staff = createStaffInstance(id, name, role, email, phone);
        if (staff == null) {
            LOGGER.warning("Invalid staff role specified: " + role);
            return false;
        }

        staff.setStatus(status);


        if (dateStr != null && !dateStr.isEmpty()) {
            try {
                LocalDateTime date = LocalDateTime.parse(dateStr);
                staff.setAssignmentDate(date);
            } catch (DateTimeParseException e) {
                LOGGER.log(Level.WARNING, "Invalid date format: " + dateStr, e);
            }
        }


        manager.addStaff(staff);
        return true;
    }

    private Staff createStaffInstance(String id, String name, String role, String email, String phone) {
        return switch (role) {
            case "Manager" -> new Manager(id, name, email, phone);
            case "Supervisor" -> new Supervisor(id, name, email, phone);
            case "Operation Head" -> new OperationHead(id, name, email, phone);
            case "Technician" -> new Technician(id, name, email, phone);
            case "Engine Specialist" -> new EngineSpecialist(id, name, email, phone);
            case "Detailer" -> new Detailer(id, name, email, phone);
            case "Lot Attendant" -> new LotAttendant(id, name, email, phone);
            default -> null;
        };
    }

    private void redirectWithError(HttpServletResponse response, String page, String error) throws IOException {
        if ("error_staff.jsp".equals(page)) {
            response.sendRedirect("error_staff.jsp?message=" + URLEncoder.encode(error, StandardCharsets.UTF_8));
        } else {
            response.sendRedirect(page + "?error=" + URLEncoder.encode(error, StandardCharsets.UTF_8));
        }
    }
}
