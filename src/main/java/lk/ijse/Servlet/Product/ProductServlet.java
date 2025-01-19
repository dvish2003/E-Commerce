package lk.ijse.Servlet.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.ProductBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.ProductDAO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.Entity.Category;

import java.io.IOException;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 10:35 AM
 * Description:
 */
@WebServlet(name = "Product", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {

    ProductDAO productDAO = (ProductDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Product);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
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

    }
}
