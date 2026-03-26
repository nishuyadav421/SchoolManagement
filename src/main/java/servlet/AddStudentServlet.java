package servlet;
import java.io.*;
import model.Student;
import dao.StudentDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            Student s = new Student();
            s.setName(req.getParameter("name"));
            s.setAge(Integer.parseInt(req.getParameter("age")));
            s.setStudentClass(req.getParameter("class"));

            StudentDAO.addStudent(s);

         
            resp.sendRedirect(req.getContextPath() + "/viewStudents");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}