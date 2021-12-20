<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import="edu.uptc.model.Plato"%>

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

		<c:forEach items="${listPlatos}" var="i">

			<div class="form-check">
				<input name="${i.idPlato} class="form-check-input" type="checkbox" value="${i.idPlato}"
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> ${i.nombre} </label>
			</div>
		</c:forEach>

		<input type="submit" value="Enviar">
	</form>

</body>
</html>