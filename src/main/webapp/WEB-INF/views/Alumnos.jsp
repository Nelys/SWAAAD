<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Probando conexion alumnos</title>
</head>
<body>
	<h2>Alumnos</h2>

	<h3>Contactos</h3>
	<c:if test="${!empty lista}">
		<table class="data">
			<tr>
				<th>IdAlumno</th>
				<th>Alumno</th>
			</tr>
			<c:forEach items="${lista}" var="alumno">
				<tr>
					<td>${alumno.idalumno}</td>
					<td>${alumno.nombrealumno}</td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
</body>
</html>