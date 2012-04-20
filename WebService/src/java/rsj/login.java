package rsj;

import DAO.FactoryDAO;
import DAO.InterfaceDAO;
import Gestion.Login;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import security.Secure;


@WebService(serviceName = "login")
public class login {

    /*
     * Retorna la lista de cooperativas registradas en la plataforma
     */
    @WebMethod
    public String[] get_cooperativas(){
        String cooperativas[] = {"true", "Coomeva", "Colanta", "UPB", "UdeA"};
        return cooperativas;
    }
    
    /*
     * Metodo para ingresar a la plataforma
     */
    @WebMethod
    public String[] ingresar(String cedula, String pass){
        Secure secure = new Secure();
        String retorne[] = new String[3];
        try{
            ArrayList al = new ArrayList();
            al.add(cedula);
            al.add(pass);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("login");
            Login loginEnt = (Login) daoEntidad.find(al);
            if(loginEnt.getCedula().equals(cedula) && loginEnt.getPassword().equals(pass)) {
                retorne[0] = "true";
                retorne[1] = "Ingreso exitoso!";
                retorne[2] = secure.generarToken(); 
            }else{
                retorne[0] = "false";
                retorne[1] = "usuario o contraseña erronea ";
            }
        }catch(Exception e){
            System.out.println("Error: SQL\n"+e.getMessage());
        }        
        return retorne;
    }
    
    @WebMethod
    public boolean conectado(String token){
        Secure secure = new Secure();
        return secure.existeToken(token);
    }
    
    @WebMethod
    public boolean salir(String token){
        Secure secure = new Secure();
        int salida = secure.eliminarToken(token);
        if (salida > 0)
            return true;
        else return false;
    }
}
