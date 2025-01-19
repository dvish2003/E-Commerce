package lk.ijse.BO;

import lk.ijse.DTO.ProductDTO;

import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 12:21 PM
 * Description:
 */
public interface ProductBO extends SuperBO {
    boolean save(ProductDTO dto) throws Exception;

    boolean update(ProductDTO dto) throws Exception;

    boolean delete(String ID) throws Exception;

    List<ProductDTO> getAll() throws SQLException, ClassNotFoundException;
}
