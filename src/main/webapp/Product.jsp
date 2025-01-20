

<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%@ page import="java.util.Objects" %>
<%
  String alertType = (String) request.getAttribute("alertType");
  String alertMessage = (String) request.getAttribute("alertMessage");
  List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories_product");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Product Management</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">Back To Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#productForm">Add Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#productList">Product List</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Container -->
<div class="container my-5">
  <!-- Product Form Section -->
  <section id="productForm" class="mb-5">
    <h2 class="text-center mb-4">Add New Product</h2>
    <form action="ProductServlet" method="get" enctype="multipart/form-data" class="card p-4 shadow-sm">
      <input type="hidden" name="action" value="add">
      <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input id="name" type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
      </div>
      <div class="mb-3">

        <label for="categoryID" class="form-label">Category:</label>
        <select name="categoryID" id="categoryID" class="form-control" required>
          <option value="">Select a Category</option> <%--enctype="multipart/form-data"--%>
          <%
            if (dataList != null && !dataList.isEmpty()) {
              for (CategoryDTO category : dataList) {
                System.out.println("Data Thinw hutto");
          %>
          <option value="<%= category.getCategoryId() %>"><%= category.getName() %></option>

          <%
              }

            }else{
                System.out.println("Data Is null huttto");
              }
          %>
        </select>

<%--<select class="form-select" aria-label="Default select example">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>--%>
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input id="price" type="number" step="0.01" name="price" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="quantity" class="form-label">Quantity:</label>
        <input id="quantity" type="number" step="0.01" name="quantity" class="form-control" required>
      </div>
      <div class="mb-3">
        <label id="image" for="image" class="form-label">Image:</label>
        <input type="file" name="image" class="form-control" accept="image/*" required>
      </div>
      <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary" name="action" value="add">Add Product</button>
        <button type="submit" class="btn btn-warning" name="action" value="update">Update Product</button>
        <button type="submit" class="btn btn-danger" name="action" value="delete" onclick="return confirm('Are you sure you want to delete this product?')">Delete Product</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
      </div>
    </form>
  </section>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
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
</script>
</body>
</html>


<%--
  <section id="productList">
    <h2 class="text-center mb-4">Product List</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <%
        List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("productList");
        if (products != null && !products.isEmpty()) {
          for (ProductDTO product : products) {
      %>
      <div class="col">
        <div class="card h-100">
          <img src="<%= product.getImagePath() != null ? product.getImagePath() : "placeholder.jpg" %>" class="card-img-top" alt="Product Image">
          <div class="card-body">
            <h5 class="card-title"><%= product.getName() %></h5>
            <p class="card-text"><%= product.getDescription() %></p>
            <p class="text-primary fw-bold">$<%= product.getPrice() %></p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <a href="addToCartServlet?id=<%= product.getProductId() %>" class="btn btn-sm btn-success">Add to Cart</a>
          </div>
        </div>
      </div>
      <%
        }
      } else {
      %>
      <p class="text-center text-muted">No products available.</p>
      <%
        }
      %>
    </div>
  </section>
--%>