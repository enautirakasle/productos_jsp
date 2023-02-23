package controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Producto;
import modelo.ProductoModelo;

/**
 * Servlet implementation class UpdateProducto
 */
@WebServlet("/UpdateProducto")
public class UpdateProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProducto() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre =request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		
		Producto producto = new Producto();
		producto.setId(id);
		producto.setNombre(nombre);
		producto.setCodigo(codigo);
		producto.setCantidad(cantidad);
		producto.setPrecio(precio);
		
		ProductoModelo pm = new ProductoModelo();
		pm.conectar();
		pm.modificar(producto);
		pm.cerrar();
		
//		response.sendRedirect(request.getContextPath() + "/alimentos");		
		response.sendRedirect(request.getContextPath() + "/Principal");
		
	}

}
