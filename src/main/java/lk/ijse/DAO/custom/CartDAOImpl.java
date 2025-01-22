package lk.ijse.DAO.custom;

import lk.ijse.DAO.CartDAO;
import lk.ijse.Entity.Cart;
import lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 3:03 PM
 * Description:
 */
public class CartDAOImpl implements CartDAO {
    @Override
    public boolean save(Cart entity) throws Exception {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.save(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Cart entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return false;
    }

    @Override
    public List<Cart> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
}
