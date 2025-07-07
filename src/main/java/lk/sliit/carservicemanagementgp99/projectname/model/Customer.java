package lk.sliit.carservicemanagementgp99.projectname.model;


public class Customer extends User {
    public Customer(String username,
                    String password,
                    String fullName,
                    String email,
                    String phone) {
        super(username, password, fullName, email, phone, "Customer", "", "", "");
    }
}
