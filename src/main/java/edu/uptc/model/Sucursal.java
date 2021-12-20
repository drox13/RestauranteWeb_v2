package edu.uptc.model;

import java.util.ArrayList;

public class Sucursal {
	private int idSucursal;
	private String ciudad;
	private Direccion direccion;
	private ArrayList<Reserva> lisReservas;
	private ArrayList<Mesa> listMesas;
	
	public Sucursal(int idSucursal, String ciudad, Direccion direccion) {
		this.idSucursal = idSucursal;
		this.ciudad = ciudad;
		this.direccion = direccion;
		this.lisReservas = lisReservas;
		this.listMesas = listMesas;
	}
	
	public String getCiudad() {
		return ciudad;
	}
	
	public Direccion getDireccion() {
		return direccion;
	}
	
	public int getIdSucursal() {
		return idSucursal;
	}
	
	public ArrayList<Mesa> getListMesas() {
		return listMesas;
	}
}