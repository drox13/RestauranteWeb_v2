<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import="edu.uptc.model.Plato"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style><%@include file="/css/estilos.css"%>
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
      <header>
        <nav>
            <a href="index.jsp">Inicio</a>
            <a href="domicilio.jsp">Domicilio</a>
            <a href="reserva.jsp">Reservas</a>
            
        </nav>
        <section class="textos-header">
            <h1>Tu Gallina</h1>
            <h2>Los Mejores Platos Tipicos</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                    style="stroke: none; fill: #fff;"></path>
            </svg></div>
    </header>
    <main>
    <c:set var="sManager" value="${SucursalManager()}" />
	<c:set var="listPlatos" value="${sManager.getListPlatos()}" />
        <section class="contenedor sobre-nosotros">
            <h2 class="titulo">Menu</h2>
            <div >
                <img src="img/ilustracion2.svg" alt="" class="imagen-about-us">
                <div class="contenido-textos">
                
                <c:set var="contador" value="${0}" />
				<ul >
					<c:forEach items="${listPlatos}" var="i">
						<c:set var="contador" value="${contador + 1}" />
						<h3><span>${contador}</span>${i.toString()}</h3>
					</c:forEach>
		
				</ul>
                    
                </div>
            </div>
        </section>
      
        <section class="clientes contenedor">
            <h2 class="titulo">Nuestros Servicios</h2>
            <div class="cards">
                <div class="card">
                
			
                    <img src="data:image/png;base64,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" alt="">
	                <button class="btn btn-primary">
						<a style="color: white" href="reserva.jsp"> Reservar </a>
					</button>
                    
                </div>
                <div class="card">
                	<img src="https://i.pinimg.com/474x/0a/ee/c0/0aeec09d1473ab5a3f78a0a90ce6c749.jpg" alt="">
	                <button class="btn btn-primary">
						<a style="color: white" href="domicilio.jsp"> Domicilios </a>
					</button>
                </div>
            </div>
        </section>
        
    </main>
    <footer>
        <div class="contenedor-footer">
            <div class="content-foo">
                <h4>Phone</h4>
                <p>8296312</p>
            </div>
            <div class="content-foo">
                <h4>Email</h4>
                <p>TuGallina@gmail.com</p>
            </div>
            <div class="content-foo">
                <h4>Location</h4>
                <p>8296312</p>
            </div>
        </div>
        <h2 class="titulo-final">&copy; Dario Baron | Christian Sanabria | Diego Cepeda</h2>
    </footer>
</body>

</html>