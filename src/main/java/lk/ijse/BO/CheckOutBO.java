package lk.ijse.BO;

import lk.ijse.DTO.CheckOutDTO;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:24 PM
 * Description:
 */
public interface CheckOutBO extends SuperBO{
    boolean saveData(CheckOutDTO checkOutDTO) throws Exception;
}
