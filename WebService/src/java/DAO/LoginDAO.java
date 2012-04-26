package DAO;

import Gestion.Login;
import com.mysql.jdbc.Connection;
//import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginDAO implements InterfaceDAO {

    public boolean insert(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int update(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /*
     * Ingresa en la base de datos y devuelve si el usuario y la contraseña coinciden 
     */
    public Entidad find(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            String orden = "SELECT * FROM usuario where cedula ='"+entidad.get(0) +"' and password ='"+entidad.get(1) +"'";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            Login login = new Login();
            while (rs.next()) {
                login.setCedula(rs.getString("cedula"));
                login.setPassword(rs.getString("password"));
            }
            sentencia.close();
            return login;
        } catch (Exception ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList select(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int delete(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public ArrayList selectIterator(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
