<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />

<title>MTime</title>
</head>
<body id="page-top">

	<c:if test="${not empty user}">
		<div class="header-content">
        	<div class="header-content-inner">
	            <h1 id="homeHeading">MTIME</h1>
	            <hr>
	        <p>
				Bienvenido, <strong><c:out value="${user}"/></strong>
			</p>    
        	</div>
    	</div>
    
		<c:if test="${empty citas}">
			
			<c:if test="${empty cita}">
				<div id="cajitaBonita">
					<div id="cajaTextoBienvenida" class="col-xs-6">
						<p id="textoBienvenida">Su usuario ha sido identificado como: <strong>PACIENTE</strong></p>
					</div>
				
					<div id="formulario" class="col-xs-6">
						<p>Registre su sita utilizando el siguiente formulario</p>
						
						<form action="/crearCITA" method="post" accept-charset="utf-8">
	
							<input type="text" value="${user}" name="paciente" maxlength="255" size="20"
							class="form-control" disable="disabled" readonly/>
										 
							<input type="text" name="doctor"
							maxlength="255" size="20" required placeholder="Doctor" class="form-control" />
							
							<input type="text" name="departamento"
							maxlength="255" size="20" required placeholder="departamento" class="form-control" />
							
							<input type="date" name="fecha" 
							maxlength="255" size="2" required class="form-control" >
						
							<input type="time" name="fechaHora" 
							maxlength="255" size="2" required class="form-control" >
						
							<input type="submit" value="Enviar" class="btn btn-primary"/>
						</form>	
					</div>
				</div>
			
			</c:if>
			<c:if test="${not empty cita}">
				<p>Estos son los datos de tu cita</p>
				<table class="table">
			<thead>
				<td>idCita</td>
				<td>Paciente</td>
				<td>Doctor</td>
				<td>Departamento</td>
				<td>Fecha</td>
				<td>Hora</td>
				<td>Retraso</td>
				
			</thead>
					<tr>
						<td><c:out value="${cita.idCita}" /></td>
						<td><c:out value="${cita.paciente}" /></td>
						<td><c:out value="${cita.doctor}" /></td>
						<td><c:out value="${cita.departamento}" /></td>
						<td><c:out value="${cita.fechaDia}" /></td>
						<td><c:out value="${cita.fechaHora}" /></td>
						<td><c:out value="${cita.retraso}" /></td>
					</tr>
				</table>
				
				<a href="<c:url value="${url}"/>" class="btn btn-success">Volver</a>
				
				
			</c:if>
		</c:if>
		
		<c:if test="${not empty citas}">

			<p>Has sido identificado como un doctor.</p>
			<table class="table">
			<thead>
				<td>idCita</td>
				<td>Paciente</td>
				<td>Doctor</td>
				<td>Departamento</td>
				<td>Fecha</td>
				<td>Hora</td>
				<td>Retraso</td>
			</thead>
				<c:forEach items="${citas}" var="citai">
					<tr>
						<td><c:out value="${citai.idCita}" /></td>
						<td><c:out value="${citai.paciente}" /></td>
						<td><c:out value="${citai.doctor}" /></td>
						<td><c:out value="${citai.departamento}" /></td>
						<td><c:out value="${citai.fechaDia}" /></td>
						<td><c:out value="${citai.fechaHora}" /></td>
						<td><c:out value="${citai.retraso}" /> <c:if
								test="${user == citai.Doctor}">
								<form action="/aceptarTFG" method="post">
									<input id="autor" name="autor" type="hidden"
										value="${tfgi.autor}" /> <input type="submit"
										value="Acceptar TFG"  class="btn btn-primary"/>
								</form>
							</c:if>
							<c:if test="${tfgi.estado == 3 && user == tfgi.secretario}">
								<form action="/aceptarDefensaTFG" method="post">
									<input id="autor" name="autor" type="hidden"
										value="${tfgi.autor}" /> <input type="submit"
										value="Acceptar defensa TFG"  class="btn btn-primary"/>
								</form>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</c:if> 


		<p>
			Si quieres cerrar sesión pulsa el siguiente enlace <a
				href="<c:url value="${url}"/>" class="btn btn-danger">Log out</a>
		</p>
	</c:if>
	
	<c:if test="${empty user}">
	
		<div class="header-content">
        	<div class="header-content-inner">
	            <h1 id="homeHeading">MTIME</h1>
	            <hr>
	            <p> Por favor inicia sesión utilizando el siguiente enlace </p>
				<a href="<c:url value="${url}"/>" class="btn btn-success btn-xl page-scroll">Login</a>
        	</div>
    	</div>

	</c:if>
	
</body>
</html>