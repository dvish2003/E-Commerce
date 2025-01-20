package lk.ijse.Servlet.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CategoryBO;
import lk.ijse.BO.ProductBO;
import lk.ijse.DAO.CategoryDAO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.ProductDAO;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.Entity.Category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 10:35 AM
 * Description:
 */
@WebServlet(name = "Product", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {

    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Category);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<CategoryDTO> categories = categoryBO.getAll();
            req.setAttribute("categories_product", categories);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/Product.jsp");
            dispatcher.forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int productId = 1;
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String imagePath = req.getParameter("image");
        int categoryId = Integer.parseInt(req.getParameter("categoryID"));
        boolean result;

        try {
            Category category = categoryBO.searchByID(String.valueOf(categoryId));
            CategoryDTO categoryDTO1 = new CategoryDTO(category.getCategoryId(),category.getName());

            switch (action){
                case "add":
                        result = productBO.save(new ProductDTO(productId,name,price,description,quantity,imagePath,categoryDTO1));
                    if (result) {
                        req.setAttribute("alertType", "success");
                        req.setAttribute("alertMessage", "Product added successfully.");
                    } else {
                        req.setAttribute("alertType", "danger");
                        req.setAttribute("alertMessage", "Failed to add Product.");
                    }
                    break;
                case "update":
                    // update product
                    break;
                case "delete":
                    // delete product
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            req.setAttribute("alertType", "danger");
            req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
        }
        req.getRequestDispatcher("Product.jsp").forward(req, resp);

    }
}



/*@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int productId = 1;
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String imagePath = req.getParameter("imagePath");
        String Name = req.getParameter("name");


        boolean result;

       try {
           switch (action){
               case "save":
try {
    result = productBO.save(new ProductDTO(productId,name,price,description,quantity,imagePath,new Category()));

} catch (Exception e) {
    throw new RuntimeException(e);
}
                   break;
               case "update":
                   // update product
                   break;
               case "delete":
                   // delete product
                   break;
               case "getAll":
                   // get all products
                   break;
               case "search":
                   // search product
                   break;
               default:
                   break;
           }
       } catch (Exception e) {
           throw new RuntimeException(e);
       }

    }*/