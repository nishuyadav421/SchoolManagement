package servlet;
import java.io.*;
import java.util.*;
import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
@WebServlet("/viewStudents") 
public class ViewsStudentServlet extends HttpServlet {
	
	
	

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        try {
            System.out.println("--- Servlet Start: Fetching Students ---");
            
            List<Student> list = StudentDAO.getAllStudents();
            
            // This will show up in your Eclipse Console tab
            if (list == null) {
                System.out.println("DEBUG: The list is NULL!");
            } else {
                System.out.println("DEBUG: Fetched " + list.size() + " students.");
            }

            req.setAttribute("list", list);
            req.getRequestDispatcher("viewStudents.jsp").forward(req, resp);

        } catch (Exception e) {
            System.out.println("SERVLET ERROR: " + e.getMessage());
            e.printStackTrace();
        }
    }
}