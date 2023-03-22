<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="modelo.Producto" %>
    <%@ page import="modelo.Seccion" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Principal</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <div class="row">
      <div class="col">
<%
ArrayList<Producto> productos = (ArrayList<Producto>)request.getAttribute("productos");
ArrayList<Seccion> secciones = (ArrayList<Seccion>)request.getAttribute("secciones");

for(int i = 0; i < productos.size(); i++ ){
	out.println(productos.get(i).getNombre() + " - ");
	%>
	<a href="${pageContext.request.contextPath}/EditarProducto?id=<% out.println(productos.get(i).getId()); %>">Editar</a> - 
	<a href="${pageContext.request.contextPath}/EliminarProducto?id=<% out.println(productos.get(i).getId()); %>">Eliminar</a>
	<br>
	<%
}
%>
<br>
<form action="${pageContext.request.contextPath}/CrearProducto" method="post">
	nombre: <input type="text" name="nombre"/><br>
	codigo: <input type="text" name="codigo"/><br>
	cantidad: <input type="text" name="cantidad"/><br>
	precio: <input type="text" name="precio"/><br>
	
	seccion: <select name="seccion">
	<option value="0"></option>
	<%
	for(int i=0; i < secciones.size(); i++){
	%>
		<option value="<%out.print(secciones.get(i).getId());%>"><%out.print(secciones.get(i).getNombre());%></option>
	<%
	}
	%>
	</select>
		
	<input type="submit" value="Guardar" name="Guardar">
</form>
</div>
</div>
</div>

</body>
</html>