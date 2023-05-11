package controladores;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Producto;
import modelo.ProductoModelo;
import modelo.Seccion;

/**
 * Servlet implementation class CrearProducto
 */
@WebServlet("/CrearProducto")
public class CrearProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//recoger parametros
		String nombre =request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		int id_seccion = Integer.parseInt(request.getParameter("seccion"));
		String[] idsStringSupermercados = request.getParameterValues("supermercados");
		int[] idsSupermercados = Arrays.stream(idsStringSupermercados)
                .mapToInt(Integer::parseInt)
                .toArray();
		
		//crear el objeto
		Producto producto = new Producto();
		producto.setNombre(nombre);
		producto.setCodigo(codigo);
		producto.setCantidad(cantidad);
		producto.setPrecio(precio);
		Seccion seccion = new Seccion();
		seccion.setId(id_seccion);
		producto.setSeccion(seccion);
		
		//insert en la BBDD
		ProductoModelo pm = new ProductoModelo();
		pm.conectar();
		pm.insertar(producto);
		pm.productoSupermercados(pm.buscar(codigo).getId(), idsSupermercados);
		pm.cerrar();
		
		//abrir otro controlador
//		response.sendRedirect(request.getContextPath() + "/alimentos");		
		response.sendRedirect(request.getContextPath() + "/Principal");
	}

}
