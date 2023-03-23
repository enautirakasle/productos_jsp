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

<form action="UpdateProducto" method="post">
	id: <input type="text" name="id" value="${producto.id}"/><br>
	nombre: <input type="text" name="nombre" value="${producto.nombre}"/><br>
	codigo: <input type="text" name="codigo" value="${producto.codigo}"/><br>
	cantidad: <input type="text" name="cantidad" value="${producto.cantidad}"/><br>
	precio: <input type="text" name="precio" value="${producto.precio}"/><br>
	
	<input type="submit" value="Guardar" name="Guardar">
</form>
<a href="Principal">Volver</a>
</div>
</div>
</div>

</body>
</html>