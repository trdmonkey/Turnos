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
public class Cargo {
    private String id;
    private String nombre;
    private String descripcion;

    public Cargo() {
    }

    public Cargo(String id, String nombre, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Cargo(String id) {
        String cadenaSQL="select id, nombre, descripcion from cargo where id="+id;
        try {
            ResultSet resultado=conectorBD.consultar(cadenaSQL);
            if(resultado.next()){
                this.id = id;
                this.nombre=resultado.getString("nombre");
                this.descripcion=resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo conectar la cadenaSQL"+cadenaSQL+" \n ERROR: "+ex.getMessage());
        }
        
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        if(nombre==null) return "";
        else  return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        if(descripcion==null) return "";
        else return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return nombre;
    }
    
    public void guardar(){
        String cadenaSQL="insert into cargo (nombre, descripcion) values ('"+nombre+"','"+descripcion+"')";
        conectorBD.ejecutarQuery(cadenaSQL);
        System.out.println("CadenaSQL:"+cadenaSQL);
    }
    
    public void modificar(){
        String cadenaSQL="update cargo set nombre='"+nombre+"', descripcion='"+descripcion+"' where id="+id;
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void eliminar(){
        String cadenaSQL="delete from cargo where id="+id;
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public static ResultSet getLista(){
        ResultSet resultado=null;
        String cadenaSQL="select id, nombre, descripcion from cargo";
        return conectorBD.consultar(cadenaSQL);
    }
    
    public static ArrayList<Cargo> getListaEnObjetos(){
        ArrayList<Cargo> lista=new ArrayList<Cargo>();
        ResultSet resultado = Cargo.getLista();
        try {
            while(resultado.next()){
                Cargo cargo=new Cargo();
                
                cargo.setId(resultado.getString("id"));
                cargo.setNombre(resultado.getString("nombre"));
                cargo.setDescripcion(resultado.getString("descripcion"));
                
                lista.add(cargo);
            }
        } catch (SQLException ex) {
            System.out.println("Error al cargar la lista de cargos ");
        }
    return lista;    
    }
    
    public static String getListaEnOptions(String predeterminado){
        String lista="";
        ArrayList<Cargo> resultado=Cargo.getListaEnObjetos();
        for (int i = 0; i < resultado.size(); i++) {
            Cargo cargo = resultado.get(i);
            String auxiliar="";
            if(cargo.getId().equals(predeterminado)) auxiliar="selected";
            lista+="<option value=' "+cargo.getId()+" ' "+auxiliar+" > " +cargo.getNombre()+ " </option>";
        }
        return lista;
    }
}
