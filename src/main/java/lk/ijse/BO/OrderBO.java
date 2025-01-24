package lk.ijse.BO;

import lk.ijse.DTO.OrderDTO;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:28 PM
 * Description: 
 */
public interface OrderBO extends SuperBO {
    boolean save(OrderDTO dto) throws Exception;

    OrderDTO getLastOrderId();
}
