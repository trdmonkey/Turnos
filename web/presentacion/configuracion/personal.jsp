<%-- 
    Document   : personal
    Created on : 19 oct 2021, 21:55:34
    Author     : cristian araujo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    Persona persona=new Persona();
    
    //String filtro="identificacion='"+USUARIO.getIdentificacion()+"'";
    
    String lista="";
    ArrayList <Persona> datos = Persona.getListaEnObjetos("identificacionPersona="+persona.getIdentificacion());
    for (int i = 0; i < datos.size(); i++) {
    
            persona = datos.get(i);
            
            lista+="<tr>";
            lista+="<td>"+persona.getIdentificacion()+"</td>";
            lista+="<td>"+persona.getNombreCompleto()+"</td>";
            lista+="<td>"+persona.getCargo() +"</td>";
            lista+="<td>";
            lista+="<a href='principal.jsp?CONTENIDO=configuracion/personalFormulario.jsp&identificacionPersona="+persona.getIdentificacion()+"' title='Modificar'> <img  src='css/imagenes/modificar.png' /> </a>";
            lista+="<a href='principal.jsp?CONTENIDO=configuracion/turno.jsp&identificacion="+persona.getIdentificacion()+"' title='Turnos'> <img  src='css/imagenes/adicionTurno.png' /> </a>";
            lista+="<label onClick='Eliminar("+persona.getIdentificacion()+")' title='Eliminar'> <img  src='css/imagenes/eliminarPersonal.png' /> </label>";
            lista+="</td>";
            lista+="</tr>";
        }

%>
<h3 class="banner">PROFESIONALES DE LA SALUD</h3> 
<p>    
<table border="0"">
    <tr><th>Identificacion</th><th>Nombres Completo</th><th>Cargo</th><th> <a href="principal.jsp?CONTENIDO=configuracion/personalFormulario.jsp" title="Adicionar Personal"> <img  src='css/imagenes/adicionPersonal.png' /> </a></th>
        </tr>
    <%=lista%>
</table>
<script type="text/javascript">
    function Eliminar(id){
        var respuesta=confirm("Realmente desea eliminar este registro");
        if(respuesta) location='principal.jsp?CONTENIDO=configuracion/personalActualizar.jsp&accion=Eliminar&identificacion='+id;
    }
</script>

