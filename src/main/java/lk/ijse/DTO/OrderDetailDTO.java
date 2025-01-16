package lk.ijse.DTO;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:45 AM
 * Description:
 */
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
    private int orderDetailId;
    private OrderDTO order;
    private ProductDTO product;
    private Integer quantity;
    private Double price;

}
