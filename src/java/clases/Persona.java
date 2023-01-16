/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import clasesGenericas.conectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SENA
 */
public class Persona {
    private String identificacion;
    private String nombreCompleto;
    private String idCargo;
    private String clave;

    public Persona() {
    }

    public Persona(String identificacion, String nombreCompleto, String idCargo, String clave) {
        this.identificacion = identificacion;
        this.nombreCompleto = nombreCompleto;
        this.idCargo = idCargo;
    }

    public Persona(String identificacion) {
        String CadenaSQL="select identificacion, nombreCompleto, idCargo, clave from persona where identificacion='"+identificacion+"'";
        ResultSet resultado=conectorBD.consultar(CadenaSQL);
        try {
            if(resultado.next()){
                this.identificacion = identificacion;
                this.nombreCompleto=resultado.getString("nombreCompleto");
                this.idCargo=resultado.getString("idCargo");
                this.clave=resultado.getString("clave");
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cargar la cadenaSQL: "+CadenaSQL+" \n: ERROR:"+ex.getMessage());
        }
                
    }

    public String getIdentificacion() {
        if(identificacion==null) return "";
        else return identificacion;
    }
    

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombreCompleto() {
        if(nombreCompleto==null) return "";
        else return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getIdCargo() {
         return idCargo;
    }
    
    public Cargo getCargo(){
        return new Cargo(idCargo);
    }

    public void setIdCargo(String idCargo) {
        this.idCargo = idCargo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    @Override
    public String toString() {
        return nombreCompleto;
    }
    
    public void guardar(){
        String cadenaSQL="insert into persona (identificacion,nombrecompleto,idcargo,clave) values ('"+identificacion+"','"+nombreCompleto+"','"+idCargo+"','"+clave+"')";
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void modificar(String identificacionAnterior){
        String cadenaSQL="update persona set identificacion='"+identificacion+"', nombreCompleto='"+nombreCompleto+"', "
                + "idCargo='"+idCargo+"', clave='"+clave+"' where identificionAnterior='"+identificacionAnterior+"' ";
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void eliminar(){
        String CadenaSQL="delete from persona where identificacion="+identificacion;
        conectorBD.ejecutarQuery(CadenaSQL);
    }
    
    public static Persona validar(String identificacion, String clave){
        Persona persona=null;
        String CadenaSQL="select identificacion, nombreCompleto, idCargo, clave from persona where identificacion='"+identificacion+"' and "
                + "clave='"+clave+"'";
        ResultSet resultado=conectorBD.consultar(CadenaSQL);
        try {
            if(resultado.next()){
                
                persona=new Persona();
                persona.identificacion=identificacion;
                persona.nombreCompleto=resultado.getString("nombreCompleto");
                persona.idCargo=resultado.getString("idCargo");
                persona.clave=resultado.getString("clave");
                
            }
        } catch (SQLException ex) {
            System.out.println("Error al intentar validar el usuario "+CadenaSQL+" \n ERROR: "+ex.getMessage());
        }
            return persona;    
    }
    
    public static ResultSet getLista(String filtro){
        if(filtro!=null) filtro="";
        else filtro=" where "+filtro;
        ResultSet resultado=null;
        String CadenaSQL="select identificacion, nombreCompleto, idCargo, Clave from persona"+filtro;
        return conectorBD.consultar(CadenaSQL);
    }
    
    public static ArrayList<Persona> getListaEnObjetos(String filtro){
        ArrayList<Persona> lista=new ArrayList<Persona>();
        ResultSet resultado=Persona.getLista(filtro);
        try {
            while(resultado.next()){
                Persona persona=new Persona();
                
                persona.setIdentificacion(resultado.getString("identificacion"));
                persona.setNombreCompleto(resultado.getString("nombrecompleto"));
                persona.setIdCargo(resultado.getString("idcargo"));
                persona.setClave(resultado.getString("clave"));
                
                lista.add(persona);
                
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cargar la lista de personas "+ex.getMessage());
        }
        return lista;
    }
    
    public static String getListaEnOptions(String predeterminado){
        String lista="";
        ArrayList<Persona> resultado=Persona.getListaEnObjetos(null);
        for (int i = 0; i < resultado.size(); i++) {
            Persona persona = resultado.get(i);
            String auxiliar="";
            if(persona.getIdentificacion().equals(predeterminado)) auxiliar="selected";
            lista+="<option value='"+persona.getIdentificacion()+"'"+auxiliar+"> "+persona.getNombreCompleto()+" </option>";
            
        }
        return lista;
    }
}
