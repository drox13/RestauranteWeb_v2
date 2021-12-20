package edu.uptc.model;

import java.sql.SQLException;
import java.util.ArrayList;

import edu.uptc.dao.DAO;

public class SucursalManager {
	DAO dao = new DAO();
	
	ArrayList<Sucursal> listSucursales = new ArrayList<Sucursal>();
	ArrayList<Mesa> listMesas = new ArrayList<Mesa>();
	ArrayList<Cliente> clientes = new ArrayList<Cliente>();

	public SucursalManager() {
		clientes.add(new Cliente(123, "Dario", "Baron", new Direccion(50, 22)));
		
		listMesas.add(new Mesa(1, 23));
		listMesas.add(new Mesa(5, 23));
		
		/*listSucursales.add(new Sucursal(1,"Tunja", new Direccion(79, 20), new ArrayList<Reserva>(), listMesas));
		listSucursales.add(new Sucursal(2,"Sogamoso", new Direccion(21, 12), new ArrayList<Reserva>(), listMesas));
		listSucursales.add(new Sucursal(3,"Duitama", new Direccion(11, 11), new ArrayList<Reserva>(), listMesas));
		listSucursales.add(new Sucursal(4,"Tunja", new Direccion(21, 50), new ArrayList<Reserva>(), listMesas));*/

	}
	
	
	public ArrayList<Sucursal> getListSucursales() {
		try {
			return dao.verSucursales();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return listSucursales;
	}
	
	public void reservar(int id_cliente, int idSucursal, String fecha, String hora, EformaPago fomaPago, int nPersonas) {
		try {
			dao.reservar(id_cliente, idSucursal, fecha, hora, fomaPago, nPersonas);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public Cliente buscarCliente(int cc) {
		try {
			return dao.buscarCliente(cc);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}