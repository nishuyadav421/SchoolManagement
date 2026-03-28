<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. User ka session invalidate (khatam) karein
    session.invalidate();

    // 2. User ko login page par redirect karein
    response.sendRedirect("login.jsp");
%>

</body>
</html>