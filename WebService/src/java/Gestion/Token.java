
package Gestion;

import DAO.Entidad;

public class Token implements Entidad{
    private String token;
    
    public Token(){
        this.token = "";
    }
    

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
    
    public boolean esIgual(Entidad entidad) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
