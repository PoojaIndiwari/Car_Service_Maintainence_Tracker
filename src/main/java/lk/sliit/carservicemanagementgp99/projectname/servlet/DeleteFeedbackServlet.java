package lk.sliit.carservicemanagementgp99.projectname.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.nio.file.*;
import java.util.*;

@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
    private static final String FEEDBACK_FILE = "C:\\Users\\pooja\\Desktop\\feedback.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        File inputFile = new File(FEEDBACK_FILE);
        File tempFile = new File("temp_feedback.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4 &&
                        parts[0].equals(name) &&
                        parts[1].equals(email) &&
                        parts[2].equals(rating) &&
                        parts[3].equals(comment)) {
                    continue; // skip line to delete
                }
                writer.write(line);
                writer.newLine();
            }
        }

//temp file update sadee
        Files.delete(inputFile.toPath());
        Files.move(tempFile.toPath(), inputFile.toPath());

        response.sendRedirect("viewFeedback.jsp");
    }
}

