<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String alertType = (String) request.getAttribute("alertType");
  String alertMessage = (String) request.getAttribute("alertMessage");
  List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <title>Product List</title>
  <style>
    body {
      background: linear-gradient(to bottom, #f0f4ff, #e0e7ff);
      font-family: 'Arial', sans-serif;
    }

    nav {
      background: #ffffff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .table-container {
      margin-top: 100px;
      padding: 20px;
      background: #ffffff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .table thead {
      background-color: #0d6efd;
      color: white;
    }

    .btn-custom {
      font-size: 0.9rem;
      padding: 6px 12px;
      color: white;
    }

    .btn-warning {
      background-color: #ffc107;
    }

    .btn-danger {
      background-color: #dc3545;
    }

    .no-products {
      font-size: 1.2rem;
      color: #6c757d;
    }

    footer {
      margin-top: 50px;
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 15px 0;
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

<div class="container" style="margin-top: 100px;">
  <% if (alertMessage != null && alertType != null) { %>
  <div class="alert alert-<%= alertType %> alert-dismissible fade show mt-4" role="alert">
    <i class="bi <%= alertType.equals("success") ? "bi-check-circle-fill" : "bi-exclamation-circle-fill" %>"></i>
    <%= alertMessage %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <% } %>

  <div class="table-container">
    <h3 class="text-center mb-4 text-primary">Product List</h3>
    <% if (dataList != null && !dataList.isEmpty()) { %>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Product ID</th>
          <th>Name</th>
          <th>Price</th>
          <th>Description</th>
          <th>Quantity</th>
          <th>Category</th>
          <th>Image</th>
        </tr>
        </thead>
        <tbody>
        <% for (ProductDTO productDTO : dataList) { %>
        <tr>
          <td><%= productDTO.getProductId() %></td>
          <td><%= productDTO.getName() %></td>
          <td>$<%= String.format("%.2f", productDTO.getPrice()) %></td>
          <td><%= productDTO.getDescription() %></td>
          <td><%= productDTO.getQuantity() %></td>
          <td><%= productDTO.getCategory().getName() %></td>
          <td><img src="<%= productDTO.getImagePath() %>" alt="<%= productDTO.getName() %>" width="50" height="50"></td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>

    <% } else { %>
    <p class="text-center no-products">No products found. Please add products to see them listed here.</p>
    <% } %>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
