<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - School Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            background-color: #1e272e; /* Dark background from image */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #ffffff;
        }

        .login-card {
            background-color: #2c3e50; /* Slightly lighter card color */
            padding: 40px;
            border-radius: 4px;
            width: 350px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .icon-container {
            color: #00d8d6; /* The teal/cyan color */
            font-size: 50px;
            margin-bottom: 10px;
            transform: rotate(-45deg); /* Tilting the key like the image */
        }

        h2 {
            letter-spacing: 2px;
            font-size: 1.5rem;
            margin-bottom: 40px;
            font-weight: 400;
        }

        .input-group {
            position: relative;
            margin-bottom: 30px;
            text-align: left;
        }

        .input-group label {
            display: block;
            color: #808e9b;
            font-size: 10px;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .input-group input {
            width: 100%;
            background: none;
            border: none;
            border-bottom: 1.5px solid #00d8d6;
            color: white;
            padding: 5px 0;
            outline: none;
            font-size: 16px;
        }

        /* Error message styling */
        .error-msg {
            color: #ff5e57;
            font-size: 12px;
            margin-bottom: 15px;
        }

        .login-btn {
            background: none;
            border: 1.5px solid #00d8d6;
            color: #00d8d6;
            padding: 8px 25px;
            cursor: pointer;
            font-weight: bold;
            float: right;
            transition: 0.3s;
            text-transform: uppercase;
        }

        .login-btn:hover {
            background-color: #00d8d6;
            color: #2c3e50;
        }
        
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="icon-container">
            <i class="fa-solid fa-key"></i>
        </div>
        
        <h2>ADMIN PANEL</h2>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-msg"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <form action="login" method="post" class="clearfix">
            <div class="input-group">
                <label>USERNAME</label>
                <input type="text" name="username" required autocomplete="off">
            </div>

            <div class="input-group">
                <label>PASSWORD</label>
                <input type="password" name="password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>

</body>
</html>