<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.Entity.Product" %>

<%
/*
    List<Product> cart = (List<Product>) session.getAttribute("cart");
*/
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
%>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<head>
    <title>Cart</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VishMart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Category.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="Cart.jsp">Cart <%--<span style="color: #4CAF50; font-size: 15px" class="badge badge-danger">${cart.size()}</span>--%></a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <form class="d-flex" action="" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search" aria-label="Search" required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center">Your Cart</h1>

    <% if (alertType != null && alertMessage != null) { %>
    <div class="alert alert-<%= alertType %>">
        <%= alertMessage %>
    </div>
    <% } %>

    <% if (cart == null || cart.isEmpty()) { %>
    <p class="text-center mt-4">Your cart is empty. <a href="index.jsp">Start shopping!</a></p>
    <% } else { %>
    <form action="CheckoutServlet" method="post">
        <table class="table table-bordered table-hover mt-4">
            <thead class="table-light">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% double totalAmount = 0.0; %>
            <% for (Product product : cart) {
                double productTotal = product.getPrice(); // Total price of a product
                totalAmount += productTotal;
            %>
            <tr>
                <td><%= product.getName() %></td>
                <td>$<%= product.getPrice() %></td>
                <td>
                    <button type="button" class="btn btn-sm btn-warning" onclick="updateQuantity('<%= product.getName() %>', 'decrease')">-</button>
                    <input type="number" id="quantity_<%= product.getName() %>" value="1" class="form-control d-inline-block" style="width: 50px;" oninput="updateTotal('<%= product.getName() %>', this.value)">
                    <button type="button" class="btn btn-sm btn-success" onclick="updateQuantity('<%= product.getName() %>', 'increase')">+</button>
                </td>

                <td>$<%= productTotal %></td>
                <td>
                    <form action="RemoveFromCartServlet" method="post">
                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <div class="text-right">
            <h4>Total: $<%= totalAmount %></h4>
            <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
        </div>
    </form>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
