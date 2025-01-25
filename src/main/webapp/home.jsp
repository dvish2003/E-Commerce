<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("homeProducts");
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
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Custom Styles */
        .product-card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .card-img-wrapper {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .product-image {
            height: 100%;
            width: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .product-card:hover .product-image {
            transform: scale(1.1);
        }

        .add-to-cart-btn {
            background-color: black;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background-color: gray;
        }

        .quantity-input {
            text-align: center;
            border: 1px solid #ddd;
        }

        .card-title {
            font-size: 1.1rem;
            color: #333;
        }

        .card-text {
            color: #666;
            font-size: 0.9rem;
        }

        .navbar {
            background: linear-gradient(to right, #000000, #434343); /* Black to dark gray gradient */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        .navbar .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
        }

        .navbar-nav .nav-item .nav-link {
            color: #fff;
            font-size: 1.1rem;
            font-weight: 500;
            padding: 12px 18px;
            transition: background-color 0.3s ease;
        }

        .navbar-nav .nav-item .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .navbar-nav .nav-item .nav-link.active {
            background-color: rgba(0, 0, 0, 0.2);
            color: #fff;
        }

        .form-control {
            border-radius: 20px;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        .btn-outline-success {
            color: black;
            border-color: black;
            border-radius: 20px;
            padding: 8px 20px;
        }

        .btn-outline-success:hover {
            background-color: gray;
            color: #fff;
        }

        section {
            background-image: radial-gradient(circle at center, #E6E6FA, #D1C4E9);
        }
        .Card{
            position: relative;
            top: -50px;
        }

    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Adventure Mart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <% if(user.getRole().equals("Admin")) { %>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Category.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <% } else if (user.getRole().equals("Customer")) { %>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <% } %>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<!-- Products Section -->
<section class="Card">
    <div class="container mt-5">
        <br>
        <h2 class="text-center mb-4">Adventuring Products</h2>
        <div class="row">
            <% if (dataList != null && !dataList.isEmpty()) { %>
            <% for (ProductDTO productDTO : dataList) { %>
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="card product-card shadow-sm position-relative">
                    <div class="card-img-wrapper overflow-hidden">
                        <img src="asesst/<%= productDTO.getImagePath() %>" class="card-img-top product-image" alt="<%= productDTO.getName() %>">
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title fw-bold"><%= productDTO.getName() %></h5>
                        <p class="card-text text-muted">Price: $<%= productDTO.getPrice() %></p>
                        <p class="card-text small text-truncate">Description: <%= productDTO.getDescription() %></p>
                        <form action="AddToCartServlet" method="post">
                            <div class="quantity-wrapper mb-3 d-flex justify-content-center align-items-center">
                                <label for="quantity_<%= productDTO.getProductId() %>" class="me-2">Qty:</label>
                                <input type="number" id="quantity_<%= productDTO.getProductId() %>"
                                       name="quantity"
                                       class="form-control text-center quantity-input"
                                       style="width: 100px;"
                                       min="1"
                                       max="<%= productDTO.getQuantity() %>"
                                       required>
                            </div>
                            <p class="card-text small text-muted">Available Stock: <%= productDTO.getQuantity() %></p>
                            <p class="card-text small text-muted">Category: <%= productDTO.getCategory().getName() %></p>
                            <input type="hidden" name="productName" value="<%= productDTO.getName() %>">
                            <input type="hidden" name="productPrice" value="<%= productDTO.getPrice() %>">
                            <button type="submit" class="btn btn-primary w-100 add-to-cart-btn">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
            <% } %>
            <% } else { %>
            <div class="col-12">
                <p class="text-center text-muted">No products available.</p>
            </div>
            <% } %>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const alertType = '<%= alertType != null ? alertType : "" %>';
    const alertMessage = '<%= alertMessage != null ? alertMessage : "" %>';

    if (alertType && alertMessage) {
        Swal.fire({
            icon: alertType,
            title: alertType.charAt(0).toUpperCase() + alertType.slice(1),
            text: alertMessage,
            confirmButtonText: 'OK'
        }).then(() => {
            if (alertType === 'success') {
                window.location.href = "home.jsp";
            }
        });
    }
</script>

</body>
</html>
