package controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ProductoModelo;
import modelo.SeccionModelo;
import modelo.SupermercadoModelo;

/**
 * Servlet implementation class Principal
 */
@WebServlet("/Principal")
public class Principal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Principal() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//conseguir datos de la BBDD y prepararlos para enviar a la vista
		ProductoModelo pm = new ProductoModelo();
		pm.conectar();
		request.setAttribute("productos", pm.productos());
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
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
