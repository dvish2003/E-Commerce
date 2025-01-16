package lk.ijse.DAO;

import lk.ijse.Entity.User;

import java.sql.SQLException;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 2:56 PM
 * Description:
 */
public interface UserDAO extends CrudDAO<User>{
    User searchByEmail(String id) throws SQLException, ClassNotFoundException;
}
