<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .login-btn {
            color: #fff;
            background-color: #007bff;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h3 class="text-center mb-4">Login</h3>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="loginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Email</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="d-grid">
                <a href="${pageContext.request.contextPath}/homeProduct" type="submit" class="btn login-btn">Login</a>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="UserRegister.jsp" class="btn btn-success d-block">Don't have an account? Register</a>
        </div>
        <div class="text-center mt-3">
            <a href="UserUpdate.jsp" class="text-decoration-none">Forgot Password?</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
