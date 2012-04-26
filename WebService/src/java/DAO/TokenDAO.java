package DAO;

import Gestion.Token;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TokenDAO implements InterfaceDAO {

    public boolean insert(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            //// Si la condición es null o vacia, no hay parte WHERE
            String orden = "INSERT INTO token VALUES('"+entidad.get(0)+"')";
            java.sql.Statement sentencia = con.createStatement();
            sentencia.executeUpdate(orden);
            sentencia.close();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public int update(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    
    public Entidad find(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            String orden = "SELECT * FROM token where user_token ='"+entidad.get(0) +"'";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            Token token = new Token();
            while (rs.next()) {
                token.setToken(rs.getString("user_token"));
            }
            sentencia.close();
            return token;
        } catch (Exception ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList select(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int delete(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            //// Si la condición es null o vacia, no hay parte WHERE
            String orden = "DELETE FROM token WHERE user_token = '"+entidad.get(0)+"'";
            java.sql.Statement sentencia = con.createStatement();
            int eliminados = sentencia.executeUpdate(orden);
            sentencia.close();
            return eliminados;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return 0;
        }
    }

    public ArrayList selectIterator(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
