package lk.ijse.DAO;

import lk.ijse.Entity.Order;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:29 PM
 * Description: 
 */
public interface OrderDAO extends CrudDAO<Order> {
    Order getLastOrderId();
}
