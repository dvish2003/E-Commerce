package lk.ijse.DAO;

import lk.ijse.Entity.Category;

import java.sql.SQLException;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 11:45 PM
 * Description:
 */
public interface CategoryDAO extends CrudDAO<Category>{
    Category searchByID(String id) throws SQLException, ClassNotFoundException;
}
