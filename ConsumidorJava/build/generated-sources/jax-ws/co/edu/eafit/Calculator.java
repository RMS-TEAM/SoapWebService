
package co.edu.eafit;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.5-b04 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "Calculator", targetNamespace = "http://eafit.edu.co/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface Calculator {


    /**
     * 
     * @param arg1
     * @param arg0
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sumar", targetNamespace = "http://eafit.edu.co/", className = "co.edu.eafit.Sumar")
    @ResponseWrapper(localName = "sumarResponse", targetNamespace = "http://eafit.edu.co/", className = "co.edu.eafit.SumarResponse")
    @Action(input = "http://eafit.edu.co/Calculator/sumarRequest", output = "http://eafit.edu.co/Calculator/sumarResponse")
    public int sumar(
        @WebParam(name = "arg0", targetNamespace = "")
        int arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        int arg1);

    /**
     * 
     * @param arg1
     * @param arg0
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "restar", targetNamespace = "http://eafit.edu.co/", className = "co.edu.eafit.Restar")
    @ResponseWrapper(localName = "restarResponse", targetNamespace = "http://eafit.edu.co/", className = "co.edu.eafit.RestarResponse")
    @Action(input = "http://eafit.edu.co/Calculator/restarRequest", output = "http://eafit.edu.co/Calculator/restarResponse")
    public int restar(
        @WebParam(name = "arg0", targetNamespace = "")
        int arg0,
        @WebParam(name = "arg1", targetNamespace = "")
        int arg1);

}
