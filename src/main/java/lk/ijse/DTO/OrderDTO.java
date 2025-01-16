package lk.ijse.DTO;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
public  class OrderDTO {
    private int orderId;
    private UserDTO user;
    private Date orderDate;
    private Double totalAmount;
}