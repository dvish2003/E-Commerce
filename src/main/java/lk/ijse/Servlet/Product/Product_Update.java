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
                req.getRequestDispatcher("ProductUpdate.jsp").forward(req, resp);

            } else {
                req.setAttribute("alertType", "error");
                req.setAttribute("alertMessage", "Failed to Update the product.");
            }

        } catch (Exception e) {
            req.setAttribute("alertType", "error");
            req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
        }

    }


}