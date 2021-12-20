<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import="edu.uptc.model.Plato"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Menu</title>
</head>
<body>

	<c:set var="sManager" value="${SucursalManager()}" />
	<c:set var="listPlatos" value="${sManager.getListPlatos()}" />
	
	<h1> MENU</h1>
	<ul class="list-group">
	<c:forEach items="${listPlatos}" var="i">
		<li class="list-group-item">${i.toString()}</li>
	</c:forEach>

	</ul>

	<button><a href="reserva.jsp"> Reservar </a></button>
	<button><a href="reserva.jsp"> Domicilios </a></button>

</body>
</html>