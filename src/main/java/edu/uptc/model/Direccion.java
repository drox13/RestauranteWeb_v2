package edu.uptc.model;

public class Direccion {
	private int calle;
	private int carrera;
	
	public Direccion(int calle, int carrera) {
		this.calle = calle;
		this.carrera = carrera;
	}
	
	@Override
	public String toString() {
		return "calle: " + calle  + " carrera: " + carrera;
	}
}