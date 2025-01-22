package lk.ijse.BO;

import lk.ijse.DTO.CartDTO;

import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/22/25
 * Time: 7:37 PM
 * Description:
 */
public interface CartBO extends SuperBO{
    boolean save(CartDTO entity) throws Exception;

    boolean update(CartDTO entity) throws Exception;

    boolean delete(String ID) throws Exception;

    List<CartDTO> getAll() throws SQLException, ClassNotFoundException;
}
