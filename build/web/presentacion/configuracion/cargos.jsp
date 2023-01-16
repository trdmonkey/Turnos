<%-- 
    Document   : cargos
    Created on : 19 oct 2021, 21:01:40
    Author     : cristian araujo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.Cargo"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    
    
    String lista="";
    ArrayList <Cargo> datos=Cargo.getListaEnObjetos();
    for (int i = 0; i < datos.size(); i++) {
        Cargo cargo = datos.get(i);
        lista+="<tr>";
        lista+="<td>"+cargo.getId()+"</td>";
        lista+="<td>"+cargo.getNombre()+"</td>";
        lista+="<td>"+cargo.getDescripcion()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=configuracion/cargosFormulario.jsp&id="+ cargo.getId() +"' title='Modificar'> <img  src='css/imagenes/modificar.png' /> </a>";
        lista+="<label onClick='Eliminar( "+cargo.getId()+" );' title='Eliminar'> <img  src='css/imagenes/eliminarPersonal.png' /> </label>";
        lista+="</td>";
        lista+="</tr>";
            
        }

%>
<h3 class="banner">CARGOS PERSONAL</h3>
<table border="0">
    <tr><th>Nº</th><th>Nombre</th><th>Descripcion</th><th> <a href="principal.jsp?CONTENIDO=configuracion/cargosFormulario.jsp" title="Adicionar Cargo"> <img class="adicionar" src="css/imagenes/adicionPersonal.png" /> </a></th></tr>
    <%= lista %>
</table>
<script type="text/javascript">
    function Eliminar(id){
        var respuesta=confirm("Realmente desea eliminar este registro")
        if(respuesta) location='principal.jsp?CONTENIDO=configuracion/cargosActualizar.jsp&accion=Eliminar&id='+id;
    }
</script>