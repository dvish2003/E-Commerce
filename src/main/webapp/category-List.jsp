<%--
 * Author: Vishmee
 * Date: 1/16/25
 * Time: 11:39 PM
 * Description: Category Management Page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");
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
    <title>Category Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>

        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .alert {
            margin-top: 20px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .table td {
            text-align: center;
        }

        .btn-sm {
            font-size: 0.875rem;
        }

        .btn-warning, .btn-danger {
            display: inline-flex;
            align-items: center;
        }

        .btn-warning i, .btn-danger i {
            margin-right: 5px;
        }

        .table-striped tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Button Styles */
        .btn-custom {
            margin-right: 10px;
        }

        .table-responsive {
            margin-top: 30px;
        }

        .table-header {
            background-color: #4CAF50;
            color: white;
        }

        /* Alert box */
        .alert-info {
            color: #0d6efd;
        }

        .alert-success {
            color: #198754;
        }

        .alert-danger {
            color: #dc3545;
        }

        .alert-warning {
            color: #ffc107;
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

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Adventure Mart</a>
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
<div class="container">
    <h3 class="text-center mb-4">Category List</h3>

    <% if (alertMessage != null && alertType != null) { %>
    <div class="alert alert-<%= alertType %>" role="alert">
        <%= alertMessage %>
    </div>
    <% } %>

    <% if (dataList != null && !dataList.isEmpty()) { %>
    <div class="table-responsive">
        <table class="table table-striped table-bordered shadow-sm">
            <thead class="table-header">
            <tr>
                <th>#</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (CategoryDTO categoryDTO : dataList) { %>
            <tr>
                <td><%= categoryDTO.getCategoryId() %></td>
                <td><%= categoryDTO.getName() %></td>
                <td>
                    <button class="btn btn-warning btn-sm btn-custom" onclick="editCategory(<%= categoryDTO.getCategoryId() %>, '<%= categoryDTO.getName() %>')">
                        <i class="bi bi-pencil"></i> Edit
                    </button>
                    <button class="btn btn-danger btn-sm btn-custom" onclick="deleteCategory(<%= categoryDTO.getCategoryId() %>)">
                        <i class="bi bi-trash"></i> Delete
                    </button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <p class="text-center text-muted">No categories found.</p>
    <% } %>

</div>

<script>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
