package lk.ijse.BO;

import lk.ijse.DTO.OrderDetailDTO;

import java.sql.SQLException;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:28 PM
 * Description: 
 */
public interface Order_DetailBO extends SuperBO {

    boolean save(List<OrderDetailDTO> odList) throws Exception;

    boolean saveOrderDetail(OrderDetailDTO od) throws Exception;
}
