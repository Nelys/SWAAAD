<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Importar Alumnos</title>
</head>
<body>
	<h1>${message}</h1>
	<h1>${error}</h1>

<%-- 	<form:form action="processExcel" method="post" --%>
<%-- 		enctype="multipart/form-data"> --%>
<!-- 		<div>Excel File 2003:</div> -->
<!-- 		<input name="excelfile" type="file"> -->
<!-- 		<input type="submit" value="processExcel"> -->
<%-- 	</form:form> --%>
<!-- 	<hr> -->
	<form:form action="hello" method="post" enctype="multipart/form-data">
		<div>Excel File 2007:</div>
		<input name="excelfile2007" type="file">
		<input type="submit" value="Generar">
	</form:form>
	<hr>
	<h3>Lista Alumnos</h3>
	<c:if test="${!empty lstUser}">
		<table class="tg">
			<tr>
				<th width="80">ID</th>
				<th width="120">Nombres</th>
				<th width="120">Apellidos</th>
			</tr>
			<c:forEach items="${lstUser}" var="user">
				<tr>
					<td>${user.idAlumno}</td>
					<td>${user.nombres}</td>
					<td>${user.apellidos}</td>

				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>