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
	        <p style="font-size: 25px;">
				Bienvenido, <strong><c:out value="${user}"/></strong>
			</p>    
        	</div>
    	</div>
    
		<c:if test="${empty citas}">
			
			<c:if test="${empty cita}">
			
				<div>
					<div id="cajaTextoBienvenida" class="col-xs-6" >
						<p id="textoBienvenida" style="font-size: 30px;">Su usuario ha sido identificado como: <strong>PACIENTE</strong></p>
					</div>
				
					<div id="formulario" class="col-xs-4">
						<p style="color: #013252;" >Registre su cita utilizando el siguiente formulario</p>
						
						<form action="/crearCITA" method="post" accept-charset="utf-8">
	
							<p style="color: #013252;" ><label for="paciente">Nombre del paciente:</p>
							<input type="text" value="${user}" name="paciente" maxlength="255" size="20"
							class="form-control" disable="disabled" readonly/>
										 
							<p style="color: #013252;" ><label for="doctor">Doctor: 
								<select class="form-control" style="width: 250px;" name="doctor" id="doctor">
									<optgroup label="Doctor">
										<option value="Dr. Alonso">Dr. Alonso</option>
										<option value="Dra. Álvarez">Dra. Álvarez</option>
										<option value="Dr. Barrios">Dr. Barrios</option>
										<option value="Dra. Bravo">Dra. Bravo</option>
										<option value="Dr. Siloniz">Dr. Siloniz</option>
									</optgroup>
								</select>
							</label></p>
							
							<!-- 
							<input type="text" name="departamento"
							maxlength="255" size="20" required placeholder="departamento" class="form-control" /> 
							-->
							
							<p style="color: #013252;" ><label for="departamento">Departamento: 
								<select class="form-control" name="departamento" id="departamento">
									<optgroup label="Departamentos">
										<option value="Neurología">Neurología</option>
										<option value="Cardiología">Cardiología</option>
										<option value="Cirugía">Cirugía</option>
										<option value="Genética">Genética</option>
										<option value="Ginecología">Ginecología y Obstetricia</option>
										<option value="Medicina familiar">Medicina familiar</option>
										<option value="Medicina interna">Medicina interna</option>
										<option value="Patología clínica">Patología clínica</option>
										<option value="Pediatría">Pediatría</option>
										<option value="Psiquiatría">Psiquiatría</option>
										<option value="Radiología e Imagen">Radiología e Imagen</option>
									</optgroup>
								</select>
							</label></p>
							
							<p style="color: #013252;" ><label for="fechaDia">Fecha de la cita:</p>
							<input type="date" name="fecha" 
							maxlength="255" size="2" required class="form-control" >
							
							<p style="color: #013252;" ><label for="fechaHora">Hora de la cita:</p>
							<input type="time" name="fechaHora" 
							maxlength="255" size="2" required class="form-control" >
						
							<input type="submit" value="Enviar" class="btn btn-primary"/>
						</form>	
					</div>
					<div class="col-xs-2"></div>
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
			<div class="col-xs-6">
			<c:forEach items="${cita}" var="cit">
					<tr>
						<td><c:out value="${cit.idCita}" /></td>
						<td><c:out value="${cit.paciente}" /></td>
						<td><c:out value="${cit.doctor}" /></td>
						<td><c:out value="${cit.departamento}" /></td>
						<td><c:out value="${cit.fechaDia}" /></td>
						<td><c:out value="${cit.fechaHora}" /></td>
						<td><c:out value="${cit.retraso}" /></td>
					</tr>
				</c:forEach>
				</table>
			<div class="col-xs-6">
									<p style="color: #ffffff;" >Registre una nueva cita utilizando el siguiente formulario</p>
						
						<form action="/crearCITA" method="post" accept-charset="utf-8">
	
							<p style="color: #ffffff;" ><label for="paciente">Nombre del paciente:</p>
							<input type="text" value="${user}" name="paciente" maxlength="255" size="20"
							class="form-control" disable="disabled" readonly/>
										 
							<p style="color: #ffffff;" ><label for="doctor">Doctor: 
								<select class="form-control" style="width: 250px;" name="doctor" id="doctor">
									<optgroup label="Doctor">
										<option value="Dr. Alonso">Dr. Alonso</option>
										<option value="Dra. Álvarez">Dra. Álvarez</option>
										<option value="Dr. Barrios">Dr. Barrios</option>
										<option value="Dra. Bravo">Dra. Bravo</option>
										<option value="Dr. Siloniz">Dr. Siloniz</option>
									</optgroup>
								</select>
							</label></p>
							
							<!-- 
							<input type="text" name="departamento"
							maxlength="255" size="20" required placeholder="departamento" class="form-control" /> 
							-->
							
							<p style="color: #ffffff;" ><label for="departamento">Departamento: 
								<select class="form-control" name="departamento" id="departamento">
									<optgroup label="Departamentos">
										<option value="Neurología">Neurología</option>
										<option value="Cardiología">Cardiología</option>
										<option value="Cirugía">Cirugía</option>
										<option value="Genética">Genética</option>
										<option value="Ginecología">Ginecología y Obstetricia</option>
										<option value="Medicina familiar">Medicina familiar</option>
										<option value="Medicina interna">Medicina interna</option>
										<option value="Patología clínica">Patología clínica</option>
										<option value="Pediatría">Pediatría</option>
										<option value="Psiquiatría">Psiquiatría</option>
										<option value="Radiología e Imagen">Radiología e Imagen</option>
									</optgroup>
								</select>
							</label></p>
							
							<p style="color: #ffffff;" ><label for="fechaDia">Fecha de la cita:</p>
							<input type="date" name="fecha" 
							maxlength="255" size="2" required class="form-control" >
							
							<p style="color: #ffffff;" ><label for="fechaHora">Hora de la cita:</p>
							<input type="time" name="fechaHora" 
							maxlength="255" size="2" required class="form-control" >
						
							<input type="submit" value="Enviar" class="btn btn-primary"/>
						</form>
						</div>	
				<%-- <p>
				<a href="<c:url value="${url}"/>" class="btn btn-success">Volver</a>
				</p> --%>
				
				
			</c:if>
		</c:if>
		</div>

		
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
						<td><c:out value="${citai.retraso}" /><%--  <c:if
								test="${user == citai.doctor}">
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
							</c:if> --%></td>
					</tr>
				</c:forEach>
			</table>
		</c:if> 

	<div class="col-xs-6">		
		<p>
			Si quieres cerrar sesión pulsa el siguiente enlace 
		</p>
		<p>
		<a href="<c:url value="${url}"/>" class="btn btn-danger">Log out</a>
		</p>
	</div>

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