package lk.ijse.ecommerce.Entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:43 AM
 * Description:
 */
@Entity
@Table(name = "users")
class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    private String username;
    private String password;
    private String email;
    private Boolean active;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Order> orders = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Cart> cartItems = new ArrayList<>();

    // Getters and setters
}
