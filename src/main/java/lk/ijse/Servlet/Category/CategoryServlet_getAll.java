package lk.ijse.Servlet.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CategoryBO;
import lk.ijse.DTO.CategoryDTO;

import java.io.IOException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 10:50 PM
 * Description:
 */
@WebServlet(name = "CategoryListServlet" , value = "/category-List")
public class CategoryServlet_getAll extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Category);
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<CategoryDTO> categories = categoryBO.getAll();
            req.setAttribute("categories", categories);
            RequestDispatcher rd  = req.getRequestDispatcher("category-List.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("alertType", "danger");
            req.setAttribute("alertMessage", "Error loading categories: " + e.getMessage());
        }

    }
}
