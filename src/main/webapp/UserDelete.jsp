<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Account</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->
  <style>
    body {
      background-color: #121212; /* Dark background for the whole page */
      color: #eaeaea; /* Light text for contrast */
    }
    .forgot-password-container {
      max-width: 400px;
      margin: 50px auto;
      background: #1f1f1f; /* Dark background for the form container */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5); /* Darker shadow */
    }
    .submit-btn {
      background-color: #343a40; /* Dark background for the button */
      color: #fff; /* White text */
      border: none;
      border-radius: 4px;
      font-weight: bold;
      padding: 10px;
    }
    .submit-btn:hover {
      background-color: #495057; /* Slightly lighter shade of dark on hover */
      cursor: pointer;
    }
    .submit-btn:focus {
      outline: none; /* Remove outline on focus */
      box-shadow: 0 0 5px rgba(52, 58, 64, 0.5); /* Darker focus border */
    }
    .form-control {
      background-color: #2d2d2d; /* Dark input background */
      color: #fff; /* White text */
      border: 1px solid #555; /* Subtle border */
    }
    .form-control:focus {
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
      border-color: #007bff;
    }
    .alert {
      border-radius: 4px;
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
    <h3 class="text-center mb-4">Delete Account</h3>
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

    <form action="DeleteAccountServlet" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Enter Your Email</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your registered email" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="Enter new password" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn submit-btn">Delete Account</button>
      </div>
      <div class="text-center mt-3">
        <a href="UserUpdate.jsp" class="text-decoration-none">Forgot Password?</a>
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
