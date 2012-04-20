package DAO;
import java.util.Vector;
import java.sql.SQLException;

//Interface que define los metodos que tienen que implementar las clases DAO
public interface InterfaceDAO {

    public boolean insert(Vector entidad) throws SQLException;
    public Entidad find(String nick, String pass) throws SQLException;
    public int update(Entidad bean, String condicion) throws SQLException;
    public int delete(String condicion) throws SQLException;
    public Vector select(String condicion) throws SQLException;
    public Vector selectIterator(String condicion) throws SQLException;
}
