package edu.uptc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String cc = String.valueOf(request.getParameter("cc"));
		String fPago = request.getParameter("FPago");
		String idSucursal = String.valueOf(request.getParameter("ciudad"));
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
		System.out.println(tPreparacion);

		maSucursal.registrarComanda(cc, idSucursal);
	}
}
