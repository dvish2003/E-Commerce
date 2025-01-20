package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 1:43 AM
 * Description:
 */

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {
    private int userId;
    private String username;
    private String password;
    private String email;
    private String Role;

}
