<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.util.ArrayList,edu.uptc.model.SucursalManager"%>
<%@ page import = "edu.uptc.model.Sucursal"%>

<!doctype html>

<html lang="en">
<head>
<style><%@include file="/css/estilos.css"%></style>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Reservas!</title>
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
            
            <c:set var="sManager" value="${SucursalManager()}"/>
	<c:set var="listSucursales" value="${sManager.getListSucursales()}"/>
	
	<h1> Reservas</h1>
	
	<form class="row g-3" action="ReservaServlet" method="post">
		<div class="mb-3" >
			<label> Numero de cedula</label>
			<input type="number" name="cc">
		</div>

		<select id="select" name="ciudad" class="form-select"  aria-label="Default select example">
			<option selected>Seleccione la Sucursal</option>
			<c:forEach items="${listSucursales}" var="i">
				<option value="<c:out value="${i.idSucursal}"/>" >
				 	<c:out value="${i.idSucursal}"/> - <c:out value="${i.ciudad}"/> - <c:out value="${i.direccion}"></c:out> 
				 </option>
			</c:forEach>
		</select>
		
		<input type="date" id="start" name="fecha"  value="2021-12-18"
       		min="2021-12-18" max="2022-12-31">
       	
       	<select name="hora" class="form-select"  aria-label="Default select example">
       		<option selected>Seleccione la Hora de reserva</option>
       		<c:forEach var = "i" begin = "12" end = "15">
       			<option value="<c:out value="${i} : 00"/>" >
       				 <c:out value="${i}: 00"/>
       			</option>
     		 </c:forEach>
     		 
     		 <c:forEach var = "i" begin = "6" end = "10">
       			<option value="<c:out value="${i} : 00 PM"/>" >
       				 <c:out value="${i}: 00 PM"/>
       			</option>
     		 </c:forEach>
       	</select>
       	
       	<div class="mb-3">
	       	<label> Numero de personas</label>
	       	<input type="number" name="n_personas" min="1" step="1">
       	</div>
       	
		<input type="submit" value="Enviar">
	</form>
        </section>
      
        <section class="clientes contenedor">
            <h2 class="titulo">Nuestros Servicios</h2>
            <div class="cards">
                <div class="card">
                
			
                    <img src="https://previews.123rf.com/images/vectorchef/vectorchef1507/vectorchef150709126/42872760-icono-del-men%C3%BA.jpg" alt="">
	                <button class="btn btn-primary">
						<a style="color: white" href="reserva.jsp"> Ver Menu </a>
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
	
	
	<!-- Optional JavaScript; choose one of the two! -->

	<script type="text/javascript">
	</script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>