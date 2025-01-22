<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("homeProducts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    /* .card-img-wrapper {
         width: 100%;
         height: 200px;
         overflow: hidden;
         border-top-left-radius: 0.25rem; !* Match card border-radius *!
         border-top-right-radius: 0.25rem;
     }

     .card-img-top {
         width: 100%;
         height: 100%;
         object-fit: cover; !* Ensures the image covers the container while maintaining aspect ratio *!
         object-position: center; !* Centers the image *!
     }*/

</style>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VishMart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/CustomerHomeProduct">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserDelete.jsp">Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Log out</a>
                </li>
            </ul>
            <!-- Search Bar -->
            <form class="d-flex" action="SearchServlet" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search" aria-label="Search" required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<!-- Product Cards Section -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Our Products</h2>
    <div class="row">
        <% if (dataList != null && !dataList.isEmpty()) { %>
        <% for (ProductDTO productDTO : dataList) { %>
        <div class="col-md-4 col-lg-3 mb-4">
            <div class="card shadow-sm">
                <div class="card-img-wrapper">
                    <img src="asesst/<%= productDTO.getImagePath() %>" class="card-img-top" alt="<%= productDTO.getName() %>">
                </div>
                <div class="card-body">
                    <h5 class="card-title"><%= productDTO.getName() %></h5>
                    <p class="card-text">Price: $<%= productDTO.getPrice() %></p>
                    <p class="card-text">Available Stock: <%= productDTO.getQuantity() %></p>
                    <p class="card-text">Category: <%= productDTO.getCategory().getName() %></p>
                    <form action="AddToCartServlet" method="post">
                        <input type="hidden" name="productName" value="<%= productDTO.getName() %>">
                        <input type="hidden" name="productPrice" value="<%= productDTO.getPrice() %>">
                        <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
    </div>
</div>


<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


<%--
image path = 10 amazing Apple iPhone hacks you might not be aware of.jpeg
image path = ALISISTER Mens 3D Hoodies Funny Digital Print Hooded Pullover Sweatshirt With Fleece Plush S-XXL.jpeg
image path = Gerryellis Shoes men Sneakers Male casual Mens Shoes tenis Luxury shoes Trainer Race Breathable Shoes fashion loafers running Shoes for men 2093-39.jpeg
image path = Helmut Lang.jpeg
image path = Inspiration 67 _ Chairs — Saturday School.jpeg
image path = Reflective Techwear Shoes - Black _ 6_5 US _ 39 EU.jpeg
image path = URBAN TREK ELEVATE SNEAKERS - Gray _ 42.jpeg

--%>