<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Student | SMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-dark: #1e272e;
            --card-dark: #2c3e50;
            --teal-accent: #00d8d6;
        }

        body {
            background-color: var(--bg-dark);
            color: white;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .form-card {
            background-color: var(--card-dark);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.6);
            border: 1px solid rgba(255,255,255,0.05);
        }

        .teal-text { color: var(--teal-accent); }

        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: #d1d8e0;
        }

        /* Custom Input Styling */
        .form-control {
            background-color: #1e272e !important;
            border: 1.5px solid #3d4e5f !important;
            color: white !important;
            padding: 12px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .form-control:focus {
            border-color: var(--teal-accent) !important;
            box-shadow: 0 0 8px rgba(0, 216, 214, 0.3) !important;
            outline: none;
        }

        .btn-add {
            background-color: var(--teal-accent);
            color: var(--bg-dark);
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            margin-top: 20px;
            border: none;
            transition: 0.3s;
        }

        .btn-add:hover {
            background-color: #00f2f0;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 216, 214, 0.4);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #95a5a6;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .back-link a:hover { color: var(--teal-accent); }

        .icon-header {
            font-size: 3rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="form-card">
    <div class="text-center">
        <div class="icon-header teal-text">
            <i class="fa-solid fa-user-plus"></i>
        </div>
        <h3 class="mb-4">Add New <span class="teal-text">Student</span></h3>
    </div>

    <form action="addStudent" method="post">
        <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-user me-2"></i>Full Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter student name" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-calendar-day me-2"></i>Age</label>
            <input type="number" name="age" class="form-control" placeholder="Enter age" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa-solid fa-graduation-cap me-2"></i>Class</label>
            <input type="text" name="studentClass" class="form-control" placeholder="Example: 12th B" required>
        </div>

        <button type="submit" class="btn btn-add">
            <i class="fa-solid fa-save me-2"></i> Save Student
        </button>
    </form>

    <div class="back-link">
        <a href="viewStudents"><i class="fa-solid fa-arrow-left me-1"></i> Back to Student List</a>
    </div>
</div>

</body>
</html>