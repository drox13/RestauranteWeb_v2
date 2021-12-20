<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import="edu.uptc.model.Plato"%>
<%@ page import="edu.uptc.model.Sucursal"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Domicilios</title>
</head>
<body>
	<c:set var="mSucrsal" value="${SucursalManager()}" />
	<c:set var="listPlatos" value="${mSucrsal.getListPlatos()}" />

	<form class="row g-3" action="DomicilioServlet" method="post">

		<label> Numero de cedula</label> <input type="number" name="cc">

		<select id="select" name="FPago" class="form-select"
			aria-label="Default select example">
			<option selected>Seleccione la Forma de Pago Sucursal</option>
			<option value="Tarjeta credito">Tarjeta Credito</option>
			<option value="Tarjeta Debito">Tarjeta Debito</option>
			<option value="Efectivo">Efectivo</option>
		</select>
		
		<c:set var="sManager" value="${SucursalManager()}"/>
		<c:set var="listSucursales" value="${sManager.getListSucursales()}"/>
		
		<select id="select" name="ciudad" class="form-select"  aria-label="Default select example">
			<option selected>Seleccione la Sucursal</option>
			<c:forEach items="${listSucursales}" var="i">
				<option value="<c:out value="${i.idSucursal}"/>" >
				 	<c:out value="${i.idSucursal}"/> - <c:out value="${i.ciudad}"/> - <c:out value="${i.direccion}"></c:out> 
				 </option>
			</c:forEach>
		</select>

		<c:forEach items="${listPlatos}" var="i">
			
			<div class="form-check">
				<label class="form-check-label"
					for="flexCheckDefault"> ${i.idPlato} </label>
				<input name="${i.idPlato}" class="form-check-input" type="number" min="1" step="1" value=""
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> ${i.nombre} </label>
			</div>
		</c:forEach>
		
		

		<input type="submit" value="Enviar">
	</form>

</body>
</html>