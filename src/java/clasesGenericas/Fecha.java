/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clasesGenericas;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

/**
 *
 * @author SENA
 */
public class Fecha {
    public static SimpleDateFormat formatoFecha=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static SimpleDateFormat formatoHora=new SimpleDateFormat("HH:mm:ss");
    public static String [] dias={"Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado"};
    
    public static int calcularDiferenciaFechas(String fecha1, String fecha2){
        int diferencia=0;
        if(!fecha2.equals(" ")){
            try {
                Date fechaInicial=formatoFecha.parse(fecha1);
                Date fechaFinal=formatoFecha.parse(fecha2);
                diferencia=(int)((fechaFinal.getTime()-fechaInicial.getTime())/1000);
            } catch (ParseException e) {
                System.out.println("Error al convertir cadena Fecha a Date"+e.getMessage());
                
            }   
        }
        return diferencia;
    }
    
    public static String obtenerFechaActual(){
        Date fecha=new Date();
        return formatoFecha.format(fecha);
    }
    
    public static String getDiasEnOptions(int preseleccionado){
        String lista="";
        String [] dias=Fecha.dias;
        for (int i = 0; i < dias.length; i++) {
            String auxiliar = "";
            if (i==preseleccionado) auxiliar="selected";
            lista+="<option value='"+i+"' "+auxiliar+" >" +dias[i]+ "</option>";
        }
        return lista;
    }
    
    public static String sumarHorasAFecha(String fechaHora, int horasASumar){
        String fechaHoraSalida="";
        try { 
            Date horaIngresada=formatoFecha.parse(fechaHora);
            long tiempo=horaIngresada.getTime()+horasASumar*60*60*1000;//horas*60 minutos*60 segundos*1000 milisengundos
            horaIngresada=new Date(tiempo);
            fechaHoraSalida=formatoFecha.format(horaIngresada);
            
        } catch (ParseException ex) {
            //Logger.getLogger(Fecha.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en el formato de la hora");
        }
        return fechaHora;
    }
    
    public static String sumarHoras(String Hora, int horasASumar){
        String HoraSalida="";
        try { 
            Date horaIngresada=formatoHora.parse(Hora);
            long tiempo=horaIngresada.getTime()+horasASumar*60*60*1000;//horas*60 minutos*60 segundos*1000 milisengundos
            horaIngresada=new Date(tiempo);
            HoraSalida=formatoHora.format(horaIngresada);
            
        } catch (ParseException ex) {
            System.out.println("Error en el formato de la hora");
        }
        return Hora;
    }
    
}
