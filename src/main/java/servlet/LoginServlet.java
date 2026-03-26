package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;
import util.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        // 1. Use try-with-resources to automatically close DB connections
        // This prevents the "Too many connections" error in MySQL
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user);
            ps.setString(2, pass);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // LOGIN SUCCESS
                    HttpSession session = req.getSession();
                    session.setAttribute("adminUser", user); // Consistent with our dashboard code
                    resp.sendRedirect("dashboard.jsp");
                } else {
                    // LOGIN FAIL - Send message back to login.jsp
                    req.setAttribute("errorMessage", "Invalid Admin Credentials!");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle DB connection issues
            req.setAttribute("errorMessage", "Database Connection Error!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}