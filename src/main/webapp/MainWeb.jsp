<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>

<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("homeProducts");
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    Login login = loginDAO.getLastLogin();
    User user = login != null ? userDAO.searchByEmail(login.getUserMail()) : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forest Lover Online Mart</title>

    <!-- External Stylesheets -->
    <link rel="icon" href="${pageContext.request.contextPath}/Asset/icons/Untitled%20design.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/file/normalize.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Inline Styles -->
    <style>
        /* Slider Animation */
        @keyframes slider {
            0% { background-image: url("${pageContext.request.contextPath}/webImage/LihNREN-hd-wallpapers-1080.jpg"); }
            33% { background-image: url("${pageContext.request.contextPath}/webImage/Login back.png"); }
            66% { background-image: url("${pageContext.request.contextPath}/webImage/Screenshot from 2025-01-25 01-45-44.png"); }
            100% { background-image: url("${pageContext.request.contextPath}/webImage/Screenshot from 2025-01-25 01-46-01.png"); }
        }

        #home {
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            animation: slider 15s infinite;
        }

        .btn-brand {
            font-weight: 600;
            text-transform: uppercase;
            padding: 10px 24px;
            border-radius: 0;
            border: 1px solid white;
        }

        .btn-brand-white {
            background: white;
            color: black;
        }

        .btn-brand-transparent {
            background: gray;
            color: white;
        }

        .btn-brand-white:hover {
            background: black;
            color: gray;
        }

        .btn-brand-transparent:hover {
            color: lightgray;
        }

        #welcome {
            color: white;
            font-weight: 600;
        }

        #para-1 {
            color: white;
            font-size: 30px;
        }
        .about {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 50px;
            background-color: #f4f4f4;
            animation: fadeIn 2s ease-in-out;
        }

        .about .container {
            flex: 1;
            max-width: 60%;
            animation: slideIn 1s ease-out;
        }

        .about h1 {
            font-size: 3rem;
            color: #333;
            margin-bottom: 20px;
            animation: fadeInUp 1.5s ease-out;
        }

        .about p {
            font-size: 1.2rem;
            color: #555;
            line-height: 1.6;
            margin-bottom: 15px;
            animation: fadeInUp 1.8s ease-out;
        }

        .about-img {
            max-width: 40%;
            height: auto;
            border-radius: 10px;
            animation: slideInRight 1s ease-out;
        }
        /* Footer Styles */
        .footer {
            background-color: #333;
            color: white;
            padding: 40px 0;
            font-size: 1rem;
        }

        .footer .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer .footer-content {
            text-align: center;
        }

        .footer p {
            margin: 10px 0;
        }

        .footer .social-links {
            margin: 20px 0;
        }

        .footer .social-icon {
            color: white;
            font-size: 1.5rem;
            margin: 0 15px;
            text-decoration: none;
        }

        .footer .social-icon:hover {
            color: #007bff;
        }

        @media (max-width: 768px) {
            .footer p {
                font-size: 0.9rem;
            }

            .footer .social-icon {
                font-size: 1.3rem;
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            0% {
                transform: translateX(-50px);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            0% {
                transform: translateY(20px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideInRight {
            0% {
                transform: translateX(50px);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }


        @media (max-width: 768px) {
            #home {
                text-align: center;
                padding: 2rem;
            }

            .home_section h1 {
                font-size: 2.5rem;
            }

            .btn {
                font-size: 16px;
                padding: 8px 20px;
            }
        }
    </style>
</head>
<body>
<header class="header"></header>

<!-- Home Section -->
<section class="home_section d-flex align-items-center text-center" id="home">
    <div class="container">
        <h1 class="text-uppercase fw-semibold display-1" id="welcome">Welcome to Forest Lover</h1>
        <h5 id="para-1">Discover top-quality hiking tools and adventure gear for transparentyour next journey.</h5>
        <br>
        <div>
            <% if (user != null) { %>
            <% if ("Admin".equals(user.getRole())) { %>
            <a href="${pageContext.request.contextPath}/homeProduct" class="btn btn-brand btn-brand-white">Shop NOW and ENJOY</a>
            <% } else if ("Customer".equals(user.getRole())) { %>
            <a href="${pageContext.request.contextPath}/CustomerHomeProduct" class="btn btn-brand btn-brand-white">Shop NOW and ENJOY</a>
            <% } %>
            <% } %>
        </div>
    </div>
</section>
<section class="about">
    <div class="container">
        <h1 class="text-uppercase fw-semibold display-4">About Forest Lover</h1>
        <p>Forest Lover Online Mart is a leading online store dedicated to providing high-quality hiking tools and adventure gear. Our mission is to help users discover new and exciting hiking destinations, while also fostering a community of like-minded individuals who share our passion for exploration and adventure. We offer a wide range of gear, from trekking poles to backpacks, designed for every type of adventurer. Whether you're a beginner or an experienced hiker, we have something to suit your needs.</p>
        <p>Our team consists of hiking enthusiasts who understand the importance of reliable and durable equipment. Every product in our store is carefully selected based on quality, functionality, and sustainability. We work with trusted suppliers to ensure that our customers receive the best gear for their outdoor pursuits. At Forest Lover, we are also committed to promoting eco-friendly practices. We encourage our customers to adopt sustainable hiking habits, and we strive to minimize our environmental impact through the products we offer and the packaging we use.</p>
        <p>We believe that hiking is not just a physical activity, but a lifestyle. It's about connecting with nature, pushing your limits, and finding peace in the great outdoors. Our goal is to be more than just a store; we aim to be a source of inspiration for those who are passionate about hiking and the natural world. Join our community today and start your next adventure with Forest Lover!</p>
    </div>
    <img src="webImage/pexels-ozgomz-925263.jpg" alt="Forest Lover" class="about-img">
</section>
<!-- Footer Section -->
<footer class="footer">
    <div class="container text-center">
        <div class="footer-content">
            <p>&copy; 2025 Forest Lover Online Mart. All Rights Reserved.</p>
            <div class="social-links">
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p>Contact Us: info@forestlover.com | +94 72 503 8727</p>
        </div>
    </div>
</footer>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const images = [
        "${pageContext.request.contextPath}/webImage/LihNREN-hd-wallpapers-1080.jpg",
        "${pageContext.request.contextPath}/webImage/Login back.png",
        "${pageContext.request.contextPath}/webImage/Screenshot from 2025-01-25 01-45-44.png",
        "${pageContext.request.contextPath}/webImage/Screenshot from 2025-01-25 01-46-01.png"
    ];
    let currentIndex = 0;
    const homeSection = document.getElementById("home");

    setInterval(() => {
        currentIndex = (currentIndex + 1) % images.length;
        homeSection.style.backgroundImage = `url(${images[currentIndex]})`;
    }, 5000);
</script>
</body>
</html>
