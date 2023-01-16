<%-- 
    Document   : cargosFormulario
    Created on : 19 oct 2021, 21:02:01
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
    
    String titulo="Adicionar";
    Cargo cargo=null;
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        cargo=new Cargo(request.getParameter("id"));
    }else{
        cargo=new Cargo();
    }
%>
<h3 class="banner"> <%= titulo.toUpperCase() %> ESTE CARGO </h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=configuracion/cargosActualizar.jsp">
    <table>
        <tr><th>Nombre</th><td> <input type="text" name="nombre" value="<%= cargo.getNombre() %>">  </td></tr>
        <tr><th>Descripcion</th><td> <input type="text" name="descripcion" size="30" value="<%= cargo.getDescripcion() %>"> </td></tr>
    </table>
    <p>
        <input type="hidden" name="id" value="<%=cargo.getId()%>"/>
    <center><input type="submit" name="accion" class="boton" value="<%= titulo %>"/></center>
</form>