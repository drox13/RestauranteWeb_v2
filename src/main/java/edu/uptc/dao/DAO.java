package edu.uptc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import edu.uptc.model.Cliente;
import edu.uptc.model.Direccion;
import edu.uptc.model.EformaPago;
import edu.uptc.model.Plato;
import edu.uptc.model.Sucursal;

public class DAO {
	private String  maquina     = "localhost";
	private String  usuario     = "root";
	private String  clave       = "123456";
	private String  db       = "empleado";
	private int puerto          = 3306;

	public String reservar(int id_cliente, int idSucursal, String fecha, String hora, EformaPago eformaPago, int nPersonas) throws ClassNotFoundException, SQLException {
		String rta = null;
		if(!validaSoloUnaReserva(id_cliente, fecha) && verificarMesasAlcancen(nPersonas, hora)) {
			Statement stmt= null;
			String query = "insert into reserva (id_cliente, id_sucursal, fecha, HORA, FORMA_PAGO)"
					+ "values('"+id_cliente+"','"+idSucursal+"','"+fecha+"','"+hora + "','"+ eformaPago.toString() +"');";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/"+db,this.usuario,this.clave);
				stmt = con.createStatement();
				stmt.executeUpdate(query);
				con.close();
				String mesaAsignadas = verMesasLibres(nPersonas, hora);
				rta = "Reserva Exitosa info: cliente: " + id_cliente + " Sucursal: " + idSucursal + " Fecha: " + fecha +" hora:" + hora + "mesas Asignadas :" + mesaAsignadas ; 
			}catch(SQLException sqlex){throw sqlex;}
		}else {
			rta = "el cliente ya tiene una reserva para esa fecha :" + fecha + "(solo una por dia)";
		}
		return rta;
	}

	public Cliente buscarCliente(int id_cliente) throws ClassNotFoundException, SQLException {
		Statement stmt= null;
		String query = "select * from CLIENTE c, DIRECCION d where c.id_direccion = d.id_direccion And id_cliente="+id_cliente+";";

		Cliente cliente = null;	
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/"+db,this.usuario,this.clave);
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				cliente = new Cliente(rs.getInt("id_cliente"), rs.getString("nombre"), rs.getString("apellido"), new Direccion(rs.getInt("calle"), rs.getInt("carrera")));
			}
			con.close();
		}catch(SQLException sqlex){throw sqlex;}
		return cliente;
	}

	public ArrayList<Sucursal> verSucursales() throws ClassNotFoundException, SQLException {
		ArrayList<Sucursal> sucursalList = new ArrayList<Sucursal>();

		Statement stmt= null;
		String query = "select * from SUCURSAL s, DIRECCION d where s.id_direccion = d.id_direccion;";

		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()) {
			sucursalList.add(new Sucursal(rs.getInt("id_sucursal"), rs.getString("nombre"), new Direccion(rs.getInt("calle"), rs.getInt("carrera"))));
		}
		con.close();
		return sucursalList;
	}

	private String verMesasLibres(int nPersonas, String hora ) throws ClassNotFoundException, SQLException {
		Statement stmt = null;
		String query = "SELECT * FROM Mesa m WHERE NOT EXISTS (SELECT NULL FROM MESA_REGISTRO r WHERE r.id_mesa = m.id_mesa and r.hora ='"+ hora +"');";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		String mesasAsignadas = " ";
		while (rs.next() && nPersonas > 0) {
				asignarMesa(rs.getInt("id_mesa"), hora);
				mesasAsignadas += rs.getInt("id_mesa") + ", ";
				nPersonas = nPersonas - 4;
		}
		con.close();
		return mesasAsignadas;
	}
	private boolean verificarMesasAlcancen(int nPersonas, String hora ) throws ClassNotFoundException, SQLException {
		Statement stmt = null;
		String query = "SELECT * FROM Mesa m WHERE NOT EXISTS (SELECT NULL FROM MESA_REGISTRO r WHERE r.id_mesa = m.id_mesa and r.hora ='"+ hora +"');";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		System.out.println("sada");
		
		while (rs.next() && nPersonas > 0) {
				nPersonas = nPersonas - 4;
		}
		if(nPersonas <= 0) {
			return true;
		}
		con.close();
		return false;
	}
	private void asignarMesa(int idMesa, String hora) throws ClassNotFoundException, SQLException {
		Statement stmt = null;
		int ultRegistro = optenerIdReserva();
		String query = "INSERT INTO mesa_registro(ID_MESA, ID_RESERVA, HORA) VALUES ( "+idMesa+", "+ ultRegistro + ",  '"+ hora +"');";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		stmt.executeUpdate(query);
		System.out.println("sada");
		
		con.close();
	}
	
	
	private int optenerIdReserva() throws ClassNotFoundException, SQLException {
		Statement stmt = null;
		String query = "select max(id_reserva) ultRegistro from reserva;";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		System.out.println("sada");
		int idReserva = 0;
		while (rs.next()) {
				idReserva = rs.getInt("ultRegistro");
		}
		con.close();
		return idReserva;
	}
	
	public boolean validaSoloUnaReserva(int idCliente, String fecha) throws ClassNotFoundException, SQLException {
		Statement stmt= null;

		String query = "select ID_CLIENTE, FECHA from reserva"
				+ "	where ID_cliente = "+ idCliente + ";";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/"+db,this.usuario,this.clave);
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				if(rs.getString("Fecha").equals(fecha)) {
					return true;					
				}
			}
			con.close();
			return false;
		}catch(SQLException sqlex){throw sqlex;}
	}
	
	public ArrayList<Plato> verPlatos() throws ClassNotFoundException, SQLException{
		ArrayList<Plato> platos = new ArrayList<Plato>();
		Statement stmt= null;
		String query = "select * from plato;";

		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con = DriverManager.getConnection("jdbc:mysql://"+this.maquina+":"+this.puerto+"/empleado",this.usuario,this.clave);
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()) {
			platos.add(new Plato(rs.getInt("ID_PLATO"), rs.getString("NOMBRE"), rs.getString("RECETA"), rs.getInt("VALOR_UNIDA")));
		}
		con.close();
		return platos;
	}
}