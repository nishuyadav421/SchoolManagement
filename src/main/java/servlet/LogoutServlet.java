package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Session ko pakdo
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. Session ko khatam (Delete) karo
            session.invalidate();
        }
        
        // 3. Wapas login page par bhej do
        response.sendRedirect("login.jsp");
    }
}