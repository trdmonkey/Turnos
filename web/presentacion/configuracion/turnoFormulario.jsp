<%-- 
    Document   : turnoFormulario
    Created on : 20/10/2021, 2:10:18 p. m.
    Author     : SENA
--%>

<%@page import="clases.CategoriaPaciente"%>
<%@page import="clasesGenericas.Fecha"%>
<%@page import="clases.Turno"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    Persona persona=new Persona(request.getParameter("identificacion"));
    String filtro="identificacion='"+IDENTIFICACION.getIdentificacion()+"'";
    
    CategoriaPaciente categoriaPaciente=new CategoriaPaciente();
    String titulo="Adicionar";
    Turno turno=null;
    
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        turno=new Turno(request.getParameter("id"));
    }else{
        turno=new Turno();
        turno.setDia("0");
    }
    
    String fecha="00:00:00";
    String fechaSumada=Fecha.sumarHoras(fecha, 7);
    
    
%>
<h3 class="banner" ><%= titulo.toUpperCase() %> TURNO  <%= persona.getNombreCompleto().toUpperCase() %> </h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=configuracion/turnoActualizar.jsp">
<table>
    <tr><td>Dia</td><td> <select name="dia" ><%= Fecha.getDiasEnOptions(Integer.parseInt(turno.getDia())) %></select></td> </tr>
    <tr><td>Fecha</td><td> <input type="date" name="fecha" value="<%= turno.getFecha()%>" ></td> </tr>
    <tr><td>Hora Inicio</td><td> <input type="text" name="horaInicio" value="<%= turno.getHoraInicio()%>" ></td> </tr>
    <tr><td>Hora Final</td> <td><input type="text" name="horaFinal" value="<%= turno.getHoraFinal()%>" > </td></tr>
    <label><%=fechaSumada%></label>
    <tr><td>Categoria del Paciente</td><td> <select name="categoriaPaciente" ><%= categoriaPaciente.getListaEnOptions(persona.getIdCargo()) %></select></td> </tr>
    <tr><td>Cantidad de pacientes</td> <td><input type="number" name="cantidadPaciente" value="<%= turno.getHoraFinal()%>" > </td></tr>
</table>
<p>
    <input type="hidden" name="id" value="<%= turno.getId() %>">
    <input type="hidden" name="identificacionPersona" value="<%= request.getParameter("identificacionPersona") %>">
<center><input type="submit" name="accion" class="boton" value="<%=titulo%>"></center>    
</form>