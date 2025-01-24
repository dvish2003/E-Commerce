package lk.ijse.Servlet.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;
import lk.ijse.BO.CheckOutBO;
import lk.ijse.BO.OrderBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.LoginDAO;
import lk.ijse.DAO.OrderDAO;
import lk.ijse.DAO.UserDAO;
import lk.ijse.DTO.*;
import lk.ijse.Entity.Cart;
import lk.ijse.Entity.Login;
import lk.ijse.Entity.Order;
import lk.ijse.Entity.User;
import lk.ijse.config.FactoryConfiguration;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 7:38 PM
 * Description: 
 */
@WebServlet(name = "PlaceOrder" ,value = "/CheckoutServletButton")
public class CheckOutServlet extends HttpServlet {
    OrderDAO orderDAO = (OrderDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Order);
    CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    CheckOutBO checkOutBO = (CheckOutBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Checkout);
OrderBO orderBO = (OrderBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Order);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*super.doPost(req, resp);*/
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

            String total = req.getParameter("total");
            if (total == null) {
                throw new Exception("Total amount is missing or invalid.");
            }
            int orderID = 1;
            double totalAmount = Double.parseDouble(total);
                UserDTO userDTO = new UserDTO(user.getUserId(), user.getUsername(), user.getPassword(), user.getEmail(), user.getRole());
                Date date = Date.valueOf(LocalDate.now());
                OrderDTO order = new OrderDTO(orderID, userDTO, date, totalAmount);

                boolean isSaveOrder = orderBO.save(order);
                if (isSaveOrder) {
                    Order order1 = orderDAO.getLastOrderId();
                    OrderDTO orderDto2 = new OrderDTO(
                            order1.getOrderId(),
                            new UserDTO(
                            order1.getUser().getUserId(),
                            order1.getUser().getUsername(),
                            order1.getUser().getPassword(),
                            order1.getUser().getEmail(),
                            order1.getUser().getRole()),
                            order1.getOrderDate(),
                            order1.getTotalAmount()
                    );
                    List<OrderDetailDTO> odList = getOrderDetailDTOS(cartList, orderDto2, totalAmount);
                    CheckOutDTO checkOutDTO = new CheckOutDTO(order, odList);

                    if (checkOutBO.saveData(checkOutDTO)) {
                        req.setAttribute("alertType", "success");
                        req.setAttribute("alertMessage", "Checkout successful!");

                    } else {
                        req.setAttribute("alertType", "danger");
                        req.setAttribute("alertMessage", "Checkout failed. Please try again.");
                    }
                }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static List<OrderDetailDTO> getOrderDetailDTOS(List<CartDTO> cartList, OrderDTO order, double totalAmount) {
        List<OrderDetailDTO> odList = new ArrayList<>();
        for (int i = 0; i < cartList.size(); i++) {
            CartDTO cart = cartList.get(i);
            OrderDetailDTO orderDetail = new OrderDetailDTO(
                    1,
                    new OrderDTO(order.getOrderId(), order.getUser(), order.getOrderDate(), totalAmount),
                    cart.getProduct(),
                    cart.getQuantity(),
                    cart.getProduct().getPrice() * cart.getQuantity()
            );
            odList.add(orderDetail);
        }
        return odList;
    }
}
