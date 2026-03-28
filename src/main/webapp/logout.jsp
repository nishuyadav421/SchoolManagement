<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. User ka session invalidate (khatam) karein
    session.invalidate();

    // 2. User ko turant login page par bhej dein
    response.sendRedirect("login.jsp");
%>