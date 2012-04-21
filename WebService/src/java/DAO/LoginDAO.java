package DAO;

import Gestion.Login;
import com.mysql.jdbc.Connection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginDAO implements InterfaceDAO {

    public boolean insert(Vector entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int update(Entidad bean, String condicion) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Ingresa en la base de datos y devuelve si el usuario y la contraseña coinciden 
    public Entidad find(String cedula, String pass) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            //// Si la condición es null o vacia, no hay parte WHERE
            String orden = "SELECT * FROM usuario where cedula ='"+cedula+"' and password ='"+pass+"'";
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

    public Vector select(String condicion) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int delete(String condicion) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Vector selectIterator(String condicion) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
