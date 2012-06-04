package Gestion;

import DAO.Entidad;
import java.util.ArrayList;

public class Movimiento implements Entidad{
    
    private ArrayList<String> movimiento;
    
    public Movimiento(){
        movimiento = new ArrayList<String>();
    }

    public ArrayList<String> getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(ArrayList<String> movimiento) {
        this.movimiento = movimiento;
    }
    
    public void addMovimientos(String valor){
        this.movimiento.add(valor);
    }
    
    @Override
    public boolean esIgual(Entidad entidad) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
