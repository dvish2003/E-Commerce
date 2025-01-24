package lk.ijse.BO.custom;

import lk.ijse.BO.ProductBO;
import lk.ijse.DAO.DAOFactory;
import lk.ijse.DAO.ProductDAO;
import lk.ijse.DTO.CategoryDTO;
import lk.ijse.DTO.OrderDetailDTO;
import lk.ijse.DTO.ProductDTO;
import lk.ijse.Entity.Category;
import lk.ijse.Entity.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: vishmee
 * Date: 1/19/25
 * Time: 12:20 PM
 * Description:
 */
public class ProductBOImpl implements ProductBO {
    ProductDAO productDA0 = (ProductDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Product);
    @Override
    public boolean save(ProductDTO dto) throws Exception {
        return productDA0.save(new Product(dto.getProductId(),dto.getName(),dto.getPrice(), dto.getDescription(),dto.getQuantity(),dto.getImagePath(),new Category(dto.getCategory().getCategoryId(),dto.getCategory().getName(),new ArrayList<>()),new ArrayList<>(),new ArrayList<>()));

    }

    @Override
    public boolean update(ProductDTO dto) throws Exception {
        return productDA0.update(new Product(dto.getProductId(),dto.getName(),dto.getPrice(), dto.getDescription(),dto.getQuantity(),dto.getImagePath(),new Category(dto.getCategory().getCategoryId(),dto.getCategory().getName(),new ArrayList<>()),new ArrayList<>(),new ArrayList<>()));
    }

    @Override
    public boolean delete(String ID) throws Exception {
        return productDA0.delete(Integer.parseInt(ID));
    }

    @Override
    public List<ProductDTO> getAll() throws SQLException, ClassNotFoundException {
        List<Product> products = productDA0.getAll();
        List<ProductDTO> productDTOS = new ArrayList<ProductDTO>();
        for(Product product : products){
            productDTOS.add(new ProductDTO(
                    product.getProductId(),
                    product.getName(),
                    product.getPrice(),
                    product.getDescription(),
                    product.getQuantity(),
                    product.getImagePath(),
                    new CategoryDTO(product.getCategory().getCategoryId(), product.getCategory().getName())));
        }
        return productDTOS;
    }
    @Override
    public boolean update1(List<OrderDetailDTO> odList) throws SQLException, ClassNotFoundException {
        for (OrderDetailDTO od : odList) {
            boolean isUpdateQty = updateQty(String.valueOf(od.getProduct().getProductId()), od.getQuantity());
            if(!isUpdateQty) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean updateQty(String Id, int qty) throws SQLException, ClassNotFoundException {
        return productDA0.updateQty(Id,qty);
    }
}
