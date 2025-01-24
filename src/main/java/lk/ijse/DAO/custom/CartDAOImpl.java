package lk.ijse.DAO.custom;

import lk.ijse.DAO.CartDAO;
import lk.ijse.Entity.Cart;
import lk.ijse.config.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.SQLException;
import java.util.ArrayList;
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
    public boolean delete(int ID) throws Exception {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.createQuery("DELETE FROM Cart WHERE cartId = :cartId")
                    .setParameter("cartId", ID)
                    .executeUpdate();

            tx.commit();
            session.close();
            return true;

    }


    @Override
    public List<Cart> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }

    @Override
    public List<Cart> getCartsByUserId(int userId) {
        List<Cart> cart = new ArrayList<>();
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            cart = session.createQuery("FROM Cart c WHERE c.user.userId = :userId", Cart.class)
                    .setParameter("userId", userId)
                    .list();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return cart;
    }

    @Override
    public boolean deleteUserID(int ID) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        session.createQuery("DELETE FROM Cart WHERE user.userId = :userId").setParameter("userId", ID).executeUpdate();
            transaction.commit();
            session.close();
            return true;
    }

}
/*
    @Override
    public List<Cart> getCartsByUserId(int userId) {
        List<Cart> cart =new ArrayList<>();
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        cart = session.createQuery("FROM Cart c WHERE c.user.userId = :userId", Cart.class).list();
        transaction.commit();
        session.close();
        return cart;
    }
    }
*/
