package lk.ijse.BO.custom;

import lk.ijse.BO.LoginBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.LoginDAO;
import lk.ijse.DTO.LoginDTO;
import lk.ijse.Entity.Login;

import java.sql.SQLException;

public class LoginBOImpl implements LoginBO {
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);

    @Override
    public boolean save(LoginDTO dto) throws Exception {
        return loginDAO.save(new Login(dto.getLogin(),dto.getUserMail()));
    }

}
