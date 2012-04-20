
package Gestion;

import DAO.Entidad;

//Clase que mapea con la base de datos, contiene variables iguales a la base de datos
public class Login implements Entidad {

    private String cedula;
    private String password;
    
    public Login(){
        this.cedula = "";
        this.password = "";
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean esIgual(Entidad entidad) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
