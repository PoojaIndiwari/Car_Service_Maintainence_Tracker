package lk.sliit.carservicemanagementgp99.projectname;

import java.time.LocalDateTime;

public abstract class Staff {
    private String id;
    private String fullName;
    private String role;
    private String status;
    private String email;
    private String phoneNumber;
    private LocalDateTime assignmentDate;

    public Staff(String id, String name, String role) {
        this.id = id;
        this.fullName = name;
        this.role = role;
        this.status = "Available";
    }

    public Staff(String id, String name, String role, String email, String phoneNumber) {
        this(id, name, role);
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public String getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getRole() {
        return role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public LocalDateTime getAssignmentDate() {
        return assignmentDate;
    }

    public void setAssignmentDate(LocalDateTime assignmentDate) {
        this.assignmentDate = assignmentDate;
    }
}