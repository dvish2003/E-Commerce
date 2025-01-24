package lk.ijse.Servlet.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;

import java.io.IOException;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 2:06 AM
 * Description:
 */

@WebServlet(name = "Cart_ItemDelete", value = "/RemoveFromCartServlet")
public class Cart_Item_Delete extends HttpServlet {
    CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);
    Cart_List cartList = new Cart_List();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int cartId = Integer.parseInt(req.getParameter("cartId"));
            boolean isDelete = cartBO.delete(String.valueOf(cartId));

            if (isDelete) {
                req.setAttribute("alertType", "success");
                req.setAttribute("alertMessage", "Item removed from cart successfully.");
            } else {
                req.setAttribute("alertType", "danger");
                req.setAttribute("alertMessage", "Failed to remove item from cart.");
            }
            System.out.println("done deleted");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
