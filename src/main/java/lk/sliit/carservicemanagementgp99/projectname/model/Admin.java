package lk.sliit.carservicemanagementgp99.projectname.model;


public class Admin extends User {
    public Admin(String username,
                 String password,
                 String fullName,
                 String email,
                 String phone) {
        super(
                username,
                password,
                fullName,
                email,
                phone,
                "Admin",  // role
                "",       // department (not used)
                "",       // subrole    (not used)
                ""        // id         (not used)
        );
    }
}
