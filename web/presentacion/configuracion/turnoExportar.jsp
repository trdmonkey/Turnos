<%-- 
    Document   : turnoExportar
    Created on : 21/10/2021, 2:13:06 p. m.
    Author     : SENA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.Turno"%>
<%@page import="clases.Persona"%>
<%@page contentType="application-/vnd.ms-excel"%>


<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    Persona persona=new Persona(request.getParameter("identificacion"));
    
    //Turno turno=new Turno();
    String lista="";
    String filtro="";
    if(!filtro.equals("")) filtro+=" and ";
    filtro+="identificacionPersona='"+persona.getIdentificacion()+"'";
    ArrayList<Turno> datos=Turno.getListaEnObjetos(filtro);
    for (int i = 0; i < datos.size(); i++) {
            Turno turno = datos.get(i);
            
            lista+="<tr>";
            lista+="<td>" + turno.getDiaEnLetras()+ "</td>";
            lista+="<td>" + turno.getFecha() + "</td>";
            lista+="<td>" + turno.getHoraInicio()+ "</td>";
            lista+="<td>" + turno.getHoraFinal() + "</td>";
            lista+="<td>" + turno.getCategoriaPaciente()+ "</td>";
            lista+="<td>" + turno.getCantidadPaciente() + "</td>";
            lista+="</tr>";
        }
        
    String nombreArchivo="reporte.xls";
    response.setHeader("Content-Disposition","attachment;filename="+nombreArchivo);
%>
TURNOS DE <%= persona.getNombreCompleto().toUpperCase() %><P>
    IDENTIFICACION DEL ESPECIALISTA: <%= persona.getIdentificacion()%><P>
ESPECIALISTA: <%= persona.getCargo() %>
<p>
<table border="1">
    <tr><th>Dia</th><th>Fecha</th><th>Hora Inicio</th><th>Hora Finalizacion</th><th>Categoria Paciente</th><th>Cantidad Pacientes</th></tr>
    <%= lista%>
</table>
