package lk.ijse.Servlet.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;
import lk.ijse.BO.CheckOutBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.LoginDAO;
import lk.ijse.DAO.UserDAO;
import lk.ijse.DTO.*;
import lk.ijse.Entity.Cart;
import lk.ijse.Entity.Login;
import lk.ijse.Entity.Order;
import lk.ijse.Entity.User;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/23/25
 * Time: 11:13 PM
 * Description: Servlet to display cart items for the logged-in user.
 */
@WebServlet(name = "CartListByPerson", value = "/CheckoutServlet")
public class Cart_List extends HttpServlet {
    CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);
     UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
     LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    CheckOutBO checkOutBO = (CheckOutBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Checkout);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            Login lastLogin = loginDAO.getLastLogin();
            if (lastLogin == null || lastLogin.getUserMail() == null) {
                throw new Exception("No logged-in user found.");
            }
            User user = userDAO.searchByEmail(lastLogin.getUserMail());
            if (user == null) {
                throw new Exception("User not found.");
            }

            List<CartDTO> cartList = cartBO.getCartsByUserId(user.getUserId());
            if (cartList == null) {
                cartList = new ArrayList<>();
            }
            req.setAttribute("cartList", cartList);
            req.getRequestDispatcher("Cart.jsp").forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("alertType", "danger");
            req.setAttribute("alertMessage", "Error loading Cart: " + e.getMessage());
        }
    }

}

