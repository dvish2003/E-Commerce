package lk.ijse.ecommerce.Entity;

import jakarta.persistence.*;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:45 AM
 * Description:
 */
@Entity
@Table(name = "order_details")
class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderDetailId;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    private Integer quantity;
    private Double price;

    // Getters and setters
}
