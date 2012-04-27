package DAO;

public class FactoryDAO {
    //Patron Factory
    static public InterfaceDAO getDAO(String dao){
        if(dao.equals("login"))
            return new LoginDAO();
        if(dao.equals("token"))
            return new TokenDAO();
        if(dao.equals("cooperativa"))
            return new CooperativaDAO();
        return null;
    }
}
