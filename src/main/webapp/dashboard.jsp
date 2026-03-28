
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.StudentDAO" %> 	
<%
    // Database se count fetch karna
    StudentDAO dao = new StudentDAO();
    int studentCount = dao.getTotalStudentsCount();
%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | School Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-dark: #1e272e;
            --card-dark: #2c3e50;
            --teal-accent: #00d8d6;
            --text-grey: #808e9b;
        }

        body {
            background-color: var(--bg-dark);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            margin: 0;
            display: flex;
        }

        .sidebar {
            width: 260px;
            height: 100vh;
            background-color: var(--card-dark);
            position: fixed;
            padding: 20px;
            box-shadow: 4px 0 10px rgba(0,0,0,0.3);
        }

        .sidebar-header {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #3d4e5f;
            margin-bottom: 20px;
        }

        .sidebar-header h3 {
            color: var(--teal-accent);
            font-size: 1.2rem;
            letter-spacing: 2px;
        }

        .nav-link {
            color: white;
            padding: 12px 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            transition: 0.3s;
            text-decoration: none;
        }

        .nav-link i {
            margin-right: 15px;
            width: 20px;
            color: var(--teal-accent);
        }

        .nav-link:hover, .nav-link.active {
            background-color: var(--bg-dark);
            border-left: 4px solid var(--teal-accent);
        }

        .main-content {
            margin-left: 260px;
            padding: 30px;
            width: 100%;
        }

        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .stat-card {
            background-color: var(--card-dark);
            border: none;
            border-radius: 10px;
            padding: 25px;
            transition: 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            font-size: 2.5rem;
            color: var(--teal-accent);
            opacity: 0.8;
        }

        .stat-val {
            font-size: 2rem;
            font-weight: bold;
        }

        .stat-label {
            color: var(--text-grey);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
        }

        .btn-action {
            background-color: transparent;
            border: 1.5px solid var(--teal-accent);
            color: var(--teal-accent);
            font-weight: bold;
            text-transform: uppercase;
            padding: 10px 20px;
        }

        .btn-action:hover {
            background-color: var(--teal-accent);
            color: var(--bg-dark);
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h3><i class="fa-solid fa-school"></i> SMS ADMIN</h3>
        </div>
        <nav>
            <a href="dashboard.jsp" class="nav-link active"><i class="fa-solid fa-gauge"></i> Dashboard</a>
            <a href="addStudent.jsp" class="nav-link"><i class="fa-solid fa-user-plus"></i> Add Student</a>
            <a href="viewStudents" class="nav-link"><i class="fa-solid fa-users-viewfinder"></i> View Students</a>
            <a href="#" class="nav-link"><i class="fa-solid fa-chalkboard-user"></i> Teachers</a>
            <a href="#" class="nav-link"><i class="fa-solid fa-file-invoice-dollar"></i> Fees</a>
            <a href="logout.jsp" class="nav-link text-danger mt-5"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </nav>
    </div>

    <div class="main-content">
        <div class="header-top">
            <div>
                <h1 class="h3">System Overview</h1>
                <p class="text-muted">Welcome back, Admin</p>
            </div>
            <div class="d-flex gap-3">
                <a href="addStudent.jsp" class="btn btn-action">Quick Add</a>
            </div>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="stat-card d-flex align-items-center justify-content-between">
                    <div>
                        <div class="stat-label">Total Students</div>
                        <%-- Dynamic Student Count Yahan Hai --%>
                        <div class="stat-val"><%= studentCount %></div>
                    </div>
                    <i class="fa-solid fa-user-graduate stat-icon"></i>
                </div>
            </div>
            <%-- Baaki cards abhi hardcoded hain --%>
            <div class="col-md-3">
                <div class="stat-card d-flex align-items-center justify-content-between">
                    <div>
                        <div class="stat-label">Teachers</div>
                        <div class="stat-val">48</div>
                    </div>
                    <i class="fa-solid fa-person-chalkboard stat-icon"></i>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card d-flex align-items-center justify-content-between">
                    <div>
                        <div class="stat-label">Total Classes</div>
                        <div class="stat-val">32</div>
                    </div>
                    <i class="fa-solid fa-door-open stat-icon"></i>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card d-flex align-items-center justify-content-between">
                    <div>
                        <div class="stat-label">Active Notices</div>
                        <div class="stat-val">12</div>
                    </div>
                    <i class="fa-solid fa-bullhorn stat-icon"></i>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="p-4 rounded-3" style="background-color: var(--card-dark);">
                    <h5 class="mb-4">Recent Management Tasks</h5>
                    <div class="d-flex gap-3">
                        <a href="addStudent.jsp" class="btn btn-outline-info">🚀 Register New Student</a>
                        <a href="viewStudents" class="btn btn-outline-info">📂 Access Student Database</a>
                        <a href="#" class="btn btn-outline-info">📊 Generate Report Cards</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>