package controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ProductoModelo;
import modelo.SeccionModelo;
import modelo.Supermercado;
import modelo.SupermercadoModelo;

/**
 * Servlet implementation class EditarProducto
 */
@WebServlet("/EditarProducto")
public class EditarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recibir datos
		int id = Integer.parseInt(request.getParameter("id"));
		
		//conseguir datos con la id
		ProductoModelo pm = new ProductoModelo();
		pm.conectar();
		//preparar datos para enviar a la vista
		request.setAttribute("producto", pm.get(id));
		pm.cerrar();
		
		SeccionModelo sm = new SeccionModelo();
		sm.conectar();
		request.setAttribute("secciones", sm.secciones());
		sm.cerrar();
		
		SupermercadoModelo supm = new SupermercadoModelo();
		supm.conectar();
		request.setAttribute("supermercados", supm.supermercados());
		supm.cerrar();
		
		//abir vista
		request.getRequestDispatcher("formEdicion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
