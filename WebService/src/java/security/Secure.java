package security;

import DAO.FactoryDAO;
import DAO.InterfaceDAO;
import Gestion.Token;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;

public class Secure {
    
    private SecureRandom random = new SecureRandom();
    
    /*
     * Meto para generar un token por cada sesion 
     */
    public String generarToken(){
        try{
            String token = new BigInteger(130, random).toString(32);
            token += " " + new Date().getTime();

            ArrayList al = new ArrayList();
            al.add(token);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("token");
            boolean tokenEnt = (boolean) daoEntidad.insert(al);
            if(tokenEnt)
                return token;
            else
                return "";
        }catch(Exception e){
            System.out.println(e.getMessage());
            return "";
        }
    }
    
    /*
     * Retorna si existe el token, el token solo dura 10 minutos para cada sesion
     */
    public boolean existeToken(String token){
        try{
            long millsecPerMinute = 60 * 1000;
            String tok[] = token.split(" ");
            long time = Long.valueOf(tok[1]);
            boolean ret = false;
            long diferencia = ( (new Date().getTime()) - time ) / millsecPerMinute;

            ArrayList al = new ArrayList();
            al.add(token);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("token");
            Token tokenEnt = (Token) daoEntidad.find(al);
            
            if(diferencia > 10 && token.equals(tokenEnt.getToken())){        //Se paso el tiempo y se elimina el token
                int tokenDelEnt = eliminarToken(token);
                ret = false;
            }else{
                ret = true;
            }
            return ret;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public int eliminarToken(String token){
        try{
            ArrayList al = new ArrayList();
            al.add(token);
            InterfaceDAO daoEntidad = FactoryDAO.getDAO("token");
            int tokenDelEnt = (int) daoEntidad.delete(al);
            return tokenDelEnt;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
}
