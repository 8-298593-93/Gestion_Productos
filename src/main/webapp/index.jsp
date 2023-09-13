<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Producto"%>
<% 
    if(session.getAttribute("listaproducto")==null){
        ArrayList<Producto>lisaux=new ArrayList<Producto>();
        session.setAttribute("listaproducto", lisaux);
    }
    ArrayList<Producto>lista=(ArrayList<Producto>)session.getAttribute("listaproducto");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            th{
                color: #FF5733;
            }
            .nuevo{
                color:#FEFFFF;
                padding-top:15px;
                padding-bottom:15px;
                padding-left:40px;
                padding-right:40px;
                background-color:#2ECC71;
                border-color: #2ECC71;
                border-width: 3px;
                border-style: solid;
                border-radius:10px;
                text-decoration: none;
                padding: 10px;
                font-size: 20px; 
            }
            .nombre{
                color:black;
                font-size: 20px;
            }
            .cab{
                border: 1px solid red;
                width: 450px;
                height: 130px;
                text-align: left;
                padding-left: 50px;
                border-radius: 5px;
                
            }
        </style>
    </head>
    <body>
        <center>
            <div class="cab">
                <h3>SEGUNDO PARCIAL TEM-742</h3>
                <p class="nombre"> <b>Nombre:</b> Germán Miranda Condori <br>
                 <b>Carnet:</b> 8298593 L.P.</p>
            </div>
       <h1>Gestor de Productos</h1>
       
        <a class="nuevo" href="MainServlet?op=nuevo">Nuevo registro</a>
        <br> <br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripción</th>
                <th>Cantida</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th colspan="2">Acciones</th>
                
            </tr>
            <%
                if(lista !=null){
                    for(Producto item: lista){ 
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getDescripcion()%></td>
                <td><%=item.getCantidad()%></td>
                <td><%=item.getPrecio()%></td>
                <td><%=item.getCategoria()%></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%=item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%  
                    }
                }
            %>
        </table>
        
        </center>
    </body>
</html>
