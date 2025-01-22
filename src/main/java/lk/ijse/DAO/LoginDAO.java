package lk.ijse.DAO;

import lk.ijse.Entity.Login;

public interface LoginDAO extends CrudDAO<Login> {

    Login getLastLogin();
}
