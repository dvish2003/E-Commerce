package lk.ijse.BO.custom;

import lk.ijse.BO.CategoryBO;
import lk.ijse.DAO.CategoryDAO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.Entity.Category;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 11:44 PM
 * Description:
 */
public class CategoryBOImpl implements CategoryBO {
    CategoryDAO categoryDAO = (CategoryDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Category);

    @Override
    public boolean save(CategoryDTO dto) throws Exception {
        return categoryDAO.save(new Category(dto.getCategoryId(),dto.getName(),new ArrayList<>()));
    }

    @Override
    public boolean update(CategoryDTO dto) throws Exception {
        return categoryDAO.update(new Category(dto.getCategoryId(),dto.getName(),new ArrayList<>()));
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return categoryDAO.delete(ID);
    }

    @Override
    public List<CategoryDTO> getAll() throws SQLException, ClassNotFoundException {
       List<Category> categories = categoryDAO.getAll();
       List<CategoryDTO> categoryDTO = new ArrayList<CategoryDTO>();
       for(Category category : categories){
           categoryDTO.add(new CategoryDTO(category.getCategoryId(),category.getName()));
       }
       return categoryDTO;
    }
}
