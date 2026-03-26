package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Student;
import dao.StudentDAO;

@WebServlet("/editStudent")
public class EditStudentServlet extends HttpServlet {
    
    // 1. Fetch data and show the edit form
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // 1. Get the ID from the URL (e.g., ?id=5)
	    String idParam = req.getParameter("id");
	    
	    if (idParam != null) {
	        int id = Integer.parseInt(idParam);
	        
	        // 2. Fetch the student using your new DAO method
	        Student s = StudentDAO.getStudentById(id);
	        
	        // 3. DEBUG: Check your console to see if the student was actually found
	        System.out.println("EditServlet: Finding student " + id + " -> " + (s != null ? s.getName() : "NOT FOUND"));

	        // 4. CRITICAL: This name "student" must match your JSP
	        req.setAttribute("student", s); 
	        
	        // 5. Forward to the JSP
	        req.getRequestDispatcher("editStudent.jsp").forward(req, resp);
	    } else {
	        resp.sendRedirect("viewStudents");
	    }
	}
}