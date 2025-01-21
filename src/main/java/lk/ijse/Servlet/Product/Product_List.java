package lk.ijse.Servlet.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.ProductBO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.Servlet.Category.CategoryServlet;

import java.io.IOException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/21/25
 * Time: 8:51 PM
 * Description:
 */
@WebServlet(name = "ProductListServlet", value = "/Product-List")
public class Product_List extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*super.doGet(req, resp);*/
   try {
       List<ProductDTO> productDTOS = productBO.getAll();
       req.setAttribute("products", productDTOS);
       RequestDispatcher rd  = req.getRequestDispatcher("Product-List.jsp");
       rd.forward(req, resp);

   } catch (Exception e) {
       req.setAttribute("alertType", "danger");
       req.setAttribute("alertMessage", "Error loading Products: " + e.getMessage());   }

    }
}
