package lk.ijse.BO;

import lk.ijse.BO.custom.UserBOImpl;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {

    }

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }
    public enum BoType{
        Cart, Category, Order, User, Order_Detail


    }
    public SuperBO getBo(BoType boType){
        switch (boType){
            case User:
            return new UserBOImpl();

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
