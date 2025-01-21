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
 * Time: 8:34 PM
 * Description:
 */
@WebServlet(name = "Product_AddServlet", value = "/ProductADDServlet")
public class Product_Add extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Category);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("ProductID"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String imagePath = req.getParameter("image");
        int categoryId = Integer.parseInt(req.getParameter("categoryID"));

        try {
            Category category = categoryBO.searchByID(String.valueOf(categoryId));
            CategoryDTO categoryDTO = new CategoryDTO(category.getCategoryId(), category.getName());
            boolean isSave = productBO.save(new ProductDTO(productId, name, price, description, quantity, imagePath, categoryDTO));
            if (isSave) {
                req.setAttribute("alertType", "success");
                req.setAttribute("alertMessage", "Product added successfully.");
            } else {
                req.setAttribute("alertType", "error");
                req.setAttribute("alertMessage", "Failed to add the product.");
            }

        } catch (Exception e) {
            req.setAttribute("alertType", "error");
          req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
        }
        req.getRequestDispatcher("ProductAdd.jsp").forward(req, resp);

    }
}
