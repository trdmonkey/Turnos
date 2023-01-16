<%-- 
    Document   : validar
    Created on : 19/10/2021, 3:16:47 p. m.
    Author     : SENA
--%>

<%@page import="clasesGenericas.conectorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        conectorBD conector=new conectorBD();
        String mensaje="";  
        if(conector.conectar()) mensaje="Conectado a la Bd";
        else mensaje="No se conecto a la Bd";
%>
<%= mensaje %>
