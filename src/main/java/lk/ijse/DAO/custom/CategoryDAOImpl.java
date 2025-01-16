package lk.ijse.DAO.custom;

import lk.ijse.DAO.CategoryDAO;
import lk.ijse.DAO.SuperDAO;
import lk.ijse.Entity.Category;
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
public class CategoryDAOImpl implements CategoryDAO {
    @Override
    public boolean save(Category entity) throws Exception {
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.save(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Category entity) throws Exception {
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        session.update(entity);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public boolean delete(String ID) throws Exception {
        Session session = lk.ijse.config.FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        Category category = new Category();
        category.setCategoryId(Integer.parseInt(ID));
        session.delete(category);
        tx.commit();
        session.close();
        return true;
    }

    @Override
    public List<Category> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
}
