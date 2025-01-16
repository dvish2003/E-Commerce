package lk.ijse.BO.custom;

import lk.ijse.BO.UserBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.UserDAO;
import lk.ijse.DTO.UserDTO;
import lk.ijse.Entity.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 2:57 PM
 * Description:
 */
public class UserBOImpl implements UserBO {
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    @Override
    public boolean save(UserDTO dto) throws Exception {
        return userDAO.save(new User(
                dto.getUserId(),
                dto.getUsername(),
                dto.getPassword(),
                dto.getEmail(),
                dto.getActive(),
                new ArrayList<>(),
                new ArrayList<>()));
    }

    @Override
    public boolean update(UserDTO dto) throws Exception {
        return userDAO.update(new User(
                dto.getUserId(),
                dto.getUsername(),
                dto.getPassword(),
                dto.getEmail(),
                dto.getActive(),
                new ArrayList<>(),
                new ArrayList<>()));
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return userDAO.delete(ID);
    }

    @Override
    public List<User> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
    @Override
    public User searchByEmail(String email) throws SQLException, ClassNotFoundException {
    return userDAO.searchByEmail(email);
    }
}
