<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Página de Error</title>
</head>

<body>

	<br><hr> 
	<h2>Error de la aplicación, por favor ponte en contacto con soporte.</h2> 
	
	<h3>Información para Debug:</h3> 
	<p><strong>URL de la Petición </strong> = ${url}</p> 
	<p><strong>Excepción lanzada </strong> = ${exception.message}</p> 
    
    <h3>Traza de la pila de excepción.</h3> 
		<c:forEach items="${exception.stackTrace}" var="ste">
			${ste}
		</c:forEach>  
	<br><hr>

</body>
</html>