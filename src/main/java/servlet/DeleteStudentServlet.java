package servlet;

import java.io.*;
import dao.StudentDAO;
import jakarta.servlet.annotation.WebServlet;   
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteStudent")   
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            StudentDAO.deleteStudent(id);

           
            resp.sendRedirect(req.getContextPath() + "/viewStudents");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}