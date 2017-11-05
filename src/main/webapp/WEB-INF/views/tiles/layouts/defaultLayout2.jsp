<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<tilesx:useAttribute name="current" ignore="true" />
<tilesx:useAttribute name="usuario" ignore="true" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Everest Admin Panel" />
<meta name="keywords"
	content="Admin, Dashboard, Bootstrap3, Sass, transform, CSS3, HTML5, Web design, UI Design, Responsive Dashboard, Responsive Admin, Admin Theme, Best Admin UI, Bootstrap Theme, Wrapbootstrap, Bootstrap" />
<meta name="author" content="Bootstrap Gallery" />
<link rel="shortcut icon" href="<c:url value='/resources/template/img/favicon.ico' />">
<title><tiles:getAsString name="title" /></title>


<link href="<c:url value='/resources/template/css/bootstrap.min.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/template/css/animate.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/template/css/main.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/template/fonts/font-awesome.min.css' />" rel="stylesheet" type="text/css">


<!-- Data Tables -->
<link href="<c:url value='/resources/template/css/datatables/dataTables.bs.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/autoFill.bs.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/fixedHeader.bs.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/buttons.bs.css' />" rel="stylesheet" />





<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%-- <script src="<c:url value='/resources/template/js/jquery.js' />"></script> --%>
<script src="<c:url value='/resources/js/jquery-3.2.1.js' />"></script>
<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/resources/template/js/bootstrap.min.js' />"></script>

<!-- Sparkline graphs -->
<script src="<c:url value='/resources/template/js/sparkline.js' />"></script>

<!-- jquery ScrollUp JS -->
<script src="<c:url value='/resources/template/js/scrollup/jquery.scrollUp.js' />"></script>


<!-- Data Tables -->
<script src="<c:url value='/resources/template/js/datatables/dataTables.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/dataTables.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/dataTables.tableTools.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/dataTables.buttons.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/buttons.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/autoFill.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/autoFill.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/fixedHeader.min.js' />"></script>

<!-- Download / CSV / Copy / Print -->
<script src="<c:url value='/resources/template/js/datatables/buttons.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/flash.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/jszip.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/pdfmake.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/vfs_fonts.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/html5.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/buttons.html5.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/buttons.print.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/buttons.colVis.min.js' />"></script>


<!-- jquery datepicker JS -->
<script src="<c:url value='/resources/js/datapicker/bootstrap-datepicker.js' />"></script>
<script src="<c:url value='/resources/js/datapicker/es.js' />"></script>

<!-- Custom Index -->
<script src="<c:url value='/resources/template/js/custom.js' />"></script>

<style>
	.vcenter {
	    display: inline-block;
	    vertical-align: middle;
	    float: none;
	}
</style>
</head>

<body>

	<!-- Header Start -->
	<header>
				<!-- Logo starts -->
		<div class="logo">
			<a href="#"> 
				<img src="<c:url value='/resources/template/img/logo.png' />" alt="logo">
				<span class="menu-toggle hidden-xs"> <i class="fa fa-bars"></i> </span>
			</a>
		</div>
		<!-- Logo ends -->

		<!-- Custom Search Starts -->
		<div class="navbar-header">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/cursos">
				<i class="fa fa-desktop"></i> Cursos
			</a>
		</div>
		
		<!-- Custom Search Ends -->

		<!-- Mini right nav starts -->
		<div class="navbar-header pull-right vcenter">
			<ul id="mini-nav" class="clearfix">
				<li class="list-box user-profile hidden-xs">
					<a id="drop4" href="#" class="user-avtar animated rubberBanddropdown-toggle" data-toggle="dropdown" style="margin-top: 24px;">  
						<span class="user-name">${usuario} <i class="fa fa-angle-down"></i></span>
					</a>
					<ul class="dropdown-menu sm user-settings">
						<li><a href="profile.html"><i class="fa fa-meh-o"></i> Perfil</a></li>
						<hr class="less-margin">
						<li><a href="#"> <i class="fa fa-sun-o"></i> Configuración</a></li>
						<li><a href="login.html"> <i class="fa fa-sign-out"></i> Cerrar Sesion</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</header>


	<!-- Left sidebar starts -->
	<aside id="sidebar">
		<div id='menu'>
			<ul>
<%-- 				<li class="${current == 'cursos' ? ' highlight active' : '' }"><a href="${pageContext.request.contextPath}/cursos"> <i --%>
<%-- 						class="fa fa-desktop"></i> <span>Cursos</span> ${current == 'cursos' ? '<span	class="current-page"></span>' : '' } --%>
<!-- 				</a></li> -->

				<li class="${current == 'alumnos' ? ' highlight active' : '' }"><a href="${pageContext.request.contextPath}/alumnos"> <i
						class="fa fa-user"></i> <span>Alumno</span> ${current == 'alumnos' ? '<span	class="current-page"></span>' : '' }
				</a></li>
				<li class="${current == 'listNota' ? ' highlight active' : '' }"><a href="${pageContext.request.contextPath}/listNota"> <i
						class="fa fa-file"></i> <span>Notas</span> ${current == 'listNota' ? '<span	class="current-page"></span>' : '' }
				</a></li>
				<li class="${current == 'asistencias' ? ' highlight active' : '' }"><a href="${pageContext.request.contextPath}/asistencias"> <i
						class="fa fa-list"></i> <span>Asistencias</span> ${current == 'asistencias' ? '<span	class="current-page"></span>' : '' }
				</a></li>

				<li class="${current == 'actividades-pedagogicas' ? ' highlight active' : '' }"><a
					href="${pageContext.request.contextPath}/actividades-pedagogicas"> <i class="fa fa-pencil"></i> <span>Act. Pedagogicas</span> ${current == 'actividades-pedagogicas' ? '<span	class="current-page"></span>' : '' }
				</a></li>
				<li class="${current == 'aula-dinamica' ? ' highlight active' : '' }"><a href="${pageContext.request.contextPath}/aula-dinamica"> <i
						class="fa fa-pencil"></i> <span>Aula Dinamica</span> ${current == 'aula-dinamica' ? '<span	class="current-page"></span>' : '' }
				</a></li>
			</ul>
		</div>

	</aside>

	<!-- Dashboard Wrapper starts -->
	<div class="dashboard-wrapper">

		<!-- Top Bar starts -->
		<div class="top-bar">
			<div class="page-title">
				<tiles:getAsString name="title" />
			</div>

		</div>
		<!-- Main Container starts -->
		<div class="main-container">

			<!-- Container fluid Starts -->
			<div class="container-fluid">

				<!-- Spacer starts -->
				<div class="spacer">
					<tiles:insertAttribute name="body" />
				</div>

			</div>

		</div>

	</div>
	<!-- Main Container ends -->
	<!-- Footer starts -->
	<footer> Copyright SWAAAD 2017. </footer>
	<!-- Footer ends -->


	<!-- Dashboard Wrapper ends -->
</body>
</html>