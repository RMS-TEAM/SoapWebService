package DAO;

import Gestion.Login;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            String orden = "SELECT * FROM cliente where cliente ='"+entidad.get(0) +"' and clave ='"+entidad.get(1) +"' and entidad = (SELECT entidad FROM entidad WHERE nombre = '"+entidad.get(2)+"')";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            Login login = new Login();
            while (rs.next()) {
                login.setCedula(rs.getString("cliente"));
                login.setPassword(rs.getString("clave"));
                login.setUltimaVisita(rs.getString("ultima_visita"));
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
