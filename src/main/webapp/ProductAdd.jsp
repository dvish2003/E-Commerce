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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Product Management</title>
    <style>
        body {
            background: linear-gradient(to bottom, #e9f8ff, #f3faff);
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        nav {
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .container {
            margin-top: 100px;
        }

        h2 {
            font-weight: bold;
            color: #0d6efd;
        }

        form {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        .btn-primary {
            background: #0d6efd;
            border: none;
        }

        .btn-primary:hover {
            background: #0056b3;
        }

        .btn-secondary {
            background: #adb5bd;
            border: none;
        }

        .btn-secondary:hover {
            background: #6c757d;
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

<div class="container my-5">
    <!-- Product Form Section -->
    <section id="productForm" class="mb-5">
        <h2 class="text-center mb-4">Add New Product</h2>
        <form action="ProductADDServlet" method="post" class="p-4">
            <div class="mb-3">
                <label for="ProductID" class="form-label">Product ID</label>
                <input type="number" class="form-control" name="ProductID" id="ProductID" placeholder="Enter Product ID" required>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input id="name" type="text" name="name" class="form-control" placeholder="Enter Name" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter Description" required></textarea>
            </div>
            <div class="mb-3">
                <label for="categoryID" class="form-label">Category ID</label>
                <input id="categoryID" type="number" name="categoryID" class="form-control" placeholder="Enter Category ID" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input id="price" type="number" step="0.01" name="price" class="form-control" placeholder="Enter Price" required>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input id="quantity" type="number" name="quantity" class="form-control" placeholder="Enter Quantity" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input id="image" type="file" name="image" class="form-control" accept="image/*" required>
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Add Product</button>
                <button type="reset" class="btn btn-secondary">Clear</button>
            </div>
        </form>
    </section>
</div>
<script>
    <% if (alertType != null && alertMessage != null) { %>

    Swal.fire({
        icon: '<%= alertType %>',
        title: '<%= alertMessage %>',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
