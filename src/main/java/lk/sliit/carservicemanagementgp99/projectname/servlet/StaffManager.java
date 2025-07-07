package lk.sliit.carservicemanagementgp99.projectname.servlet;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StaffManager {
    private static final Logger LOGGER = Logger.getLogger(StaffManager.class.getName());
    private static final String STAFF_FILE = "C:\\Users\\ASUS\\Desktop\\ProjectFile\\Staff_list.txt";
    private static final String DELIMITER = ",";

    private final List<lk.sliit.carservicemanagementgp99.projectname.servlet.Staff> staffList = new LinkedList<>();

    public StaffManager() {
        ensureFileExists();
        loadStaff();
        sortById();
    }

    private void ensureFileExists() {
        Path path = Paths.get(STAFF_FILE);
        if (!Files.exists(path)) {
            try {
                Files.createDirectories(path.getParent());
                Files.createFile(path);
            } catch (IOException e) {
                LOGGER.log(Level.SEVERE, "Failed to create staff file", e);
            }
        }
    }

    public List<lk.sliit.carservicemanagementgp99.projectname.servlet.Staff> getAllStaff() {
        return Collections.unmodifiableList(staffList);
    }

    public lk.sliit.carservicemanagementgp99.projectname.servlet.Staff getStaffById(String id) {
        return staffList.stream()
                .filter(s -> s.getId().equalsIgnoreCase(id))
                .findFirst()
                .orElse(null);
    }

    public void addStaff(lk.sliit.carservicemanagementgp99.projectname.servlet.Staff staff) {
        if (staff != null && !existsById(staff.getId())) {
            staffList.add(staff);
            sortById();
            saveStaff();
        }
    }

    public boolean removeStaff(String id) {
        boolean removed = staffList.removeIf(s -> s.getId().equalsIgnoreCase(id));
        if (removed) {
            saveStaff();
        }
        return removed;
    }

    public boolean existsById(String id) {
        return staffList.stream().anyMatch(s -> s.getId().equalsIgnoreCase(id));
    }

    public boolean existsByEmail(String email) {
        return staffList.stream()
                .filter(s -> s.getEmail() != null)
                .anyMatch(s -> s.getEmail().equalsIgnoreCase(email));
    }

    public boolean existsByPhone(String phone) {
        return staffList.stream()
                .filter(s -> s.getPhoneNumber() != null)
                .anyMatch(s -> s.getPhoneNumber().equalsIgnoreCase(phone));
    }

    private void sortById() {
        staffList.sort((s1, s2) -> {
            String id1 = s1.getId().trim();
            String id2 = s2.getId().trim();
            try {
                return Integer.compare(Integer.parseInt(id1), Integer.parseInt(id2));
            } catch (NumberFormatException e) {
                return id1.compareToIgnoreCase(id2);
            }
        });
    }

    private void saveStaff() {
        Path path = Paths.get(STAFF_FILE);
        try (BufferedWriter writer = Files.newBufferedWriter(path)) {
            for (lk.sliit.carservicemanagementgp99.projectname.servlet.Staff staff : staffList) {
                String line = String.join(DELIMITER,
                        staff.getId(),
                        staff.getFullName(),
                        staff.getRole(),
                        staff.getStatus(),
                        staff.getEmail() != null ? staff.getEmail() : "",
                        staff.getPhoneNumber() != null ? staff.getPhoneNumber() : "",
                        staff.getAssignmentDate() != null ? staff.getAssignmentDate().toString() : ""
                );
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to save staff data", e);
        }
    }

    private void loadStaff() {
        staffList.clear();
        Path path = Paths.get(STAFF_FILE);

        if (!Files.exists(path)) {
            return;
        }

        try (BufferedReader reader = Files.newBufferedReader(path)) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] parts = line.split(DELIMITER, -1);
                if (parts.length < 6) continue;

                String id = parts[0].trim();
                String name = parts[1].trim();
                String role = parts[2].trim();
                String status = parts[3].trim();
                String email = parts[4].trim();
                String phone = parts[5].trim();
                String dateStr = parts.length > 6 ? parts[6].trim() : "";

                lk.sliit.carservicemanagementgp99.projectname.servlet.Staff staff = createStaffInstance(id, name, role, email, phone);
                if (staff != null) {
                    staff.setStatus(status);
                    if (!dateStr.isEmpty()) {
                        try {
                            staff.setAssignmentDate(LocalDateTime.parse(dateStr));
                        } catch (DateTimeParseException e) {
                            LOGGER.log(Level.WARNING, "Invalid date format for staff " + id, e);
                        }
                    }
                    staffList.add(staff);
                }
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Failed to load staff data", e);
        }
    }

    private lk.sliit.carservicemanagementgp99.projectname.servlet.Staff createStaffInstance(String id, String name, String role, String email, String phone) {
        return switch (role) {
            case "Manager" -> new lk.sliit.carservicemanagementgp99.projectname.servlet.Manager(id, name, email, phone);
            case "Supervisor" -> new Supervisor(id, name, email, phone);
            case "Operation Head" -> new lk.sliit.carservicemanagementgp99.projectname.servlet.OperationHead(id, name, email, phone);
            case "Technician" -> new Technician(id, name, email, phone);
            case "Detailer" -> new lk.sliit.carservicemanagementgp99.projectname.servlet.Detailer(id, name, email, phone);
            case "Lot Attendant" -> new lk.sliit.carservicemanagementgp99.projectname.servlet.LotAttendant(id, name, email, phone);
            case "Engine Specialist", "EngineSpecialist" -> new lk.sliit.carservicemanagementgp99.projectname.servlet.EngineSpecialist(id, name, email, phone);
            default -> {
                LOGGER.warning("Unknown staff role: " + role);
                yield null;
            }
        };
    }
}
