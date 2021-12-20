package edu.uptc.model;

public class Reserva {
	private Cliente cliente;
	private Sucursal sucursal;
	private Mesa mesa;
	private String fecha;
	private String hora;
	private EformaPago formaPago;
	
	public Reserva() {}

	public Reserva(Cliente cliente, Sucursal sucursal, Mesa mesa, String fecha, String hora, EformaPago fomaPago) {
		this.cliente = cliente;
		this.sucursal = sucursal;
		this.mesa = mesa;
		this.fecha = fecha;
		this.hora = hora;
		this.formaPago = fomaPago;
	}
}