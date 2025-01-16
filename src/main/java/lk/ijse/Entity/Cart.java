package lk.ijse.Entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:44 AM
 * Description:
 */
@Entity
@Table(name = "cart")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cartId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    private Integer quantity;

    // Getters and setters
}