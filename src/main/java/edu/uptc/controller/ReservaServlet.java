package edu.uptc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Client.ClientProperty;

import edu.uptc.model.Cliente;
import edu.uptc.model.EformaPago;
import edu.uptc.model.Mesa;
import edu.uptc.model.Reserva;
import edu.uptc.model.SucursalManager;

/**
 * Servlet implementation class ReservaServlet
 */
@WebServlet("/ReservaServlet")
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SucursalManager maSucursal = new SucursalManager();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		PrintWriter out;
	    out = response.getWriter();
        response.setContentType("text/html");
		out.println("<html>");
		out.println("<body>");
		
		String cc = String.valueOf(request.getParameter("cc"));	
		String idSucursal = String.valueOf(request.getParameter("ciudad"));
		String fecha = request.getParameter("fecha");
		String hora = request.getParameter("hora");
		String nPersonas = String.valueOf(request.getParameter("n_personas"));	
		System.out.println(cc + idSucursal + fecha + hora + nPersonas);
		
		Cliente cliente = maSucursal.buscarCliente(Integer.parseInt(cc));
		
		if(cliente != null) {
			//id_cliente, idSucursal, id_Mesa, String fecha, String hora, EformaPago eformaPago
			maSucursal.reservar(cliente.getCc(), Integer.parseInt(idSucursal), fecha, hora, EformaPago.EFECTIVO, Integer.parseInt(nPersonas) );
			out.println("<h1> Informacion de Reserva </h1>");
			out.println("<h2> Reserva Exitosa </h2>");
			out.println("<h3>"+ cc + idSucursal + fecha + hora + nPersonas +"</h3>");
		}else {
			
			//out.println("<head><style>\"/css/empStyle.css\"></style> <title>Respuesta adicionar empleado</title></head>");
			out.println("<h1> Informacion de Reserva </h1>");
			out.println("<h2> El cliente no se encuntra registrado </h2>");
			//out.println("<a href=\"index.jsp\"> Volver a la página inicial!</h2>");
		}
		out.println("</body></html>");
	}
}