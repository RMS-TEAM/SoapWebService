package DAO;

import Gestion.Cuentas;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CuentaDAO implements InterfaceDAO{

    @Override
    public boolean insert(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Entidad find(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            String orden = "SELECT DISTINCT portafolio.nro_producto, agencia.nombre AS ubicacion, portafolio.saldo_actual, producto.nombre AS tipo, clase.nombre AS clase, entidad.nombre AS entidad FROM `portafolio`, producto, agencia, clase, entidad WHERE portafolio.cliente = '"+entidad.get(0) +"' AND portafolio.agencia = agencia.agencia AND producto.producto = portafolio.producto AND portafolio.clase = clase.clase AND entidad.entidad = portafolio.entidad";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            Cuentas cuentas = new Cuentas();
            while (rs.next()) {
                String a = rs.getString("nro_producto") + "// " + rs.getString("tipo") + "// " + rs.getString("ubicacion") + "// " + rs.getString("saldo_actual") + "// " + rs.getString("clase") + "// " + rs.getString("entidad");
                cuentas.addCuentas(a);  
            }
            sentencia.close();
            return cuentas;
        } catch (Exception ex) {
            return null;
        }
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
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList selectIterator(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
