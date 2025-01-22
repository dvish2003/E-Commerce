<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <title>Product Management</title>
    <style>
        body {
            background: linear-gradient(to bottom, #f0f4ff, #e0e7ff);
            font-family: Arial, sans-serif;
        }
        nav {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container {
            margin-top: 100px;
        }
        .form-section {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-danger {
            background-color: #dc3545;
        }
        footer {
            background: #343a40;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
        }
        footer a {
            color: #ffc107;
            text-decoration: none;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="home.jsp">Product Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/homeProduct"><i class="bi bi-house-fill"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductAdd.jsp"><i class="bi bi-plus-square-fill"></i> Add Product</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductUpdate.jsp"><i class="bi bi-pencil-fill"></i> Update Product</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductDelete.jsp"><i class="bi bi-trash-fill"></i> Delete Product</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List"><i class="bi bi-list"></i>Product List</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <% if (alertType != null && alertMessage != null) { %>
    <div class="alert alert-<%= alertType %> alert-dismissible fade show mt-4" role="alert">
        <i class="bi <%= alertType.equals("success") ? "bi-check-circle-fill" : "bi-exclamation-circle-fill" %>"></i>
        <%= alertMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <section id="productForm" class="mb-5">
        <h2 class="text-center mb-4 text-primary">Delete Product</h2>
        <form action="ProductDeleteServlet" method="post" class="card p-4 shadow-sm form-section">
            <div class="mb-3">
                <label for="ProductID" class="form-label">Product ID <i class="bi bi-info-circle" title="Enter the Product ID to delete."></i></label>
                <input type="number" class="form-control" name="ProductID" id="ProductID" placeholder="Enter Product ID" required>
            </div>
            <input type="hidden" name="action" value="delete">
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-danger" name="action" value="delete" onclick="return confirm('Are you sure you want to delete this product?')">
                    <i class="bi bi-trash3"></i> Delete Product
                </button>
                <button type="reset" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i> Clear</button>
            </div>
        </form>
    </section>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <% if (alertType != null && alertMessage != null) { %>
    Swal.fire({
        icon: '<%= alertType %>', // success, error, warning, info
        title: '<%= alertMessage %>',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>
</body>
</html>
