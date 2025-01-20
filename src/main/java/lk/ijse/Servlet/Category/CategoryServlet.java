package lk.ijse.Servlet.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CategoryBO;
import lk.ijse.DAO.CategoryDAO;
import lk.ijse.DTO.CategoryDTO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 11:39 PM
 * Description:
 */
@WebServlet (name = "Category" , value ="/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Category);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String category = req.getParameter("categoryName");
        int ID = Integer.parseInt(req.getParameter("categoryID"));
        boolean result ;

        try {
            // jsp set action and that action send to Category servlet
            //copy right VM
            switch (action) {

                case "add":
                    if (category.isEmpty()){
                        req.setAttribute("alertType", "danger");
                        req.setAttribute("alertMessage", "Category name is required.");
                        break;
                    }else{
                        result = categoryBO.save(new CategoryDTO(1, category));
                        if (result) {
                            req.setAttribute("alertType", "success");
                            req.setAttribute("alertMessage", "Category added successfully.");
                        } else {
                            req.setAttribute("alertType", "danger");
                            req.setAttribute("alertMessage", "Failed to add category.");
                        }
                        break;
                    }


                case "update":

                    if (category.isEmpty()){
                        req.setAttribute("alertType", "danger");
                        req.setAttribute("alertMessage", "Category name is required.");
                        break;
                    }else{
                        System.out.println(action);
                        result = categoryBO.update(new CategoryDTO(ID,category));
                        if (result) {
                            req.setAttribute("alertType", "success");
                            req.setAttribute("alertMessage", "Category updated successfully.");
                        } else {
                            req.setAttribute("alertType", "danger");
                            req.setAttribute("alertMessage", "Failed to update category.");
                        }
                        break;
                    }


                case "delete":
                    System.out.println(action);
                    result = categoryBO.delete(String.valueOf(ID));
                    if (result) {
                        req.setAttribute("alertType", "success");
                        req.setAttribute("alertMessage", "Category deleted successfully.");
                    } else {
                        req.setAttribute("alertType", "danger");
                        req.setAttribute("alertMessage", "Failed to delete category.");
                    }
                    break;

                default:
                    req.setAttribute("alertType", "warning");
                    req.setAttribute("alertMessage", "Unknown action.");
                    break;
            }
        } catch (Exception e) {
            req.setAttribute("alertType", "danger");
            req.setAttribute("alertMessage", "An error occurred: " + e.getMessage());
        }

        req.getRequestDispatcher("Category.jsp").forward(req, resp);
    }

}