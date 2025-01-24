package lk.ijse.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.LoginBO;
import lk.ijse.BO.UserBO;
import lk.ijse.BO.custom.LoginBOImpl;
import lk.ijse.DTO.LoginDTO;
import lk.ijse.Entity.Login;
import lk.ijse.Entity.User;
import lk.ijse.Servlet.Product.CustomerHomeProduct;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;
/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:44 AM
 * Description:
 */
@WebServlet(name = "UserLoginServlet", value = {"/loginServlet"})
public class User_Get extends HttpServlet {
    UserBO userBO = (UserBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.User);
    LoginBO loginBO = (LoginBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Login);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userEmail = req.getParameter("username");
        String password = req.getParameter("password");
        LoginDTO login = new LoginDTO(1,userEmail);
        try {
            User user = userBO.searchByEmail(userEmail);

            if (user == null) {
                req.setAttribute("error", "User does not exist.");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                return;
            }

            if (!BCrypt.checkpw(password, user.getPassword())) {
                req.setAttribute("error", "Incorrect password.");
                req.getRequestDispatcher("index.jsp").forward(req, resp);

                return;
            }
            CustomerHomeProduct customerHomeProduct = new CustomerHomeProduct();
            if (user.getRole().equals("Admin")){
                // log wena user ta adala cart list eke thina data whhere user id user karan n data fetch krgnn one
                // e data tik apsse table ekt set krnw
                resp.sendRedirect("home.jsp");
                loginBO.save(login);

            }else if (user.getRole().equals("Customer")){
                resp.sendRedirect("customerHome.jsp");
                loginBO.save(login);

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("error", "please try Again.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
