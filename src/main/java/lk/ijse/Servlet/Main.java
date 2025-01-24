package lk.ijse.Servlet;

import lk.ijse.BO.BOFactory;
import lk.ijse.BO.CartBO;
import org.hibernate.Session;
import lk.ijse.config.FactoryConfiguration;
import org.hibernate.Transaction;

/**
 * Author: vishmee
 * Date: 1/16/25
 * Time: 2:31 AM
 * Description:
 */
public class Main {
    static CartBO cartBO = (CartBO) BOFactory.getBoFactory().getBo(BOFactory.BoType.Cart);

    public static void main(String[] args) throws Exception {
         int id = 32;
         boolean isdelete = cartBO.delete(String.valueOf(id));
         if(isdelete){
             System.out.println("Deleted Successfully");
         }else{
             System.out.println("Failed to delete");
         }



    }
}
