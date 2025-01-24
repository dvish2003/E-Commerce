package lk.ijse.Servlet.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;
import lk.ijse.DAO.*;
import lk.ijse.DTO.CartDTO;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.DTO.UserDTO;
import lk.ijse.Entity.Login;
import lk.ijse.Entity.Product;
import lk.ijse.Entity.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Product_AddToCart", value = "/AddToCartServlet")
public class CartServlet extends HttpServlet {
    ProductDAO productDAO = (ProductDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Product);
    CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String productName = req.getParameter("productName");
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            // search and get user Entity
            Product product = productDAO.searchByName(productName);
            //covert Dto
            ProductDTO dto = new ProductDTO(product.getProductId(), product.getName(),product.getPrice(), product.getDescription(),
            product.getQuantity(),product.getImagePath(),new CategoryDTO(product.getCategory().getCategoryId(),product.getCategory().getName()));

            //User Entity
            Login login1 = loginDAO.getLastLogin();
            login1.getUserMail();
            User user = userDAO.searchByEmail(login1.getUserMail());

            //Convert Entity
            UserDTO userDTO = new UserDTO(user.getUserId(),user.getUsername(),user.getPassword(),user.getEmail(),user.getRole());
            CartDTO cartDTO = new CartDTO(1,userDTO,dto,quantity);

            if (product!= null) {
                boolean isSave = cartBO.save(cartDTO);
                if (isSave) {
                    req.setAttribute("alertType", "success");
                    req.setAttribute("alertMessage", "Product added to cart successfully!");
                    req.getRequestDispatcher("home.jsp").forward(req, resp);
                } else {
                    req.setAttribute("alertType", "error");
                    req.setAttribute("alertMessage", "Failed to add product to cart!");
                }
            }



        } catch (SQLException | ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

