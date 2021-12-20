<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import="edu.uptc.model.Plato"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style><%@include file="/css/styles.css"%>
</style>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Menu</title>
</head>
<body>
<!-- 
	<header>
		<img id="imgGallina" class="img-fluid" alt="imagen gallina"
			src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.pystatic.com%2Frestaurants%2Fdomi_41325.jpg&f=1&nofb=1">
	</header>

	<c:set var="sManager" value="${SucursalManager()}" />
	<c:set var="listPlatos" value="${sManager.getListPlatos()}" />
	<section id="menu">
		<h1>MENU</h1>

		<ul class="list-group">
			<c:forEach items="${listPlatos}" var="i">
				<li class="list-group-item">${i.toString()}</li>
			</c:forEach>

		</ul>
	</section>
	
	<aside id="btns">
		<div>
			<button class="btn btn-primary">
				<a style="color: white" href="reserva.jsp"> Reservar </a>
			</button>
		</div>
		<div>
			<button class="btn btn-primary">
				<a style="color: white" href="domicilio.jsp"> Domicilios </a>
			</button>
		</div>
	</aside>
 -->
 
 <header>
 <!-- <img id="imgGallina" alt="imagen gallina"
			src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.pystatic.com%2Frestaurants%2Fdomi_41325.jpg&f=1&nofb=1">
        -->
    </header>
    <section>
    <c:set var="sManager" value="${SucursalManager()}" />
	<c:set var="listPlatos" value="${sManager.getListPlatos()}" />
       <article>
			<h1>MENU</h1>
	
			<ul class="list-group">
				<c:forEach items="${listPlatos}" var="i">
					<li class="list-group-item">${i.toString()}</li>
				</c:forEach>
	
			</ul>
       </article>
    </section>
    <aside>
       <div class="btns">
			<button class="btn btn-primary">
				<a style="color: white" href="reserva.jsp"> Reservar </a>
			</button>
		</div>
		<div class="btns">
			<button class="btn btn-primary">
				<a style="color: white" href="domicilio.jsp"> Domicilios </a>
			</button>
		</div>
    </aside>
    
</body>
<footer>
       Propietarios: Dario Baron, Cristian Sanabria, Diego Cepeda
    </footer>
</html>