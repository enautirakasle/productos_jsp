<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<c:forEach items="${productos}" var="producto">
	${producto.nombre} - 
	<a href="EditarProducto?id=${producto.id}">Editar</a> - 
	<a href="EliminarProducto?id=${producto.id}">Eliminar</a>
	<br>
</c:forEach>
<br>
<form action="CrearProducto" method="post">
	nombre: <input type="text" name="nombre"/><br>
	codigo: <input type="text" name="codigo"/><br>
	cantidad: <input type="text" name="cantidad"/><br>
	precio: <input type="text" name="precio"/><br>

	<input type="submit" value="Guardar" name="Guardar">
</form>
</div>
</div>
</div>

</body>
</html>