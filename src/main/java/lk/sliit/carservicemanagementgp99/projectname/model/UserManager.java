package lk.sliit.carservicemanagementgp99.projectname.model;

import java.io.*;
import java.util.LinkedList;
import java.util.Collections;

public class UserManager {
    private final LinkedList<User> users = new LinkedList<>();
    private final String filePath ="C:\\Users\\pooja\\Desktop\\users.txt";


    public UserManager() {
        loadUsers();
    }

    private void loadUsers() {
        users.clear();
        File file = new File(filePath);
        if (!file.exists()) {
            return;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                // preserve empty trailing fields
                String[] parts = line.split(",", -1);
                if (parts.length != 9) {
                    // invalid record length; skip
                    continue;
                }
                String username   = parts[0].trim();
                String password   = parts[1].trim();
                String fullName   = parts[2].trim();
                String email      = parts[3].trim();
                String phone      = parts[4].trim();
                String role       = parts[5].trim();
                String department = parts[6].trim();
                String subrole    = parts[7].trim();
                String id         = parts[8].trim();

                switch (role.toLowerCase()) {
                    case "customer":
                        users.add(new Customer(username, password, fullName, email, phone));
                        break;
                    case "admin":
                        users.add(new Admin   (username, password, fullName, email, phone));
                        break;
                    case "staff":
                        users.add(new Staff   (username, password, fullName, email, phone,
                                department, subrole, id));
                        break;
                    default:
                        // unknown role; skip
                        break;
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading users: " + e.getMessage());
            e.printStackTrace();
        }
        // keep sorted by username
        sortUsers();
    }

    private void saveUsers() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (User user : users) {
                // write all nine fields
                StringBuilder sb = new StringBuilder();
                sb.append(user.getUsername()).append(',')
                        .append(user.getPassword()).append(',')
                        .append(user.getFullName()).append(',')
                        .append(user.getEmail()).append(',')
                        .append(user.getPhone()).append(',')
                        .append(user.getRole()).append(',')
                        .append(user.getDepartment() == null ? "" : user.getDepartment()).append(',')
                        .append(user.getSubrole()    == null ? "" : user.getSubrole()).append(',')
                        .append(user.getId()         == null ? "" : user.getId());
                bw.write(sb.toString());
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving users: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void addUser(User user) {
        users.add(user);
        sortUsers();
        saveUsers();
    }

    public User getUser(String username) {
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        return null;
    }

    public void updateUser(User updatedUser) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUsername().equalsIgnoreCase(updatedUser.getUsername())) {
                users.set(i, updatedUser);
                sortUsers();
                saveUsers();
                return;
            }
        }
    }

    public boolean deleteUser(String username) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUsername().equalsIgnoreCase(username)) {
                users.remove(i);
                saveUsers();
                return true;
            }
        }
        return false;
    }

    public User authenticate(String username, String password) {
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)
                    && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    private void sortUsers() {
        Collections.sort(users, (u1, u2) ->
                u1.getUsername().compareToIgnoreCase(u2.getUsername())
        );
    }

    public LinkedList<User> getAllUsers() {

        return users;
    }
}
