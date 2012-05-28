package Gestion;

import DAO.Entidad;
import java.util.ArrayList;

public class Ahorros implements Entidad{
    
    private ArrayList<String> ahorros;
    
    public Ahorros(){
        ahorros = new ArrayList<String>();
    }

    public ArrayList<String> getAhorros() {
        return ahorros;
    }

    public void setAhorros(ArrayList<String> ahorros) {
        this.ahorros = ahorros;
    }
    
    public void addAhorros(String valor){
        this.ahorros.add(valor);
    }

    @Override
    public boolean esIgual(Entidad entidad) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
