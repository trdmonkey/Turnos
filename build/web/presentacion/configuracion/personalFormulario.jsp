<%-- 
    Document   : personalFormulario
    Created on : 19 oct 2021, 22:19:35
    Author     : cristian araujo
--%>

<%@page import="clases.Cargo"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    Cargo cargo=new Cargo();
    String titulo="Adicionar";
    Persona persona=null;
    
    if(request.getParameter("identificacion")!=null){
        titulo="Modificar";
        persona=new Persona(request.getParameter("identificacion"));
    }else{
        persona=new Persona();
    }
%>
<h3 class="banner"><%= titulo.toUpperCase() %> PROFESIONAL DE LA SALUD </h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=configuracion/personalActualizar.jsp">
    <table>
        <tr><th>Identificación</th><td> <input type="text" name="identificacion"  required value="<%=persona.getIdentificacion()%>" size="20"> </td></tr>
        <tr><th>Nombre Completo</th><td> <input type="text" name="nombre"  required value="<%=persona.getNombreCompleto()%>" size="70"> </td></tr>
        <tr><th>Profesión</th><td> <select name="cargo"> <%= Cargo.getListaEnOptions(persona.getIdCargo()) %> </select> </td></tr>
        <tr><th>Clave</th><td> <input type="password" name="clave"  required value="<%=persona.getClave()%>" size="20"> </td></tr>
    </table>
        <p>
        <input type="hidden" name="identificacionAnterior" value="<%=persona.getIdentificacion()%>">
        <center><input type="submit" name="accion" class="boton" value="<%=titulo%>"></center>
</form>