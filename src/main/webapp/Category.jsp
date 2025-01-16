<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="lk.ijse.Entity.User" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
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
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VishMart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Category.jsp">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products</a>
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

<div class="container">
    <h2 class="text-center mb-4">Category Management</h2>
    <form action="CategoryServlet" method="post">
        <div class="mb-3">
            <label for="categoryID" class="form-label">Category ID</label>
            <input type="text" class="form-control" name="categoryID" id="categoryID" placeholder="Enter category ID" required>

            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" name="categoryName" id="categoryName" placeholder="Enter category name" required>
        </div>
        <input type="hidden" name="action" id="action" value="add">
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success" onclick="setAction('add')">Add</button>
            <button type="submit" class="btn btn-primary" onclick="setAction('update')">Update</button>
            <button type="submit" class="btn btn-danger" onclick="setAction('delete')">Delete</button>
        </div>
    </form>
</div>

<script>
    function setAction(action) {
        document.getElementById('action').value = action;
    }

    function editCategory(id, name) {
        document.getElementById('categoryId').value = id;
        document.getElementById('categoryName').value = name;
        setAction('update');
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

