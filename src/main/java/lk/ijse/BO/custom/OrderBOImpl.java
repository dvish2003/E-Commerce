package lk.ijse.BO.custom;

import lk.ijse.BO.OrderBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.OrderDAO;
import lk.ijse.DTO.OrderDTO;
import lk.ijse.Entity.Order;
import lk.ijse.Entity.User;

import java.util.ArrayList;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:27 PM
 * Description: 
 */
public class OrderBOImpl implements OrderBO {
    OrderDAO orderDAO = (OrderDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Order);
    @Override
    public boolean save(OrderDTO dto) throws Exception {
        return orderDAO.save(new Order(dto.getOrderId(),new User(
                dto.getUser().getUserId(),
                dto.getUser().getUsername(),
                dto.getUser().getPassword(),
                dto.getUser().getEmail(),
                dto.getUser().getRole(),
                new ArrayList<>(),
                new ArrayList<>()
        ),
                dto.getOrderDate(),dto.getTotalAmount(),new ArrayList<>()));
    }
    @Override
    public OrderDTO getLastOrderId() {
        return null;
    }
}
