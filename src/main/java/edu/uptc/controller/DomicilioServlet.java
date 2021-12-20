package edu.uptc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Client;

import edu.uptc.model.Cliente;
import edu.uptc.model.Plato;
import edu.uptc.model.SucursalManager;

/**
 * Servlet implementation class DomicilioServlet
 */
@WebServlet("/DomicilioServlet")
public class DomicilioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SucursalManager maSucursal = new SucursalManager();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DomicilioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		ArrayList<Plato> list = maSucursal.getListPlatos();
		ArrayList<String> comanda = new ArrayList<>();
		int cc = Integer.parseInt( request.getParameter("cc"));
		String fPago = request.getParameter("FPago");
		int idSucursal = Integer.parseInt(request.getParameter("ciudad"));
		int tPreparacion = 0;
		for (Plato plato : list) {
			//	idPlato -	cantidad 
			String cantidad = request.getParameter(String.valueOf(plato.getidPlato()));
			if(!cantidad.equals("")) {
				tPreparacion += 7 * Integer.parseInt(cantidad); 
				//tiempoPreparacion(tPreparacion, Integer.parseInt(cantidad));
				comanda.add(plato.getidPlato() + " - "+ cantidad);
				System.out.println( cc + " - "+ fPago+ " - "+ plato.getidPlato() + " - "+ request.getParameter(String.valueOf(plato.getidPlato())));
			}
		}
		maSucursal.registrarComanda(cc, idSucursal);
		
		int tEntrega= maSucursal.tEntrega(idSucursal, cc);
		
		PrintWriter out;
	    out = response.getWriter();
        response.setContentType("text/html");
		out.println("<html>");
		out.println("<body>");
		
		out.println("<h1> Informacion de Domicilio </h1>");
		out.println("<p> Su domicilio pronto estara lista infomacion </p>");
		out.println("<p> Tiempo promedio de entrega: " +  tEntrega +" Minutos</p>");
		out.println("<p> Tiempo promedio de preparacion: " +  tPreparacion +" Minutos</p>");
		out.println("</body></html>");
	}
}