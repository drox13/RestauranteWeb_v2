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
	<c:set var="sManager" value="${SucursalManager()}"/>
	<c:set var="listSucursales" value="${sManager.getListSucursales()}"/>

	<form class="row g-3" action="ReservaServlet" method="post">
		<label> Numero de cedula</label>
		<input type="number" name="cc">

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
       	
       	<input type="number" name="n_personas" min="1" step="1">
       	
		<input type="submit" value="Enviar">
	</form>
	
	
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