package DAO;

import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CooperativaDAO implements InterfaceDAO{

    @Override
    public boolean insert(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Entidad find(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int update(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int delete(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList select(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            String orden = "SELECT * FROM entidad";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            ArrayList al = new ArrayList();
            while (rs.next()) {
                al.add(rs.getString("nombre"));
            }
            sentencia.close();
            return al;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public ArrayList selectIterator(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    } 
}
