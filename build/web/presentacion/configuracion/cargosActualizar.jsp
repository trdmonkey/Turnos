<%-- 
    Document   : cargosActualizar
    Created on : 19 oct 2021, 21:02:18
    Author     : cristian araujo
--%>

<%@page import="clases.Cargo"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    //out.print(request.getParameter("accion"));
    //System.out.println(request.getParameter("accion"));
    
    Cargo cargo=new Cargo();
    switch(request.getParameter("accion")){
            
        case "Adicionar":
            cargo.setNombre(request.getParameter("nombre"));
            cargo.setDescripcion(request.getParameter("descripcion"));
            cargo.guardar();
            break;
            
        case "Modificar":
            cargo.setId(request.getParameter("id"));
            cargo.setNombre(request.getParameter("nombre"));
            cargo.setDescripcion(request.getParameter("descripcion"));
            cargo.modificar();
            break;
            
        case "Eliminar":
            cargo.setId(request.getParameter("id"));
            cargo.eliminar();
            break;
    }
%>
<script type="text/javascript"> location="principal.jsp?CONTENIDO=configuracion/cargos.jsp" </script>

