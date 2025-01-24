package lk.ijse.DAO;

import lk.ijse.Entity.Cart;

import java.util.List;

/**
 * Author: vishmee
 * Date: 1/22/25
 * Time: 7:37 PM
 * Description:
 */
public interface CartDAO extends CrudDAO<Cart> {
    List<Cart> getCartsByUserId(int userId);

    boolean deleteUserID(int ID);
}
