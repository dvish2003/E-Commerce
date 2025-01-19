package lk.ijse.DAO.custom;

import lk.ijse.DAO.ProductDAO;
import lk.ijse.Entity.Product;

import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 12:19 PM
 * Description:
 */
public class ProductDAOImpl implements ProductDAO {
    @Override
    public boolean save(Product entity) throws Exception {
        return false;
    }

    @Override
    public boolean update(Product entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return false;
    }

    @Override
    public List<Product> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
}
