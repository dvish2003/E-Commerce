package lk.ijse.DTO;

import jakarta.persistence.*;
import lk.ijse.Entity.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:43 AM
 * Description:
 */
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private int productId;
    private String name;
    private Double price;
    private String description;
    private int quantity;
    private String imagePath;
    private CategoryDTO category;
}