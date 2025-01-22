package lk.ijse.DAO;

import lk.ijse.DAO.custom.*;

public class DAOFactory {
    private static DAOFactory daoFactory;

    private DAOFactory() {
    }

    public static DAOFactory getDaoFactory() {
        return (daoFactory == null) ? daoFactory = new DAOFactory() : daoFactory;
    }

    public enum DaoType {
        Product,Cart, Category, Order, User, Order_Detail,Login
    }

    public SuperDAO getDAO(DaoType daoType) {
switch (daoType) {
    case Cart:
        return new CartDAOImpl();
    case Category:
        return new CategoryDAOImpl();
    case Order:
        return new OrderDAOImpl();
    case User:
        return new UserDAOImpl();
    case Order_Detail:
        return new Order_DetailDAOImpl();
        case Product:
            return new ProductDAOImpl();
            case Login:
                return new LoginDAOImpl();

    default:
        return null;
    }
    }
}
      /*  switch (daoType) {
            case Customer:
                return new CustomerDAOImpl();
            *//*case Student:
                return new StudentDAOImpl();
            case Payment:
                return new PaymentDAOImpl();
            case Course:
                return new CourseDAOImpl();
            case Student_Course:
                return new Student_CourseDAOImpl();
                case Login:
                    return new LoginDAOImpl();*//*
            default:
                return null;
        }*/
