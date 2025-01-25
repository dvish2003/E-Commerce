
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    Login login = loginDAO.getLastLogin();
    User user = userDAO.searchByEmail(login.getUserMail());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('webImage/Login back.png') no-repeat center center/cover;
            overflow: hidden;
            animation: page-transition 1s ease-in-out;
        }

        /* Page transition effect */
        @keyframes page-transition {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        /* Container */
        .container {
            width: 80%;
            max-width: 1000px;
            height: 70%;
            display: flex;
            border-radius: 30px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            color: #fff;
        }

        /* Image container */
        .image-container {
            width: 50%;
            position: relative;
            left: -18px;
            overflow: hidden;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            opacity: 0;
            animation: fade 12s infinite;
        }

        .image-container img:nth-child(1) {
            animation-delay: 0s;
        }

        .image-container img:nth-child(2) {
            animation-delay: 4s;
        }

        .image-container img:nth-child(3) {
            animation-delay: 8s;
        }

        @keyframes fade {
            0%, 100% {
                opacity: 0;
            }
            33% {
                opacity: 1;
            }
        }

        /* Form container */
        .form-container {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-container h3 {
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        .form-container .login-btn {
            color: #fff;
            background-color: black;
            border-radius: 20px;
            padding: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        /* Button hover effect */
        .form-container .login-btn:hover {
            background-color: gray;
            transform: scale(1.05);
        }

        .form-container .form-control {
            border-radius: 15px;
            transition: box-shadow 0.3s ease;
        }

        .form-container .form-control:focus {
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
            border-color: black;
        }

        .form-container .alert {
            margin-bottom: 20px;
        }

        .form-container .btn-success {
            border-radius: 20px;
        }

        /* Media queries for responsiveness */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
            }

            .image-container {
                width: 100%;
                height: 200px;
            }

            .form-container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="image-container">
        <img src="webImage/philipp-pilz-iQRKBNKyRpo-unsplash.jpg" alt="Image 1">
        <img src="webImage/philipp-pilz-QZ2EQuPpQJs-unsplash.jpg" alt="Image 2">
        <img src="webImage/Faroe%20Island%20with%20@andreknot%20-%20Aries%20Gold%20El%20Toro….jpeg" alt="Image 2">
        <img src="webImage/Foggy%20Hiking%20Adventure.jpeg" alt="Image 2">
        <img src="webImage/IMG_3562.JPG" alt="Image 2">
    </div>

    <!-- Right Login Container -->
    <div class="form-container">
        <h3 style="font-size: 35px; color: black;">Login To Mart</h3>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="loginServlet" method="post">

            <!-- Email input -->
            <div class="mb-3">
                <label for="username" class="form-label">Email</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your email" required>
            </div>
            <%
                String email = request.getParameter("username");
                User user1 = userDAO.searchByEmail(email);
            %>
            <!-- Password input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>


            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">
                    Remember Me
                </label>
            </div>

            <div class="d-grid mb-3">
                <button  type="submit" class="btn login-btn">Login</button>
            </div>
        </form>

        <!-- Register Link -->
        <div class="text-center mt-3">
            <a style="border-color: black; padding: 10px; border-radius: 20px;" href="UserRegister.jsp" class="btn btn-success d-block login-btn">Don't have an account? Register</a>
        </div>

        <!-- Forgot Password Link -->
        <div class="text-center mt-3">
            <a style="color: black; text-decoration: none;" href="UserUpdate.jsp">Forgot Password?</a>
        </div>
    </div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
