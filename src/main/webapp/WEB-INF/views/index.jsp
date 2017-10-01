<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../../favicon.ico"> -->

    <title>SWAAAD</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/resources/css/sb-admin.css' />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css' />" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Barra de Navegacion -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">SWAAAD</a>
        </div>
      </div>
    </nav>

    <div class="container">
      <!-- Contenedor -->
      <div class="jumbotron">
        <h1>SWAAAD</h1>
        <p>Sistema Web para el Apoyo de la Actividades Academicas de un Docente.</p>
        <p>Pagina gratuita destinada a los docentes.</p>
        <p align="center">
          <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/login" role="button">Ingresar</a>
          <a class="btn btn-lg btn-success" href="#" role="button">Crear Cuenta</a>
        </p>
      </div>

    </div> <!-- /container -->

  </body>
</html>
