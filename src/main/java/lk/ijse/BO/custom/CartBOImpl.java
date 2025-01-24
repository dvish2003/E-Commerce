package lk.ijse.BO.custom;

import lk.ijse.BO.CartBO;
import lk.ijse.DAO.CartDAO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DTO.CartDTO;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.DTO.UserDTO;
import lk.ijse.Entity.Cart;
import lk.ijse.Entity.Category;
import lk.ijse.Entity.Product;
import lk.ijse.Entity.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/22/25
 * Time: 7:36 PM
 * Description:
 */
public class CartBOImpl implements CartBO {
    CartDAO cartDAO = (CartDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Cart);
    @Override
    public boolean save(CartDTO dto) throws Exception {
        return cartDAO.save(new Cart(dto.getCartId(),new User(
                dto.getUser().getUserId(),
                dto.getUser().getUsername(),
                dto.getUser().getPassword(),
                dto.getUser().getEmail(),
                dto.getUser().getRole(),
                new ArrayList<>(),
                new ArrayList<>()),
                new Product(
                        dto.getProduct().getProductId(),
                        dto.getProduct().getName(),
                        dto.getProduct().getPrice(),
                        dto.getProduct().getDescription(),
                        dto.getProduct().getQuantity(),
                        dto.getProduct().getImagePath(),
                        new Category(dto.getProduct().getCategory().getCategoryId(),dto.getProduct().getName(),new ArrayList<>()),
                        new ArrayList<>(),
                        new ArrayList<>()
                ),dto.getQuantity()));
    }

    @Override
    public boolean update(CartDTO dto) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return cartDAO.delete(Integer.parseInt(ID));
    }
    @Override
    public boolean deleteUserID(String ID) throws Exception {
        return cartDAO.deleteUserID(Integer.parseInt(ID));
    }

        @Override
    public List<CartDTO> getAll() throws SQLException, ClassNotFoundException {
        return List.of();
    }
    @Override
    public List<CartDTO> getCartsByUserId(int userId) {
           List<Cart> listCart = cartDAO.getCartsByUserId(userId);
           List<CartDTO> list = new ArrayList<CartDTO>();
           for(Cart cart : listCart){
               list.add(new CartDTO(
                       cart.getCartId(),
                       new UserDTO(
                               cart.getUser().getUserId(),
                               cart.getUser().getUsername(),
                               cart.getUser().getPassword(),
                               cart.getUser().getEmail(),
                               cart.getUser().getRole()),
                       new ProductDTO(
                               cart.getProduct().getProductId(),
                               cart.getProduct().getName(),
                               cart.getProduct().getPrice(),
                               cart.getProduct().getDescription(),
                               cart.getProduct().getQuantity(),
                               cart.getProduct().getImagePath(),
                       new CategoryDTO(cart.getProduct().getCategory().getCategoryId(),cart.getProduct().getCategory().getName())),
                       cart.getQuantity()));
           }

        return list;
    }
}
