<%-- 
    Document   : validar
    Created on : 19/10/2021, 3:16:47 p. m.
    Author     : SENA
--%>

<%@page import="clases.Persona"%>
<%@page import="clasesGenericas.conectorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String identificacion=request.getParameter("identificacion");
        String clave=request.getParameter("clave");
        Persona persona=Persona.validar(identificacion, clave);
        if(persona==null)response.sendRedirect("../index.jsp?error=1");
        else {
            //crear la sesión y sus variables para que la pueda recuperar principal y asi ingresar al sistema
            HttpSession sesion=request.getSession();
            sesion.setAttribute("identificacion", persona);    
            response.sendRedirect("../presentacion/principal.jsp?CONTENIDO=inicio.jsp");
        }
%>
