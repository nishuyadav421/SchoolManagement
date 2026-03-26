<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #1e272e; color: white; padding: 40px; }
        .table-card { background: #2c3e50; padding: 25px; border-radius: 12px; }
        .teal { color: #00d8d6; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mb-4"><i class="fa-solid fa-users teal"></i> Student Records
    
    
    
    
    </h2>
    <div class="table-card">
        <table class="table table-dark table-hover">
            <thead>
                <tr><th>Name</th><th>Age</th><th>Class</th><th>Actions</th></tr>
            </thead>
            <tbody>
                <% List<Student> list = (List<Student>) request.getAttribute("list");
                   if(list != null) { for(Student s : list) { %>
                    <tr>
                        <td><%= s.getName() %></td>
                        <td><%= s.getAge() %></td>
                        <td><%= s.getStudentClass() %></td>
                        <td>
                            <a href="deleteStudent?id=<%= s.getId() %>" class="text-danger" onclick="return confirm('Delete?')"><i class="fa-solid fa-trash"></i></a>
                        </td>
                    </tr>
                <% } } %>
            </tbody>
        </table>
        <a href="dashboard.jsp" class="btn btn-outline-info">Back to Dashboard</a>
    </div>
</div>
</body>
</html>