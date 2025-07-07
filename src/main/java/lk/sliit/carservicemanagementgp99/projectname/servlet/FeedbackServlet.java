package lk.sliit.carservicemanagementgp99.projectname.servlet;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private static final String FILE_PATH = "C:\\Users\\ASUS\\Desktop\\ProjectFile/feedback.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String rating = request.getParameter("rating");
        String comments = request.getParameter("comments").trim().replaceAll("[\\r\\n]+", " ");

//write file
        try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_PATH, true))) {
            writer.println(name + "," + email + "," + rating + "," + comments);
        }

//success
        response.sendRedirect("feedback.jsp?success=true");
    }
}
