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

<!-- Optional JavaScript -->
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
