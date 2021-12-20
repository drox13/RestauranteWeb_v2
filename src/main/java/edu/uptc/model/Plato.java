package edu.uptc.model;

public class Plato {
	private int idPlato;
	private String nombre;
	private String receta;
	private int valor;

	public Plato() {}
	
	public Plato(int plato, String nombre, String receta, int valor) {
		this.idPlato = plato;
		this.nombre = nombre;
		this.receta = receta;
		this.valor = valor;
	}

	public int getidPlato() {
		return idPlato;
	}

	public String getNombre() {
		return nombre;
	}

	public String getReceta() {
		return receta;
	}

	public int getValor() {
		return valor;
	}
	
	@Override
	public String toString() {
		return nombre + " - " + receta + " Precio: " + valor;			
	}
}