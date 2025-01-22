package lk.ijse.BO;

import lk.ijse.BO.custom.*;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {

    }

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }
    public enum BoType{
        Product,Cart, Category, Order, User, Order_Detail,Login


    }
    public SuperBO getBo(BoType boType){
        switch (boType){
            case User:
            return new UserBOImpl();

            case Category:
                return new CategoryBOImpl();

            case Order:
                //return new OrderBOImpl();

            case Order_Detail:
                //return new Order_DetailBOImpl();

            case Cart:
                return new CartBOImpl();
            case Product:
                return new ProductBOImpl();

            case Login:
                return new LoginBOImpl();



            default:
                return null;
        }

        /*switch (boType){

            case Customer:
                return;
           *//* case Student:
                return new StudentBOImpl();
            case Payment:
                return  new PaymentBOImpl();
            case Course:
                return  new CourseBOImpl();
                case Student_Course:
                return  new Student_CourseBOImpl();
                case Login:
                    return  new LoginBOImpl();*//*
            default:
                return null;

        }*/
    }
}
