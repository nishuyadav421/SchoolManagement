<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student | SMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #1e272e; color: white; padding: 50px; }
        .form-card { background: #2c3e50; padding: 30px; border-radius: 12px; max-width: 500px; margin: auto; }
        .teal { color: #00d8d6; }
        input { background: transparent !important; color: white !important; border: 1px solid #00d8d6 !important; }
    </style>
</head>
<body>
    <% Student s = (Student) request.getAttribute("student"); %>
    <div class="form-card shadow">
        <h2 class="teal mb-4 text-center">Update Student</h2>
        <form action="editStudent" method="post">
            <input type="hidden" name="id" value="<%= s.getId() %>">

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="<%= s.getName() %>" required>
            </div>
            <div class="mb-3">
                <label>Age</label>
                <input type="number" name="age" class="form-control" value="<%= s.getAge() %>" required>
            </div>
            <div class="mb-3">
                <label>Class</label>
                <input type="text" name="studentClass" class="form-control" value="<%= s.getStudentClass() %>" required>
            </div>
            <button type="submit" class="btn btn-info w-100">Save Changes</button>
            <a href="viewStudents" class="d-block text-center mt-3 text-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>