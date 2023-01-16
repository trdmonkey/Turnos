<%-- 
    Document   : principal
    Created on : 19 oct 2021, 19:47:14
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TURN SALUD</title>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
    </head>
    <body>
        <div id="sidebar"> 
         
        <ul>
            <li><img src="css/logo5.jpg" alt="Logo" class="logo"> </li>
        
            <li class="titulo"> TURN HEALT </li>
            <li> <a href="principal.jsp?CONTENIDO=configuracion/cargos.jsp">CARGOS</a> </li>
            <li> <a href="principal.jsp?CONTENIDO=configuracion/personal.jsp">PERSONAL</a> </li>
            <li> <a href="principal.jsp?CONTENIDO=configuracion/paciente.jsp">CATEGORIAS DE PACIENTE</a> </li>
            <li> <a href="principal.jsp?CONTENIDO=configuracion/turnosLista.jsp">REPORTES DE TURNOS</a> </li>
            <li> <a href="../index.jsp">SALIR</a> </li>
        </ul>
        
            
        </div>
        <div id="contenido"> <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" /> </div>
    </body>
</html>

