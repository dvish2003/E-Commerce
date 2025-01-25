<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->
    <style>
        body {
            background-color: #121212; /* Dark background for the entire page */
            color: #eaeaea; /* Light text for contrast */
        }
        .forgot-password-container {
            max-width: 400px;
            margin: 50px auto;
            background: #1f1f1f; /* Dark background for the form container */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5); /* Darker shadow for a sleek look */
        }
        .submit-btn {
            background-color: #007bff; /* Blue background */
            color: #fff; /* White text */
            border: none;
            border-radius: 4px;
            font-weight: bold;
            padding: 10px;
        }
        .submit-btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
            cursor: pointer;
        }
        .submit-btn:focus {
            outline: none; /* Remove outline on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Add blue focus shadow */
        }
        .form-control {
            background-color: #2d2d2d; /* Dark background for inputs */
            color: #fff; /* White text in inputs */
            border: 1px solid #555; /* Subtle border */
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Focus effect with blue shadow */
            border-color: #007bff; /* Blue border on focus */
        }
        .alert {
            border-radius: 4px; /* Rounded corners for alert */
        }
        .text-center a {
            color: #007bff; /* Blue color for links */
        }
        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="forgot-password-container">
        <h3 class="text-center mb-4">Forgot Password</h3>
        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");
        %>
        <% if (message != null) { %>
        <div class="alert alert-success"><%= message %></div>
        <% } %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="ForgotPasswordServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Enter Your Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your registered email" required>
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter new password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Re-enter new password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn submit-btn">Change Password</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <% if (message != null) { %>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%= message %>',
    });
    <% } else if (error != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%= error %>',
    });
    <% } %>
</script>
</body>
</html>
