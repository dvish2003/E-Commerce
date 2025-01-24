<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.25/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .register-btn {
            background-color: #28a745;
            color: #fff;
        }
        .register-btn:hover {
            background-color: #218838;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container">
        <h3 class="text-center mb-4">User Registration</h3>
        <%
            String message = request.getAttribute("message") != null ? (String) request.getAttribute("message") : null;
            String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : null;
        %>
        <% if (message != null) { %>
        <div class="alert alert-success"><%= message %></div>
        <% } %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="registerServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm your password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn register-btn">Register</button>
            </div>
            <div class="text-center mt-3">
                <a href="index.jsp" class="text-decoration-none">Already have an account? Login</a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.25/dist/sweetalert2.all.min.js"></script>

<script>
    <% if (request.getAttribute("success") != null) { %>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%= request.getAttribute("success") %>',
        confirmButtonText: 'OK'
    }).then(() => {
        window.location.href = "index.jsp";
    });
    <% } else if (request.getAttribute("error") != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%= request.getAttribute("error") %>',
        confirmButtonText: 'Try Again'
    });
    <% } %>
</script>
</body>
</html>
