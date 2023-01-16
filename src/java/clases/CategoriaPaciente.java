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
public class CategoriaPaciente {
    private String id;
    private String nommbre;
    private String descripcion;

    public CategoriaPaciente() {
    }

    public CategoriaPaciente(String id, String nommbre, String descripcion) {
        this.id = id;
        this.nommbre = nommbre;
        this.descripcion = descripcion;
    }

    public CategoriaPaciente(String id) {
        String CadenaSQL="select id, nombre, descripcion from categoriaPaciente where id="+id;
        ResultSet resultado=conectorBD.consultar(CadenaSQL);
        try {
            if(resultado.next()){
                this.id = id;
                this.nommbre=resultado.getString("nombre");
                this.descripcion=resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cargar la CadenaSQL="+CadenaSQL+"\n ERROR: "+ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNommbre() {
        return nommbre;
    }

    public void setNommbre(String nommbre) {
        this.nommbre = nommbre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return  nommbre ;
    }
    
    
    
    public static ResultSet getLista(){
        String CadenaSQL="select id, nombre, descripcion from categoriaPaciente";
        return conectorBD.consultar(CadenaSQL);
    }
    
     public static ArrayList<CategoriaPaciente> getListaEnObjetos(){
        ArrayList<CategoriaPaciente> lista= new ArrayList<CategoriaPaciente>();
        ResultSet resultado=CategoriaPaciente.getLista();
        try {
            while (resultado.next()) {
                CategoriaPaciente categoriaPaciente=new CategoriaPaciente();
                
                categoriaPaciente.setId(resultado.getString("id"));
                categoriaPaciente.setNommbre(resultado.getString("nombre"));
                categoriaPaciente.setDescripcion(resultado.getString("descripcion"));
                
                lista.add(categoriaPaciente);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cargar la lista de tipos de paciente " +ex.getMessage());
        }
        return lista;
    }
     
         public static String getListaEnOptions(String predeterminado){
        String lista="";
        ArrayList<CategoriaPaciente> resultado=CategoriaPaciente.getListaEnObjetos();
        for (int i = 0; i < resultado.size(); i++) {
            CategoriaPaciente categoriaPaciente = resultado.get(i);
            String auxiliar="";
            if(categoriaPaciente.getId().equals(predeterminado)) auxiliar="selected";
            lista+="<option value=' "+categoriaPaciente.getId()+" ' "+auxiliar+" > " +categoriaPaciente.getNommbre()+ " </option>";
        }
        return lista;
    }
}



