<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Probando conexion alumnos</title>
</head>
<body>
	<h2>Alumnos</h2>

	<h3>Contactos</h3>
	<c:if test="${!empty alumnosLista}">
		<table class="data">
			<tr>
				<th>IdAlumno</th>
				<th>Alumno</th>
			</tr>
			<c:forEach var="lista" items="${alumnosLista}" >
				<tr>
					<td>${lista.idAlumno}</td>
					<td>${lista.nombres}</td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
</body>
</html>