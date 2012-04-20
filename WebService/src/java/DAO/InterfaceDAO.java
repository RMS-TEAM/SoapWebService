package DAO;
import java.sql.SQLException;
import java.util.ArrayList;

//Interface que define los metodos que tienen que implementar las clases DAO
public interface InterfaceDAO {

    public boolean insert(ArrayList entidad) throws SQLException;
    public Entidad find(ArrayList entidad) throws SQLException;
    public int update(ArrayList entidad) throws SQLException;
    public int delete(ArrayList entidad) throws SQLException;
    public ArrayList select(ArrayList entidad) throws SQLException;
    public ArrayList selectIterator(ArrayList entidad) throws SQLException;
}
