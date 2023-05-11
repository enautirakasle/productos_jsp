<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="modelo.Producto" %>
    <%@ page import="modelo.Seccion" %>
    <%@ page import="modelo.Supermercado" %>
    
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
ArrayList<Seccion> secciones = (ArrayList<Seccion>)request.getAttribute("secciones");
ArrayList<Supermercado> supermercados = (ArrayList<Supermercado>)request.getAttribute("supermercados");
/* out.println(secciones);
 */
%>
<form action="UpdateProducto" method="post">
	id: <input type="text" name="id" value="<%	out.println(producto.getId());%>"/><br>
	nombre: <input type="text" name="nombre" value="<%	out.println(producto.getNombre());%>"/><br>
	codigo: <input type="text" name="codigo" value="<%	out.println(producto.getCodigo());%>"/><br>
	cantidad: <input type="text" name="cantidad" value="<%	out.println(producto.getCantidad());%>"/><br>
	precio: <input type="text" name="precio" value="<%	out.println(producto.getPrecio());%>"/><br>
		seccion:<select name="seccion">
	<option value="0"></option>
	<%
	for(Seccion seccion : secciones){ 
		 if(seccion.getId() == producto.getSeccion().getId()){%>
			<option value="<%out.print(seccion.getId());%>" selected><%out.print(seccion.getNombre());%></option>
		<% }else{%>
			<option value="<%out.print(seccion.getId());%>"><%out.print(seccion.getNombre());%></option>
		<%}//else
		
	}//for
	%>
	</select>
	
	<br><br>
	
	<%
	for(int i = 0; i < supermercados.size(); i++){
		for(int j = 0; j < supermercados.get(i))
		%>
		<input type="checkbox" name="supermercados" value="<%out.print(supermercados.get(i).getId());%>"> <%out.println(supermercados.get(i).getNombre()); %>
	<%	
	}
	%>
		<br>
	
	<input type="submit" value="Guardar" name="Guardar">
</form>
<a href="Principal">Volver</a>
</div>
</div>
</div>

</body>
</html>