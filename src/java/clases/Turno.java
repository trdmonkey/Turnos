/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import clasesGenericas.Fecha;
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
public class Turno {
    private String id;
    private String dia;
    private String fecha;
    private String horaInicio;
    private String horaFinal;
    private String idcategoriaPaciente;
    private String cantidadPaciente;
    private String identificacionPersona;

    public Turno() {
    }

    public Turno(String id, String dia, String fecha, String horaInicio, String horaFinal, String idcategoriaPaciente, String cantidadPaciente, String identificacionPersona) {
        this.id = id;
        this.dia = dia;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFinal = horaFinal;
        this.idcategoriaPaciente = idcategoriaPaciente;
        this.cantidadPaciente = cantidadPaciente;
        this.identificacionPersona = identificacionPersona;
    }

    

    public Turno(String id) {
       String CadenaSQL="select id, dia, fecha, horaInicio, horaFinal, idcategoriaPaciente, cantidadPacientes, identificacionPersona from turno where id="+id;
        ResultSet resultado=conectorBD.consultar(CadenaSQL);
        try {
            if(resultado.next()){
                 this.id = id;
                 this.dia=resultado.getString("dia");
                 this.fecha=resultado.getString("fecha");
                 this.horaInicio=resultado.getString("horaInicio");
                 this.horaFinal=resultado.getString("horaFinal");
                 this.idcategoriaPaciente=resultado.getString("idcategoriaPaciente");
                 this.cantidadPaciente=resultado.getString("cantidadPacientes");
                 this.identificacionPersona=resultado.getString("identificacionPersona");
                 
            }
        } catch (SQLException ex) {
            System.out.println("Error en la cadenaSQL="+CadenaSQL+"\n: ERROR: "+ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDia() {
        return dia;
    }
    
    public String getDiaEnLetras(){
        return Fecha.dias[Integer.parseInt(dia)];
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraInicio() {
        if(horaInicio==null) return "";
        else return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFinal() {
        if(horaFinal==null) return "";
        else return horaFinal;
    }

    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }

    public String getIdcategoriaPaciente() {
        return idcategoriaPaciente;
    }
    
    public CategoriaPaciente getCategoriaPaciente(){
        return new CategoriaPaciente(idcategoriaPaciente);
    }

    public void setIdcategoriaPaciente(String idcategoriaPaciente) {
        this.idcategoriaPaciente = idcategoriaPaciente;
    }

    public String getCantidadPaciente() {
        return cantidadPaciente;
    }

    public void setCantidadPaciente(String cantidadPaciente) {
        this.cantidadPaciente = cantidadPaciente;
    }

    public String getIdentificacionPersona() {
        return identificacionPersona;
    }
    
    
    public Persona getIdetificacion(){
        return new Persona(identificacionPersona);
    }

    public void setIdentificacionPersona(String identificacionPersona) {
        this.identificacionPersona = identificacionPersona;
    }
    
    

    @Override
    public String toString() {
        return  dia;
    }
    
    public void guardar(){
        String cadenaSQL="insert into turno (dia, fecha, horaInicio, horaFinal, idcategoriaPaciente, cantidadPacientes, identificacionPersona) "
                + "values ('"+dia+"', '"+fecha+"', '"+horaInicio+"','"+horaFinal+"', '"+idcategoriaPaciente+"', "
                + "'"+cantidadPaciente+"', '"+identificacionPersona+"')";
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    public void modificar(){
        String cadenaSQL="update turno set dia='"+dia+"',  fecha='"+fecha+"', horaInicio='"+horaInicio+"', "
                + "horaFinal='"+horaFinal+"', idcategoriaPaciente='"+idcategoriaPaciente+"', cantidadPacientes='"+cantidadPaciente+"',  identificacionPersona='"+identificacionPersona+"' where id="+id;
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    public void eliminar(){
        String cadenaSQL="delete from turno where id="+id;
        conectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public static ResultSet getLista(String filtro){
        if(filtro==null) filtro="";
        else filtro=" where "+filtro;
        String cadenaSQL="select id, dia, fecha, horaInicio, horaFinal, idcategoriaPaciente, cantidadPacientes, identificacionPersona from turno "+filtro;
        return conectorBD.consultar(cadenaSQL);
    }
    
    public static ArrayList<Turno> getListaEnObjetos(String filtro){
        ArrayList<Turno> lista= new ArrayList<Turno>();
        ResultSet resultado=Turno.getLista(filtro);
        try {
            while (resultado.next()) {
                Turno turno=new Turno();
                
                turno.setId(resultado.getString("id"));
                turno.setDia(resultado.getString("dia"));
                turno.setFecha(resultado.getString("fecha"));
                turno.setHoraInicio(resultado.getString("horaInicio"));
                turno.setHoraFinal(resultado.getString("horaFinal"));
                turno.setIdcategoriaPaciente(resultado.getString("idcategoriaPaciente"));
                turno.setCantidadPaciente(resultado.getString("cantidadPacientes"));
                turno.setIdentificacionPersona(resultado.getString("identificacionPersona"));
                
                lista.add(turno);
            }
        } catch (SQLException ex) {
            System.out.println("No se pudo cargar la lista de turnos " +ex.getMessage());
        }
        return lista;
    }
    
    public static ResultSet getListaTurnos(){
        String cadenaSQL="select nombrecompleto, nombre as especialidad, descripcion, fecha,"
                        +"horainicio as hora_inicio_turno, horafinal as hora_finalizacion_turno," 
                        +"cantidadpacientes as pacientes_asignados from turno, cargo, persona where " 
                        +"identificacionpersona=persona.identificacion and idcargo=cargo.id  order by fecha;";
        return conectorBD.consultar(cadenaSQL);
    }
    
    
    
    
    
}
