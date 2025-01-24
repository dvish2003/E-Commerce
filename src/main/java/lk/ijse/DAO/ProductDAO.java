package lk.ijse.DAO;

import lk.ijse.Entity.Product;

import java.sql.SQLException;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 12:19 PM
 * Description:
 */
public interface ProductDAO extends CrudDAO<Product> {
    Product searchByName(String name) throws SQLException, ClassNotFoundException;

    boolean updateQty(String id, int qty);
}
