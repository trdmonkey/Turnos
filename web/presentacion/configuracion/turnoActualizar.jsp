<%-- 
    Document   : turnoActualizar
    Created on : 20/10/2021, 3:10:43 p. m.
    Author     : SENA
--%>

<%@page import="clases.Turno"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    String filtro="identificacion='"+IDENTIFICACION.getIdentificacion()+"'";
    Persona persona=Persona.getListaEnObjetos(filtro).get(0);
    
    
    Turno turno=new Turno();
    switch(request.getParameter("accion")){
        case "Adicionar":
            turno.setIdentificacionPersona(request.getParameter("identificacionPersona"));
            turno.setDia(request.getParameter("dia"));
            turno.setFecha(request.getParameter("fecha"));
            turno.setHoraInicio(request.getParameter("horaInicio"));
            turno.setHoraFinal(request.getParameter("horaFinal"));
            turno.setIdcategoriaPaciente(request.getParameter("categoriaPaciente"));
            turno.setCantidadPaciente(request.getParameter("cantidadPaciente"));
            turno.guardar();
            break;
            
        case "Modificar":
            turno.setId(request.getParameter("id"));
            turno.setDia(request.getParameter("dia"));
            turno.setFecha(request.getParameter("fecha"));
            turno.setHoraInicio(request.getParameter("horaInicio"));
            turno.setHoraFinal(request.getParameter("horaFinal"));
            turno.setIdcategoriaPaciente(request.getParameter("categoriaPaciente"));
            turno.setCantidadPaciente(request.getParameter("cantidadPaciente"));
            turno.modificar();
            break;
        
        case "Eliminar":
            turno.setId(request.getParameter("id"));
            turno.eliminar();
            
    }
%>
<script type="text/javascript"> location="principal.jsp?CONTENIDO=configuracion/turno.jsp&identificacion=<%= persona.getIdentificacion() %>" </script>
<input type="hidden" name="identificacion" value="<%= request.getParameter("identificacion") %>">