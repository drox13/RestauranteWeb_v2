package edu.uptc.model;

import java.util.ArrayList;

public enum EformaPago {
	TARJETA_CREDITO("TJ"), TAREJETA_DEBITO("TD"), EFECTIVO("E");
	
	private String name;
	
	private EformaPago(String name) {
		this.name = name;
	}
	
	public static ArrayList<String> getArray() {
		ArrayList<String> aux = new ArrayList<>();
		for (int i = 0; i < EformaPago.values().length; i++) {
			aux.add(EformaPago.values()[i].toString());
		}
		return aux;
	}
	
	public String getName() {
		return name;
	}
}