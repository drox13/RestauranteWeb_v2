package edu.uptc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println(request.getParameter("el"));
	}

}
