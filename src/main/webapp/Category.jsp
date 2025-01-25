<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
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

        /* Add rounded corners to the input fields */
        .form-control {
            border-radius: 0.375rem;
        }

        /* Button styles */
        .btn {
            border-radius: 0.375rem;
            transition: background-color 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        /* Button with text on hover effect */
        .btn-secondary a {
            color: white;
            text-decoration: none;
        }

        .btn-secondary a:hover {
            color: #f8f9fa;
        }

        /* Card container for categories */
        .card-columns {
            column-count: 3;
            column-gap: 1.5rem;
        }

        .card {
            margin-bottom: 1.5rem;
            border-radius: 0.375rem;
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
<div class="container mt-5">
    <div class="card shadow-sm p-4">
        <h2 class="text-center mb-4">Category Management</h2>
        <form action="CategoryServlet" method="post">
            <div class="mb-3">
                <label for="categoryID" class="form-label">Category ID</label>
                <input type="number" class="form-control" name="categoryID" id="categoryID" placeholder="Enter category ID" required>
                <label for="categoryName" class="form-label mt-3">Category Name</label>
                <input type="text" class="form-control" name="categoryName" id="categoryName" placeholder="Enter category name">
            </div>
            <input type="hidden" name="action" id="action" value="add">
            <div class="d-flex justify-content-center gap-3 mt-4">
                <button type="submit" class="btn btn-success px-4" onclick="setAction('add')">Add</button>
                <button type="submit" class="btn btn-primary px-4" onclick="setAction('update')">Update</button>
                <button type="submit" class="btn btn-danger px-4" onclick="setAction('delete')">Delete</button>
            </div>
        </form>
        <button id="#getAll" type="submit" class="btn btn-secondary px-4 mt-3"><a href="${pageContext.request.contextPath}/category-List">View All</a></button>
    </div>
</div>

<script>
    function setAction(action) {
        document.getElementById('action').value = action;
    }

    <% if (!Objects.isNull(alertType) && !Objects.isNull(alertMessage)) { %>
    Swal.fire({
        icon: '<%= alertType %>',
        title: '<%= alertMessage %>',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Dark theme background */
        body {
            background: linear-gradient(to right, #000000, #434343); /* Dark gradient */
            color: #f8f9fa; /* Light text color */
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

        body {
            background: url("webImage/Screenshot from 2025-01-25 01-45-26.png");
            background-size: cover;
            background-position: center;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            margin-bottom: 15px;
            box-shadow: inset 0 0 8px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }

        .btn {
            border-radius: 10px;
            padding: 10px 20px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-success {
            background-color: black;
            border-color: black;
        }

        .btn-success:hover {
            background-color: black;
            border-color: black;
        }

        .btn-primary {
            background-color: black;
            border-color: black;
        }

        .btn-primary:hover {
            background-color: gray;
            border-color: gray;
        }

        .btn-danger {
            background-color: black;
            border-color: black;
        }

        .btn-danger:hover {
            background-color: gray;
            border-color: gray;
        }

        .d-flex button {
            margin-left: 10px;
        }

        .btn-secondary a {
            color: white;
            text-decoration: none;
        }

        .btn-secondary a:hover {
            color: #f8f9fa;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
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
            <% if (user.getRole().equals("Admin")) { %>
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
            <form class="d-flex" action="" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search" aria-label="Search" required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<br>
<div class="form-container">
    <h2 class="text-center mb-4" style="color: black">Category Management</h2>
    <form action="CategoryServlet" method="post">
        <div class="mb-3">
            <label for="categoryID" class="form-label">Category ID</label>
            <input type="number" class="form-control" name="categoryID" id="categoryID" placeholder="Enter category ID" required>
        </div>
        <div class="mb-3">
            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" name="categoryName" id="categoryName" placeholder="Enter category name" required>
        </div>
        <input type="hidden" name="action" id="action" value="add">
        <div class="d-flex justify-content-center mt-4">
            <button type="submit" class="btn btn-success px-4" onclick="setAction('add')">Add</button>
            <button type="submit" class="btn btn-primary px-4" onclick="setAction('update')">Update</button>
            <button type="submit" class="btn btn-danger px-4" onclick="setAction('delete')">Delete</button>
        </div>
    </form>
    <div class="d-flex justify-content-center mt-3">
        <button id="#getAll" type="submit" class="btn btn-secondary px-4"><a href="${pageContext.request.contextPath}/category-List">View All</a></button>
    </div>
</div>
<script>
    function setAction(action) {
        document.getElementById('action').value = action;
    }

    <% if (!Objects.isNull(alertType) && !Objects.isNull(alertMessage)) { %>
    Swal.fire({
        icon: '<%= alertType %>',
        title: '<%= alertMessage %>',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
