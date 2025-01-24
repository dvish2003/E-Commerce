package lk.ijse.DAO.custom;

import lk.ijse.DAO.ProductDAO;
import lk.ijse.Entity.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.update(entity);
        tx.commit();
        session.close();
        return true;
       /*Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
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
        return result > 0;*/
    }

    @Override
    public boolean delete(int ID) throws Exception {
             Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("DELETE FROM Product WHERE id = :productId");
            query.setParameter("productId", ID);
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
        return all; 
    }

    @Override
    public Product searchByName(String name) throws SQLException, ClassNotFoundException {
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        Product product = session.createQuery("FROM Product WHERE name = :name", Product.class).setParameter("name",name)
                .uniqueResult();
        transaction.commit();
        session.close();
        return product;
    }

/*    @Override
    public boolean updateQty(String id, int qty) {
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        Product product = new Product();
        product.setProductId(Integer.parseInt(id));
        product.setQuantity(qty);
        session.update(product);
        tx.commit();
        session.close();
        return true;
    }*/
@Override
public boolean updateQty(String id, int qty) {
    Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
    Transaction tx = session.beginTransaction();
        Query query = session.createQuery("UPDATE Product p SET p.quantity = p.quantity - :qty WHERE p.productId = :id");
        query.setParameter("qty", qty);
        query.setParameter("id", Integer.parseInt(id));

        query.executeUpdate();
        tx.commit();
    return true;
}


}

