package lk.ijse.DAO.custom;

import lk.ijse.DAO.OrderDetailDAO;
import lk.ijse.Entity.OrderDetail;
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
public class Order_DetailDAOImpl implements OrderDetailDAO {
    @Override
    public boolean save(OrderDetail entity) throws Exception {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.save(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(OrderDetail entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(int ID) throws Exception {
        return false;
    }

    @Override
    public List<OrderDetail> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
}
