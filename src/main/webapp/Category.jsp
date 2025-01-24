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
    </style>
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
