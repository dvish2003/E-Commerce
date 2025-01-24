package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:21 PM
 * Description:
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CheckOutDTO {
    private OrderDTO orderDTO;
    private List<OrderDetailDTO> odList;
}
