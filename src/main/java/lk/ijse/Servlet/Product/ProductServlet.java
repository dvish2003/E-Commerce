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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categories;
        try {
            categories = categoryBO.getAll();
            System.out.println(categories.get(1).getName());
            System.out.println(categories.get(2).getName());
            System.out.println(categories.get(3).getName());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println(categories.get(1).getName());
        System.out.println(categories.get(2).getName());
        System.out.println(categories.get(3).getName());
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("Product.jsp");
        dispatcher.forward(req, resp);
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