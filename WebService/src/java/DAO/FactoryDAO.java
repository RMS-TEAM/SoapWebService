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
        if(dao.equals("ahorros"))
            return new CuentaDAO();
        if(dao.equals("ahorrosDetalle"))
            return new AhorrosDetalleDAO();
        return null;
    }
}
