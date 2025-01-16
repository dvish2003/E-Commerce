package lk.ijse.DTO;

import jakarta.persistence.*;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:44 AM
 * Description:
 */
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartDTO {
    private int cartId;
    private UserDTO user;
    private ProductDTO product;
    private Integer quantity;


}