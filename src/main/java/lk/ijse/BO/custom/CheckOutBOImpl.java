package lk.ijse.BO.custom;

import lk.ijse.BO.*;
import lk.ijse.DTO.CheckOutDTO;

/**
 * Author: vishmee
 * Date: 1/24/25
 * Time: 3:25 PM
 * Description:
 */
public class CheckOutBOImpl implements CheckOutBO {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Product);
    OrderBO orderBO = (OrderBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Order);
    Order_DetailBO orderDetailBO = (Order_DetailBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Order_Detail);
    CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);
    @Override
   public boolean saveData(CheckOutDTO checkOutDTO) throws Exception {
        boolean isSaveOrder = true;
        if(isSaveOrder){
            boolean isSaveOrderDetail = orderDetailBO.save(checkOutDTO.getOdList());
            if(isSaveOrderDetail){
                boolean isUpdateQty = productBO.update1(checkOutDTO.getOdList());
           if (isUpdateQty){
                 boolean isDeleteCart = cartBO.deleteUserID(String.valueOf(checkOutDTO.getOrderDTO().getUser().getUserId()));
                     if (isDeleteCart){
                         System.out.println("All are done ");
                     }else {
                         System.out.println("Cart not delete");
                     }
              }else{
               System.out.println("not update qty");
           }

            }else {
                System.out.println("not update orderDetail");
            }
        }
        else {
            System.out.println("not update order");}

        return false;
    }
}
