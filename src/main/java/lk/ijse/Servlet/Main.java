package lk.ijse.Servlet;

import org.hibernate.Session;
import lk.ijse.config.FactoryConfiguration;
import org.hibernate.Transaction;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 2:31 AM
 * Description:
 */
public class Main {
    public static void main(String[] args) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();

    }
}
