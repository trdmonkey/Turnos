<%-- 
    Document   : index
    Created on : 19/10/2021, 2:15:17 p. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String mensaje="";
if(request.getParameter("error")!=null) mensaje="USUARIO O CONTRASEÑO NO VALIDA";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TURN HEALT</title>
        <link rel="stylesheet" type="text/css" href="presentacion/css/login.css">
    </head>
    <body>
        <div class="login-box">
            <img class="avatar" src="presentacion/css/logo5.jpg" alt="logo">
            <h2>TURN HEALT</h2>
            <h1>LOGIN</h1>
            <form name="formulario" action="control/validar.jsp" method="post">
            
                <!-- USERNAME -->
                <label for="identificacion">Username</label>
                <input type="text" name="identificacion" placeholder="Enter Username">
                <!-- PASSWORD -->
                <label for="password">Password</label>
                <input type="password" name="clave" placeholder="Enter Password">
            
            <p><font color="red"> <%=mensaje%> </font></p>
            <input type="submit" value="Log In">
            </form>
        </div>
    </body>
</html>