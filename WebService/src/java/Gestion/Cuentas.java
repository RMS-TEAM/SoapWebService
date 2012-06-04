package Gestion;

import DAO.Entidad;
import java.util.ArrayList;

public class Cuentas implements Entidad{
    
    private ArrayList<String> cuentas;
    
    public Cuentas(){
        cuentas = new ArrayList<String>();
    }

    public ArrayList<String> getCuentas() {
        return cuentas;
    }

    public void setCuentas(ArrayList<String> ahorros) {
        this.cuentas = ahorros;
    }
    
    public void addCuentas(String valor){
        this.cuentas.add(valor);
    }

    @Override
    public boolean esIgual(Entidad entidad) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
