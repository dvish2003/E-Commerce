<!--
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Management</title>
  &lt;!&ndash; Bootstrap CSS &ndash;&gt;
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
&lt;!&ndash; Navigation Bar &ndash;&gt;
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Product Management</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="#productForm">Manage Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#productList">Product List</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

&lt;!&ndash; Main Container &ndash;&gt;
<div class="container my-5">
  &lt;!&ndash; Product Form Section &ndash;&gt;
  <section id="productForm" class="mb-5">
    <h2 class="text-center mb-4">Manage Product</h2>
    <form action="ProductServlet" method="post" enctype="multipart/form-data" class="card p-4 shadow-sm">
      &lt;!&ndash; Hidden input for identifying the action &ndash;&gt;
      <input type="hidden" name="action" value="add">
      <input type="hidden" name="productId" value="&lt;!&ndash; Dynamically populated product ID &ndash;&gt;">

      &lt;!&ndash; Product Name &ndash;&gt;
      <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" name="name" class="form-control" required>
      </div>

      &lt;!&ndash; Product Description &ndash;&gt;
      <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea name="description" class="form-control" rows="3"></textarea>
      </div>

      &lt;!&ndash; Product Price &ndash;&gt;
      <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="number" step="0.01" name="price" class="form-control" required>
      </div>

      &lt;!&ndash; Product Image &ndash;&gt;
      <div class="mb-3">
        <label for="image" class="form-label">Image:</label>
        <input type="file" name="image" class="form-control" accept="image/*">
      </div>

      &lt;!&ndash; Buttons for Add, Update, and Delete &ndash;&gt;
      <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary" name="action" value="add">Add Product</button>
        <button type="submit" class="btn btn-warning" name="action" value="update">Update Product</button>
        <button type="submit" class="btn btn-danger" name="action" value="delete" onclick="return confirm('Are you sure you want to delete this product?')">Delete Product</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
      </div>
    </form>
  </section>

  &lt;!&ndash; Product List Section &ndash;&gt;
  &lt;!&ndash; Product List Section &ndash;&gt;
  <section id="productList">
    <h2 class="text-center mb-4">Product List</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <div class="col">
        <div class="card h-100">
          <img src="asesst/Nike.jpeg" class="card-img-top" alt="Product Image">
          <div class="card-body">
            <h5 class="card-title">Sample Product</h5>
            <p class="card-text">This is a description of the product.</p>
            <p class="text-primary fw-bold">$100.00</p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <a href="addToCartServlet?id=1" class="btn btn-sm btn-success">Add to Cart</a>
            &lt;!&ndash;<div>
              <a href="editProduct.jsp?id=1" class="btn btn-sm btn-warning">Update</a>
              <a href="deleteProduct?id=1" class="btn btn-sm btn-danger">Delete</a>
            </div>&ndash;&gt;
          </div>
        </div>
      </div>
    </div>
  </section>
</div></div>

&lt;!&ndash; Bootstrap JS Bundle &ndash;&gt;
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
-->


<%--
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <form action="ProductServlet" method="post" enctype="multipart/form-data" class="card p-4 shadow-sm">
      <input type="hidden" name="action" value="add">
      <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea name="description" class="form-control" rows="3" required></textarea>
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="number" step="0.01" name="price" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="image" class="form-label">Image:</label>
        <input type="file" name="image" class="form-control" accept="image/*" required>
      </div>
      <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary">Add Product</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
      </div>
    </form>
  </section>

  <!-- Product List Section -->
  <section id="productList">
    <h2 class="text-center mb-4">Product List</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <!-- Dynamically generated product cards -->
      <%
      // Assuming you have a List<Product> in the request scope
      List<Product> products = (List<Product>) request.getAttribute("productList");
        if (products != null) {
        for (Product product : products) {
        %>
        <div class="col">
          <div class="card h-100">
            <img src="<%= product.getImagePath() %>" class="card-img-top" alt="Product Image">
            <div class="card-body">
              <h5 class="card-title"><%= product.getName() %></h5>
              <p class="card-text"><%= product.getDescription() %></p>
              <p class="text-primary fw-bold">$<%= product.getPrice() %></p>
            </div>
            <div class="card-footer d-flex justify-content-between">
              <a href="addToCartServlet?id=<%= product.getProductId() %>" class="btn btn-sm btn-success">Add to Cart</a>
              <div>
                <a href="editProduct.jsp?id=<%= product.getProductId() %>" class="btn btn-sm btn-warning">Update</a>
                <a href="deleteProduct?id=<%= product.getProductId() %>" class="btn btn-sm btn-danger">Delete</a>
              </div>
            </div>
          </div>
        </div>
        <%
        }
        } else {
        %>
        <p>No products available.</p>
        <%
        }
        %>
    </div>
  </section>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
--%>


<%--
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.ProductDTO" %> <!-- Replace with your actual package -->

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
    <form action="ProductServlet" method="post" enctype="multipart/form-data" class="card p-4 shadow-sm">
      <input type="hidden" name="action" value="add">
      <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea name="description" class="form-control" rows="3" required></textarea>
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="number" step="0.01" name="price" class="form-control" required>
      </div>
      <div class="mb-3">
        <label for="image" class="form-label">Image:</label>
        <input type="file" name="image" class="form-control" accept="image/*" required>
      </div>
      <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary">Add Product</button>
        <button type="reset" class="btn btn-secondary">Clear</button>
      </div>
    </form>
  </section>

<!-- Product List Section -->
<section id="productList">
  <h2 class="text-center mb-4">Product List</h2>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <!-- Dynamically generated product cards -->
    <%
      List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("productList");
      if (products != null) {
        for (ProductDTO product : products) {
    %>
    <div class="col">
      <div class="card h-100">
        <img src="<%= product.getImagePath() %>" class="card-img-top" alt="Product Image">
        <div class="card-body">
          <h5 class="card-title"><%= product.getName() %></h5>
          <p class="card-text"><%= product.getDescription() %></p>
          <p class="text-primary fw-bold">$<%= product.getPrice() %></p>
        </div>
        <div class="card-footer d-flex justify-content-between">
          <a href="addToCartServlet?id=<%= product.getProductId() %>" class="btn btn-sm btn-success">Add to Cart</a>
          <div>
            <a href="editProduct.jsp?id=<%= product.getProductId() %>" class="btn btn-sm btn-warning">Update</a>
            <a href="deleteProduct?id=<%= product.getProductId() %>" class="btn btn-sm btn-danger">Delete</a>
          </div>
        </div>
      </div>
    </div>
    <%
      }
    } else {
    %>
    <p>No products available.</p>
    <%
      }
    %>
  </div>
</section>
--%>


<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%
  String alertType = (String) request.getAttribute("alertType");
  String alertMessage = (String) request.getAttribute("alertMessage");
  List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");
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
    <form action="ProductServlet" method="post" enctype="multipart/form-data" class="card p-4 shadow-sm">
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
        <label for="category" class="form-label">Category:</label>
        <select name="category" id="category" class="form-control" required>
          <option value=""></option>
        </select>
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
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script>

</script>
</body>
</html>

