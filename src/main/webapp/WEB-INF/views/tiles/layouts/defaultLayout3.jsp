<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:getAsString name="title" /></title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value='/resources/css/sb-admin.css' />"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<c:url value='/resources/font-awesome/css/font-awesome.min.css' />"
	rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/datepicker.css' />"
	rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/build.css' />" rel="stylesheet"
	type="text/css">

<link
	href="<c:url value='/resources/css/bootstrap-timepicker.min.css' />"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value='/resources/css/bootstrap-colorpicker.min.css' />"
	rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/toastr.css' />"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<%--     <script src="<c:url value='/resources/js/jquery-1.12.4.js' />"></script> --%>
<%--     <script src="<c:url value='/resources/js/jquery.min-2.1.1.js' />"></script> --%>
<script src="<c:url value='/resources/js/jquery-3.2.1.js' />"></script>
<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>
</head>

<body>

	<div id="wrapper">

		
		<div id="page-wrapper">

			<div class="container-fluid">
				<!-- Insertar Cuerpo -->
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<%--     <script src="<c:url value='/resources/js/jquery.js' />"></script> --%>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

	<script src="<c:url value='/resources/js/bootstrap-datepicker.js' />"></script>

	<script
		src="<c:url value='/resources/js/bootstrap-timepicker.min.js' />"></script>

	<script
		src="<c:url value='/resources/js/jquery.fixedTblHdrLftCol.js' />"></script>

	<script
		src="<c:url value='/resources/js/bootstrap-colorpicker.min.js' />"></script>

	<script src="<c:url value='/resources/js/bootstrap-number-input.js' />"></script>

	<script src="<c:url value='/resources/js/toastr.min.js' />"></script>

	<script>
		$(function() {
			toastr.options = {
				"closeButton" : true,
				"debug" : true,
				"newestOnTop" : true,
				"progressBar" : false,
				"positionClass" : "toast-top-right",
				"preventDuplicates" : true,
				"showDuration" : "300",
				"hideDuration" : "1000",
				"timeOut" : "5000",
				"extendedTimeOut" : "1000",
				"showEasing" : "swing",
				"hideEasing" : "linear",
				"showMethod" : "fadeIn",
				"hideMethod" : "fadeOut"
			}
		});
	</script>
</body>
</html>