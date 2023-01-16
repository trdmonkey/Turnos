<%-- 
    Document   : turno
    Created on : 20/10/2021, 10:58:35 a. m.
    Author     : SENA
--%>
<%@page import="clasesGenericas.Fecha"%>
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
%>
<h3 class="banner">TURNOS</h3>     
<h2 class="info"><center>TURNOS DE <%= persona.getNombreCompleto().toUpperCase() %><p>
IDENTIFICACION DEL ESPECIALISTA: <%= persona.getIdentificacion()%><p>
ESPECIALISTA: <%= persona.getCargo() %><p></h2>
<a href="configuracion/turnoExportar.jsp?identificacion=<%= persona.getIdentificacion() %>" title="Exportar Ecxel"> <img  src='css/imagenes/excel.png' /> </a>
<a href="configuracion/turnosExportarWord.jsp?identificacion=<%= persona.getIdentificacion() %>" title="Exportar Word"> <img  src='css/imagenes/word.png' /> </a></center>
<table border="0">
    <tr><th>Dia</th><th>Fecha</th><th>Hora Inicio</th><th>Hora Finalizacion</th><th>Categoria Paciente</th><th>Cantidad Pacientes</th><th> 
            <a href="principal.jsp?CONTENIDO=configuracion/turnoFormulario.jsp&identificacionPersona=<%= persona.getIdentificacion() %>" title="Adicionar nuevo turno"> <img class="verde" src='css/imagenes/adicionarverde.png' /> </a> </th></tr>
    <%= lista%>
    <input type="hidden" name="identificacion" value="<%= request.getParameter("identificacion") %>">
</table>
