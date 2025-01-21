package lk.ijse.DAO.custom;

import lk.ijse.DAO.ProductDAO;
import lk.ijse.Entity.Category;
import lk.ijse.Entity.Product;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.grammars.hql.HqlParser;
import org.hibernate.query.Query;

import java.sql.SQLException;
import java.util.ArrayList;
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
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.save(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Product entity) throws Exception {
        /*Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.update(entity);
        tx.commit();
        session.close();
        return true;   */
       Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
       Transaction tx = session.beginTransaction();
        Query query = session.createQuery(
                "UPDATE Product p SET " +
                        "p.name = :name, " +
                        "p.price = :price, " +
                        "p.description = :description, " +
                        "p.quantity = :quantity, " +
                        "p.imagePath = :imagePath, " +
                        "p.category = :category " +
                        "WHERE p.productId = :productId"
        );

        query.setParameter("name", entity.getName());
        query.setParameter("price", entity.getPrice());
        query.setParameter("description", entity.getDescription());
        query.setParameter("quantity", entity.getQuantity());
        query.setParameter("imagePath", entity.getImagePath());
        query.setParameter("category", entity.getCategory());
        query.setParameter("productId", entity.getProductId());
        int result = query.executeUpdate();
        tx.commit();
        session.close();
        return result > 0;
    }

    @Override
    public boolean delete(String ID) throws Exception {
             Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("DELETE FROM Product WHERE id = :productId");
            query.setParameter("productId", Integer.parseInt(ID));
            int result = query.executeUpdate();
            tx.commit();
            session.close();
            return true;
    }


    @Override
    public List<Product> getAll() throws SQLException, ClassNotFoundException {
        List<Product> all = new ArrayList<>();
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        all = session.createQuery("from Product").list();
        transaction.commit();
        session.close();
        return all;    }

}
