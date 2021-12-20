package edu.uptc.model;

public class Cliente {
	private int cc;
	private String name;
	private String apellito;
	//private EformaPago formaDePago;
	private Direccion direcion;

	public Cliente() {
	}
	
	public Cliente(int cc, String name, String apellito, Direccion direcion) {
		this.cc = cc;
		this.name = name;
		this.apellito = apellito;
		//this.formaDePago = formaDePago;
		this.direcion = direcion;
	}
	
	public int getCc() {
		return cc;
	}
}