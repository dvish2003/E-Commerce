<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('webImage/Screenshot from 2025-01-25 01-45-26.png') no-repeat center center/cover;
            overflow: hidden;
            animation: page-transition 1s ease-in-out;
        }

        @keyframes page-transition {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

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

        .image-container {
            width: 50%;
            position: relative;
            overflow: hidden;
            left: -18px;
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
            color: black;
            font-size: 35px;
        }

        .form-container .register-btn {
            color: #fff;
            background-color: black;
            border-radius: 20px;
            padding: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .form-container .register-btn:hover {
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

    <div class="form-container">
        <h3>User Registration</h3>

        <% String message = request.getAttribute("message") != null ? (String) request.getAttribute("message") : null; %>
        <% String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : null; %>

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
                <a style="border-color: black" href="index.jsp" class="btn btn-success d-block register-btn">Already have an account? Login</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
