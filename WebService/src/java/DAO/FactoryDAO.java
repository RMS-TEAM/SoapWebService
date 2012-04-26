package DAO;

public class FactoryDAO {
    //Patron Factory
    static public InterfaceDAO getDAO(String dao){
        if(dao.equals("login"))
            return new LoginDAO();
        if(dao.equals("token"))
            return new TokenDAO();
        return null;
    }
}
