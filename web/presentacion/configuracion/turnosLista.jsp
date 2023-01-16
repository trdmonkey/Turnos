<%-- 
    Document   : turnosLista
    Created on : 21/10/2021, 1:45:43 p. m.
    Author     : SENA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Turno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    //Motores de busqueda
    
    
    ResultSet resultado=Turno.getListaTurnos();
    String lista="";
    while(resultado.next()){
        lista+="<tr>";
        lista+="<td>" + resultado.getString("nombreCompleto") + "</td>";
        lista+="<td>" + resultado.getString("especialidad") + "</td>";
        lista+="<td>" + resultado.getString("descripcion") + "</td>";
        lista+="<td>" + resultado.getString("fecha") + "</td>";
        lista+="<td>" + resultado.getString("hora_inicio_turno") + "</td>";
        lista+="<td>" + resultado.getString("hora_finalizacion_turno") + "</td>";
        lista+="<td>" + resultado.getString("pacientes_asignados") + "</td>";
        lista+="</tr>";
        
    }

%>
<h3 class="banner" id="turnos">TURNOS</h3>
<table border="0">
    <tr><th>Nombre Completo</th><th>Especialidad</th><th>Descripcion</th><th>Fecha</th><th>Hora Inicio turno</th><th>Hora fin de turno</th><th>Pacientes Asignados</th></tr>
    <%= lista %>
</table>