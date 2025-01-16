package lk.ijse.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.UserBO;
import lk.ijse.Entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;
/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:44 AM
 * Description:
 */
@WebServlet(name = "UserLoginServlet", value = "/loginServlet")
public class User_Get extends HttpServlet {
    UserBO userBO = (UserBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.User);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userEmail = req.getParameter("username");
        String password = req.getParameter("password");

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
            resp.sendRedirect("home.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            req.setAttribute("error", "please try Again.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
