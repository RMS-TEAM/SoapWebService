package DAO;

import Gestion.Movimiento;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AhorrosDetalleDAO implements InterfaceDAO{

    @Override
    public boolean insert(ArrayList entidad) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Entidad find(ArrayList entidad) throws SQLException {
        try {
            Connection con = JDBCConnection.getConexion();
            String orden = "SELECT portafolio.fecha_ultliquidacion, agencia.nombre AS lugar, movimiento.saldo FROM movimiento, portafolio, agencia WHERE movimiento.cliente = '"+entidad.get(0) +"' AND movimiento.nro_producto = '"+entidad.get(1) +"' AND portafolio.nro_producto = movimiento.nro_producto AND agencia.agencia = movimiento.agencia";
            java.sql.Statement sentencia = con.createStatement();
            ResultSet rs = sentencia.executeQuery(orden);
            Movimiento movimiento = new Movimiento();
            while (rs.next()) {
                String a = rs.getString("fecha_ultliquidacion") + "// " + rs.getString("lugar") + "// " + rs.getString("saldo");
                movimiento.addMovimientos(a);  
            }
            sentencia.close();
            return movimiento;
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
