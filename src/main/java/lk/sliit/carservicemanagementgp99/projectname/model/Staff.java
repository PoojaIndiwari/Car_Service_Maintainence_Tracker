package lk.sliit.carservicemanagementgp99.projectname.model;


public class Staff extends User {

    public Staff(String username, String password, String fullName, String email, String phone, String department, String subrole, String id) {
        super(username, password, fullName, email, phone, "Staff", department, subrole, id);
    }
}
