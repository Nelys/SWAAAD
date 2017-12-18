<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<tilesx:useAttribute name="current" ignore="true" />
<tilesx:useAttribute name="usuario" ignore="true" />
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset='utf-8' />
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
	<link href="<c:url value='/resources/css/bootstrap-timepicker.min.css' />" rel="stylesheet" />
	<link href="<c:url value='/resources/css/datetimepicker.css' />" rel="stylesheet" />
	<link href="<c:url value='/resources/template/css/calendar/fullcalendar.css' />" rel="stylesheet" />
	<link href="<c:url value='/resources/css/toastr.css' />" rel="stylesheet" type="text/css">



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
	<script src="<c:url value='/resources/template/js/datatables/dataTables.buttons.min.js' />"></script>
	<script src="<c:url value='/resources/template/js/datatables/buttons.bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/template/js/datatables/dataTables.tableTools.js' />"></script>
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


	<script src="<c:url value='/resources/template/js/calendar/moment.min.js' />"></script>
	<!-- jquery datepicker JS -->
	<script src="<c:url value='/resources/js/datapicker/bootstrap-datepicker.js' />"></script>
	<script src="<c:url value='/resources/js/datapicker/es.js' />"></script>
	<script src="<c:url value='/resources/js/datetimepicker.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap-timepicker.min.js' />"></script>

	<!-- Custom Index -->
	<script src="<c:url value='/resources/template/js/custom.js' />"></script>
	<script src="<c:url value='/resources/js/bsvalidator/bootstrapValidator.js'/>"></script>
	<script src="<c:url value='/resources/js/validate-forms.js' />"></script>
	<script src="<c:url value='/resources/js/toastr.min.js' />"></script>
	
	<script src="<c:url value='/resources/template/js/calendar/fullcalendar.min.js' />"></script>
	<script src="<c:url value='/resources/template/js/calendar/locale-all.js' />"></script>
</head>
<style>
body {
	background-color: white;
}
</style>
<body>

	<!-- Header Start -->
	<header>
		<div class="logo">
			<a href="#"> <img src="<c:url value='/resources/template/img/logo.png' />" alt="logo"> <span class="menu-toggle hidden-xs"> <i
				class="fa fa-bars"></i>
			</span>
		</a>
	</div>
	<!-- Logo ends -->

	<!-- Custom Search Starts -->
	<div class="navbar-header">
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/cursos"> <i class="fa fa-desktop"></i> Cursos
		</a>
	</div>
	<div class="navbar-header">
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/horario"> <i class="fa fa-clock-o"></i> Horario
		</a>
	</div>
	<!-- Custom Search Ends -->

	<!-- Mini right nav starts -->
	<div class="navbar-header pull-right vcenter">
		<ul id="mini-nav" class="clearfix">
			<li class="list-box user-profile hidden-xs"><a id="drop4" href="#" class="user-avtar animated rubberBanddropdown-toggle"
				data-toggle="dropdown" style="margin-top: 24px;"> <span class="user-name">${usuario} <i class="fa fa-angle-down"></i></span>
			</a>
			<ul class="dropdown-menu sm user-settings">
				<li><a href="perfil"><i class="fa fa-meh-o"></i> Perfil</a></li>
				<hr class="less-margin">
				<li><a href="<c:url value="/logout" />"> <i class="fa fa-sign-out"></i> Cerrar Sesion
				</a></li>
			</ul></li>
		</ul>
	</div>
</header>


<div class="main-container">

	<!-- Container fluid Starts -->
	<div class="container-fluid">

		<!-- Spacer starts -->
		<div class="spacer">
			<tiles:insertAttribute name="body" />
		</div>

	</div>

</div>

<!-- Footer starts -->
<footer> Copyright SWAAAD 2017. </footer>
<!-- Footer ends -->
<!-- Dashboard Wrapper ends -->
</body>
</html>