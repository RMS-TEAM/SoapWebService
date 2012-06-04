package rsj;

import DAO.FactoryDAO;
import DAO.InterfaceDAO;
import Gestion.Cuentas;
import Gestion.Login;
import Gestion.Movimiento;
import java.util.ArrayList;
import javax.jws.WebMethod;
import javax.jws.WebService;
import security.Secure;


@WebService(serviceName = "login")
public class login {

    /*
     * Retorna la lista de cooperativas registradas en la plataforma
     */
    @WebMethod
    public String[] get_cooperativas(){
        try{
            ArrayList<String> al = new ArrayList<String>();
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("cooperativa");
            al = (ArrayList<String>) daoEntidad.select(al);
            String cooperativas[] = new String[al.size()+1];
            cooperativas[0] = "true";
            for(int i = 1; i <= al.size(); i++)
                cooperativas[i] = al.get(i-1); 
            return cooperativas;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    /*
     * Metodo para ingresar a la plataforma
     */
    @WebMethod
    public String[] ingresar(String cedula, String pass, String cooperativa){
        Secure secure = new Secure();
        String retorne[] = new String[3];
        try{
            ArrayList al = new ArrayList();
            al.add(cedula);
            al.add(pass);
            al.add(cooperativa);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("login");
            Login loginEnt = (Login) daoEntidad.find(al);
            if(loginEnt.getCedula().equals(cedula) && loginEnt.getPassword().equals(pass)) {
                retorne[0] = "true";
                retorne[1] = loginEnt.getUltimaVisita();
                retorne[2] = secure.generarToken(cedula); 
            }else{
                retorne[0] = "false";
            }
            return retorne;
        }catch(Exception e){
            System.out.println("Error: SQL\n"+e.getMessage());
            retorne [0] = "false";
            return retorne;
        }        
    }
    
    /*
     * Retorna si la sesion esta o no disponible
     */
    @WebMethod
    public boolean conectado(String cedula, String token){
        Secure secure = new Secure();
        return secure.existeToken(cedula, token);
    }
    
    /*
     * Destruir la sesion y actualiza el ultimo momento que se estubo activo en la plataforma
     */
    @WebMethod
    public boolean salir(String cedula, String token){
        Secure secure = new Secure();
        int salida = secure.eliminarToken(cedula, token);
        if (salida > 0)
            return true;
        else return false;
    }
    
    @WebMethod
    public ArrayList<String> show(String cedula){
        ArrayList<String> retorne = new ArrayList<String>();
        try{
            ArrayList al = new ArrayList();
            al.add(cedula);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("ahorros");
            Cuentas cuentasEnt = (Cuentas) daoEntidad.find(al);
            if(cuentasEnt.getCuentas() != null) {
                retorne.add("true");
                ArrayList<String> ahorro = cuentasEnt.getCuentas();
                for(int i = 0; i < ahorro.size(); i++){
                    retorne.add(ahorro.get(i));
                }
            }else{
                retorne.add("false");
            }
            return retorne;
        }catch(Exception e){
            System.out.println("Error: SQL\n"+e.getMessage());
            retorne.add(0,"false");
            return retorne;
        }   
    }
    
    @WebMethod
    public ArrayList<String> detalle(String cedula, String cuenta){
        ArrayList<String> retorne = new ArrayList<String>();
        try{
            ArrayList al = new ArrayList();
            al.add(cedula);
            al.add(cuenta);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("ahorrosDetalle");
            Movimiento movimientosEnt = (Movimiento) daoEntidad.find(al);
            if(movimientosEnt.getMovimiento() != null) {
                retorne.add("true");
                ArrayList<String> detalle = movimientosEnt.getMovimiento();
                for(int i = 0; i < detalle.size(); i++){
                    retorne.add(detalle.get(i));
                }
            }else{
                retorne.add("false");
            }
            return retorne;
        }catch(Exception e){
            System.out.println("Error: SQL\n"+e.getMessage());
            retorne.add(0,"false");
            return retorne;
        } 
    }
}
