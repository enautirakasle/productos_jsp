<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Producto" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Editar</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div class="container">
  <div class="row">
      <div class="col">
<%
Producto producto = (Producto)request.getAttribute("producto");
%>
<form action="${pageContext.request.contextPath}/UpdateProducto" method="post">
	id: <input type="text" name="id" value="<%	out.println(producto.getId());%>"/><br>
	nombre: <input type="text" name="nombre" value="<%	out.println(producto.getNombre());%>"/><br>
	codigo: <input type="text" name="codigo" value="<%	out.println(producto.getCodigo());%>"/><br>
	cantidad: <input type="text" name="cantidad" value="<%	out.println(producto.getCantidad());%>"/><br>
	precio: <input type="text" name="precio" value="<%	out.println(producto.getPrecio());%>"/><br>
	
	<input type="submit" value="Guardar" name="Guardar">
</form>
<a href="${pageContext.request.contextPath}/Principal">Volver</a>
</div>
</div>
</div>

</body>
</html>