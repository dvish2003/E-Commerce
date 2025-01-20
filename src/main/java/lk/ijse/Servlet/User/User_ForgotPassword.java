package lk.ijse.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.UserBO;
import lk.ijse.DTO.UserDTO;
import lk.ijse.Entity.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name="UserForgotPassword", value = "/ForgotPasswordServlet")
public class User_ForgotPassword extends HttpServlet {
    UserBO userBO = (UserBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.User);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        System.out.println(email);
        System.out.println(password);
        System.out.println(confirmPassword);

        try {
            User user = userBO.searchByEmail(email);

            if (user == null) {
                req.setAttribute("error", "Email does not exist.");
                req.getRequestDispatcher("UserUpdate.jsp").forward(req, resp);
                return;
            }

            if (!password.equals(confirmPassword)) {
                req.setAttribute("error", "Passwords not match.");
                req.getRequestDispatcher("UserUpdate.jsp").forward(req, resp);
                return;
            }

            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            UserDTO userDTO = new UserDTO(user.getUserId(), user.getUsername(), hashedPassword, user.getEmail(), user.getRole());
            userBO.update(userDTO);
            req.setAttribute("message", "Password updated successfully.");
            req.getRequestDispatcher("UserUpdate.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
