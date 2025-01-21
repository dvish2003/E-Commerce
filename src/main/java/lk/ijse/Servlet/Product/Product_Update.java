package lk.ijse.Servlet.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CategoryBO;
import lk.ijse.BO.ProductBO;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.Entity.Category;

import java.io.IOException;

/**
 * Author: vishmee
 * Date: 1/21/25
 * Time: 8:35 PM
 * Description:
 */
@WebServlet(name = "Product_UpdateServlet" , value = "/ProductUpdateServlet")
public class Product_Update extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Category);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(req.getParameter("ProductID"));
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String imagePath = req.getParameter("image");
            int categoryId = Integer.parseInt(req.getParameter("categoryID"));

            System.out.println(productId);
            System.out.println(name);
            System.out.println(price);
            System.out.println(description);
            System.out.println(quantity);
            System.out.println(imagePath);
            System.out.println(categoryId);


            Category category = categoryBO.searchByID(String.valueOf(categoryId));
            CategoryDTO categoryDTO = new CategoryDTO(category.getCategoryId(), category.getName());
            boolean isUpdate = productBO.update(new ProductDTO(productId, name, price, description, quantity, imagePath, categoryDTO));
            if (isUpdate) {
                req.setAttribute("alertType", "success");
                req.setAttribute("alertMessage", "Product Update successfully.");
            } else {
                req.setAttribute("alertType", "error");
                req.setAttribute("alertMessage", "Failed to Update the product.");
            }

        } catch (Exception e) {
            req.setAttribute("alertType", "error");
            req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
        }
        req.getRequestDispatcher("ProductUpdate.jsp").forward(req, resp);

    }


}
/*
@Override
protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
        // Retrieve parameters and validate
        String productIdStr = req.getParameter("ProductID");
        String name = req.getParameter("name");
        String priceStr = req.getParameter("price");
        String description = req.getParameter("description");
        String quantityStr = req.getParameter("quantity");
        String imagePath = req.getParameter("image");
        String categoryIdStr = req.getParameter("categoryID");

        // Check for null or empty fields
        if (productIdStr == null || productIdStr.isEmpty() ||
                priceStr == null || priceStr.isEmpty() ||
                quantityStr == null || quantityStr.isEmpty() ||
                categoryIdStr == null || categoryIdStr.isEmpty()) {
            req.setAttribute("alertType", "error");
            req.setAttribute("alertMessage", "All fields are required.");
            req.getRequestDispatcher("ProductUpdate.jsp").forward(req, resp);
            return;
        }

        // Parse numeric fields
        int productId = Integer.parseInt(productIdStr);
        double price = Double.parseDouble(priceStr);
        int quantity = Integer.parseInt(quantityStr);
        int categoryId = Integer.parseInt(categoryIdStr);

        // Debugging output (optional)
        System.out.println(productId);
        System.out.println(name);
        System.out.println(price);
        System.out.println(description);
        System.out.println(quantity);
        System.out.println(imagePath);
        System.out.println(categoryId);

        // Business logic
        Category category = categoryBO.searchByID(String.valueOf(categoryId));
        if (category == null) {
            req.setAttribute("alertType", "error");
            req.setAttribute("alertMessage", "Category not found.");
            req.getRequestDispatcher("ProductUpdate.jsp").forward(req, resp);
            return;
        }

        CategoryDTO categoryDTO = new CategoryDTO(category.getCategoryId(), category.getName());
        boolean isUpdate = productBO.update(new ProductDTO(productId, name, price, description, quantity, imagePath, categoryDTO));
        if (isUpdate) {
            req.setAttribute("alertType", "success");
            req.setAttribute("alertMessage", "Product updated successfully.");
        } else {
            req.setAttribute("alertType", "error");
            req.setAttribute("alertMessage", "Failed to update the product.");
        }

    } catch (NumberFormatException e) {
        req.setAttribute("alertType", "error");
        req.setAttribute("alertMessage", "Invalid numeric input: " + e.getMessage());
    } catch (Exception e) {
        req.setAttribute("alertType", "error");
        req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
    }

    // Forward to JSP
    req.getRequestDispatcher("ProductUpdate.jsp").forward(req, resp);
}*/
