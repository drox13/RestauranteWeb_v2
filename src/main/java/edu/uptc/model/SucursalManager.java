package edu.uptc.model;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import edu.uptc.dao.DAO;

public class SucursalManager {
	DAO dao = new DAO();
	
	public SucursalManager() {}
	
	public ArrayList<Sucursal> getListSucursales() {
		try {
			return dao.verSucursales();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String reservar(int id_cliente, int idSucursal, String fecha, String hora, EformaPago fomaPago, int nPersonas) {
		String rta = null;
		try {
			boolean diaDiferente = isDiaDiferenteActual(fecha);
			if(diaDiferente) {
				rta = dao.reservar(id_cliente, idSucursal, fecha, hora, fomaPago, nPersonas);				
			}else {
				rta = "No puede hacer reservar para el mismo dia (HOY)";
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  rta;
	}


	private boolean isDiaDiferenteActual(String fecha) {
		LocalDate fechaAct = LocalDate.now();
		String hoy = fechaAct.getYear() + "-" + fechaAct.getMonthValue()  + "-" + fechaAct.getDayOfMonth();
		if(hoy.equals(fecha)) {
			return false;
		}
		return true;
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
	
	public ArrayList<Plato> getListPlatos() {
		try {
			return dao.verPlatos();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void registrarComanda(int cc, int idSucursal) {
		LocalDate date = LocalDate.now();
		try {
			dao.registrarComanda(cc, idSucursal, date.toString());
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int tEntrega(int idSucursal, int cc) {
		try {
			Direccion dirCli = dao.buscarCliente(cc).getDirecion();
			Direccion dirSu = dao.buscarDireccionSucursal(idSucursal);
			int resCalle = Math.abs(dirSu.getCalle() - dirCli.getCalle());
			int resCarreara = Math.abs(dirSu.getCarrera() - dirCli.getCarrera());
			return  (resCalle + resCarreara) * 5;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}