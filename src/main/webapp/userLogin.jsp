<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .login-btn {
            background-color: #007bff;
            color: #fff;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }
        .register-btn {
            background-color: #28a745;
            color: #fff;
        }
        .register-btn:hover {
            background-color: #218838;
        }
        .deactivate-btn {
            background-color: #dc3545;
            color: #fff;
        }
        .deactivate-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h3 class="text-center mb-4">Login</h3>
        <form action="loginServlet" method="post"> <!-- JSP Form Submission -->
            <!-- Username/Email -->
            <div class="mb-3">
                <label for="username" class="form-label">Username or Email</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username or email" required>
            </div>
            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <!-- Remember Me -->
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="rememberMe" id="rememberMe">
                <label class="form-check-label" for="rememberMe">Remember Me</label>
            </div>
            <!-- Login Button -->
            <div class="d-grid">
                <button type="submit" class="btn login-btn">Login</button>
            </div>
        </form>
        <!-- Register & Deactivate Buttons -->
        <div class="text-center mt-3">
            <a href="register.jsp" class="btn register-btn d-block mb-2">Don't have an account? Register</a>
            <a href="deactivate.jsp" class="btn deactivate-btn d-block">Deactivate Account</a>
        </div>
        <!-- Forgot Password -->
        <div class="text-center mt-3">
            <a href="forgotPassword.jsp" class="text-decoration-none">Forgot Password?</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
--%>

