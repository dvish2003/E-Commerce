package lk.ijse.DAO.custom;

import lk.ijse.DAO.OrderDAO;
import lk.ijse.Entity.Order;
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
public class OrderDAOImpl implements OrderDAO {
    @Override
    public boolean save(Order entity) throws Exception {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.save(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Order entity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(int ID) throws Exception {
        return false;
    }

    @Override
    public List<Order> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }

    @Override
    public Order getLastOrderId() {
       Session session = FactoryConfiguration.getInstance().getSession();
       Transaction tx = session.beginTransaction();
        Order lastOrder = session.createQuery("FROM Order o ORDER BY o.orderId DESC", Order.class)
                .setMaxResults(1)
                .uniqueResult();

        tx.commit();
       session.close();
       return lastOrder;
    }
}
