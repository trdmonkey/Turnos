<%-- 
    Document   : personalActualizar
    Created on : 19 oct 2021, 22:23:28
    Author     : cristian araujo
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    out.print(request.getParameter("accion"));
    Persona persona=new Persona();
    
    switch(request.getParameter("accion")){
        case "Adicionar":
            
            persona.setIdentificacion(request.getParameter("identificacion"));
            persona.setNombreCompleto(request.getParameter("nombre"));
            persona.setIdCargo(request.getParameter("cargo"));
            persona.setClave(request.getParameter("clave"));
            persona.guardar();
            break;
            
        case "Modificar"://Modificar 
            persona.setIdentificacion(request.getParameter("identificacion"));
            persona.setNombreCompleto(request.getParameter("nombre"));
            persona.setIdCargo(request.getParameter("cargo"));
            persona.setClave(request.getParameter("clave"));
            persona.modificar("identificacionAnterior");
            break;
            
        case "Eliminar":
            persona.setIdentificacion(request.getParameter("identificacion"));
            persona.eliminar();
            break;
      
    }
%> 
<script type="text/javascript"> location="principal.jsp?CONTENIDO=configuracion/personal.jsp"; </script>  

