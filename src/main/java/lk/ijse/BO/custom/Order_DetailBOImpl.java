package lk.ijse.BO.custom;

import lk.ijse.BO.Order_DetailBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.OrderDetailDAO;
import lk.ijse.DTO.OrderDetailDTO;
import lk.ijse.Entity.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:28 PM
 * Description: 
 */
public class Order_DetailBOImpl implements Order_DetailBO {
    OrderDetailDAO orderDetailDAO = (OrderDetailDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Order_Detail);
    @Override
    public boolean save(List<OrderDetailDTO> odList) throws Exception {
        for (OrderDetailDTO od : odList) {
            boolean isSaved = saveOrderDetail(od);
            if(!isSaved) {
                return false;
            }
        }
        return true;
    }
    @Override
    public boolean saveOrderDetail(OrderDetailDTO od) throws Exception {
        return orderDetailDAO.save( new OrderDetail(
                od.getOrderDetailId(),
                new Order(
                        od.getOrder().getOrderId(),
                        new User(
                                od.getOrder().getUser().getUserId(),
                                od.getOrder().getUser().getUsername(),
                                od.getOrder().getUser().getPassword(),
                                od.getOrder().getUser().getEmail(),
                                od.getOrder().getUser().getRole(),
                                new ArrayList<>(),
                                new ArrayList<>()
                        ),
                        od.getOrder().getOrderDate(),
                        od.getOrder().getTotalAmount(),
                        new ArrayList<>()

                ),
                new Product(
                        od.getProduct().getProductId(),
                        od.getProduct().getName(),
                        od.getProduct().getPrice(),
                        od.getProduct().getDescription(),
                        od.getProduct().getQuantity(),
                        od.getProduct().getImagePath(),
                        new Category(od.getProduct().getCategory().getCategoryId(),od.getProduct().getName(),new ArrayList<>()),
                        new ArrayList<>(),
                        new ArrayList<>()
                ),
                od.getQuantity(),
                od.getPrice()
        ));
    }
}
