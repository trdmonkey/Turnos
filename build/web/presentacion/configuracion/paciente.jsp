<%-- 
    Document   : paciente
    Created on : 21/10/2021, 9:30:31 a. m.
    Author     : SENA
--%>

<%@page import="clases.CategoriaPaciente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion=request.getSession();
    Persona IDENTIFICACION=null;
    if(sesion.getAttribute("identificacion")==null) response.sendRedirect("../index.jsp?error=2");// 2=acceso no valido
    else IDENTIFICACION=(Persona) sesion.getAttribute("identificacion");
    
    
    String lista="";
    ArrayList <CategoriaPaciente> datos=CategoriaPaciente.getListaEnObjetos();
    for (int i = 0; i < datos.size(); i++) {
        CategoriaPaciente categoriaPaciente = datos.get(i);
        lista+="<tr>";
        lista+="<td>"+categoriaPaciente.getId()+"</td>";
        lista+="<td>"+categoriaPaciente.getNommbre()+"</td>";
        lista+="<td>"+categoriaPaciente.getDescripcion()+"</td>";
        lista+="</tr>";
            
        }
        //Tpos de pacientes Infante,general,Con administracion de medicamentos, ventilado

%>
<h3 class="banner">LISTADO DE LA CATEGORIAS DE PACIENTES </h3>
<table border="0">
    <tr><th>Nº</th><th>Categoria</th><th>Descripcion</th></tr>
    <%= lista %>
</table>
