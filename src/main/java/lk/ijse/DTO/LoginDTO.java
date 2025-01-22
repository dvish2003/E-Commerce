package lk.ijse.DTO;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class LoginDTO {
    private int login;
    private String UserMail;
}
