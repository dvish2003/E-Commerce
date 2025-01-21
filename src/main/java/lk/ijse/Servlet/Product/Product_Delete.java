package lk.ijse.Servlet.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.ProductBO;

import java.io.IOException;

/**
 * Author: vishmee
 * Date: 1/21/25
 * Time: 8:34 PM
 * Description:
 */
@WebServlet(name = "ProductDelete" , value = "/ProductDeleteServlet")
public class Product_Delete extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int productID = Integer.parseInt(req.getParameter("ProductID"));

        boolean isDelete = false;
        try {
            isDelete = productBO.delete(String.valueOf(productID));
            if (isDelete) {
                req.setAttribute("alertType", "success");
                req.setAttribute("alertMessage", "Product deleted successfully.");
            }else {
                req.setAttribute("alertType", "danger");
                req.setAttribute("alertMessage", "Failed to delete product.");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("ProductDelete.jsp").forward(req, resp);
    }

}
