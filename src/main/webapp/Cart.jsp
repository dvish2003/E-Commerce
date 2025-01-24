
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%@ page import="lk.ijse.DTO.CartDTO" %>

<%
    List<CartDTO> cartList = (List<CartDTO>) request.getAttribute("cartList");
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    Login login = loginDAO.getLastLogin();
    User user = userDAO.searchByEmail(login.getUserMail());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <title>Cart List</title>
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
            <%if(user.getRole().equals("Admin")){%>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Category.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <%} else if (user.getRole().equals("Customer")) {%>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <%}%>
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

    <% if (cartList.isEmpty()) { %>
    <p class="text-center mt-4">Your cart is empty. <a href="${pageContext.request.contextPath}/homeProduct">Start shopping!</a></p>
    <% } else { %>
    <form action="CheckoutServlet" method="get">
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
            <% for (CartDTO cart : cartList) {
                double productTotal = cart.getProduct().getPrice() * cart.getQuantity();
                totalAmount += productTotal;
            %>
            <tr>
                <td><%= cart.getProduct().getName() %></td>
                <td>$<%= cart.getProduct().getPrice() %></td>
                <td><%= cart.getQuantity() %></td>
                <td>$<%= productTotal %></td>
                <td>
                    <form action="RemoveFromCartServlet" method="post">
                        <input type="hidden" name="cartId" value="<%= cart.getCartId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
<div class="text-right">
            <form action="CheckoutServletButton" method="post">
                <h4>Total: $<%= totalAmount %></h4>
                <input type="hidden" name="total" value="<%= totalAmount %>">
                <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
            </form>
        </div>
    </form>
    <% } %>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const alertType = '<%= alertType != null ? alertType : "" %>';
    const alertMessage = '<%= alertMessage != null ? alertMessage.replace("'", "\\'") : "" %>';

    if (alertType && alertMessage) {
        Swal.fire({
            icon: alertType, // Expected types: 'success', 'error', 'warning', 'info', 'question'
            title: alertType.charAt(0).toUpperCase() + alertType.slice(1),
            text: alertMessage,
            confirmButtonText: 'OK'
        }).then(() => {
            // Redirect if the alertType is 'success' (optional)
            if (alertType === 'success') {
                window.location.href = '<%= request.getContextPath() %>/homeProduct'; // Redirect after success
            }
        });
    }
</script>

</body>
</html>
