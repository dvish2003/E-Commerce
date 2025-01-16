package lk.ijse.ecommerce.BO;

public class BOFactory {
    private static BOFactory boFactory;
    private BOFactory() {

    }

    public static BOFactory getBoFactory() {
        return (boFactory == null) ? boFactory = new BOFactory() : boFactory;
    }
    public enum BoType{
        Customer, Item, Payment, Order, Order_Detail

    }
    public SuperBO getBo(BoType boType){
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
        return null;
    }
}
