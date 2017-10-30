<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<!-- Bootstrap Core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet">

<script src="<c:url value='/resources/js/jquery.min-2.1.1.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

<script src="<c:url value='/resources/js/bsvalidator/bootstrapValidator.js'/>"></script>
<script src="<c:url value='/resources/js/validate-forms.js' />"></script>

<style>
@import
	url("http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700")
	;

body {
	font-family: Open Sans;
	font-size: 14px;
	line-height: 1.42857;
	background: #333333;
	height: 350px;
	padding: 0;
	margin: 0;
}

.container-login {
	min-height: 0;
	width: 480px;
	color: #333333;
	margin-top: 40px;
	padding: 0;
}

.center-block {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.container-login>section {
	margin-left: 0;
	margin-right: 0;
	padding-bottom: 10px;
}

#top-bar {
	display: inherit;
}

.nav-tabs.nav-justified {
	border-bottom: 0 none;
	width: 100%;
}

.nav-tabs.nav-justified>li {
	display: table-cell;
	width: 1%;
	float: none;
}

.container-login .nav-tabs.nav-justified>li>a, .container-login .nav-tabs.nav-justified>li>a:hover,
	.container-login .nav-tabs.nav-justified>li>a:focus {
	background: #2d88e1;
	border: medium none;
	color: #ffffff;
	margin-bottom: 0;
	margin-right: 0;
	border-radius: 0;
}

.container-login .nav-tabs.nav-justified>.active>a, .container-login .nav-tabs.nav-justified>.active>a:hover,
	.container-login .nav-tabs.nav-justified>.active>a:focus {
	background: #ffffff;
	color: #333333;
}

.container-login .nav-tabs.nav-justified>li>a:hover, .container-login .nav-tabs.nav-justified>li>a:focus
	{
	background: #2daee1;
}

.tabs-login {
	background: #ffffff;
	border: medium none;
	margin-top: -1px;
	padding: 10px 30px;
}

.container-login h2 {
	color: #2d88e1;
}

.form-control {
	background-color: #ffffff;
	background-image: none;
	border: 1px solid #999999;
	border-radius: 0;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
	color: #333333;
	display: block;
	font-size: 14px;
	height: 34px;
	line-height: 1.42857;
	padding: 6px 12px;
	transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
		ease-in-out 0s;
	width: 100%;
}

.container-login .checkbox {
	margin-top: -15px;
}

.container-login button {
	background-color: #2d88e1;
	border-color: #2882e7;
	color: #ffffff;
	border-radius: 0;
	font-size: 18px;
	line-height: 1.33;
	padding: 10px 16px;
	width: 100%;
}

.container-login button:hover, .container-login button:focus {
	background: #2daee1;
	border-color: #2882e7;
}
</style>
</head>

<body onload='document.loginForm.username.focus();'>

	<div class="login-body">
		<article class="container-login center-block">
			<section>
				<ul id="top-bar" class="nav nav-tabs nav-justified">
					<li class="active"><a href="#login-access">Acceso</a></li>
					<li><a href="#menu1">Registro</a></li>

				</ul>
				<div
					class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
					<div id="login-access" class="tab-pane fade active in">
						<h2>
							<i class="glyphicon glyphicon-log-in"></i> Acceso
						</h2>
						<!-- Formulario de Acceso -->
						<form name='loginForm' method="post" accept-charset="utf-8"
							autocomplete="off" role="form" class="form-horizontal">

							<!-- usuario -->
							<div class="form-group ">
								<label for="login" class="sr-only">Usuario</label> <input
									type="text" class="form-control" name="username" id="username"
									placeholder="Email" tabindex="1" value="" />
							</div>

							<!-- PassWord -->
							<div class="form-group ">
								<label for="password" class="sr-only">Password</label> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Password" value="" tabindex="2" />
							</div>

							<c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <br />
							<div class="form-group ">
								<button type="submit" name="log-me-in" id="submit" tabindex="5"
									class="btn btn-lg btn-primary">Entra</button>
							</div>
						</form>
					</div>


					<!-- Registrar Usuario -->

					<div id="menu1" class="tab-pane fade">
						<h2>
							<i class="glyphicon glyphicon-log-in"></i> Registro
						</h2>
						
						<form name='registroForm' method="post" accept-charset="utf-8"
							autocomplete="off" role="form" class="form-horizontal">
							
							<div class="form-group ">
								<label for="login" class="sr-only">Nombre</label> <input
									type="text" class="form-control" name="username" id="username"
									placeholder="Email" tabindex="1" value="" />
							</div>
							
							<div class="form-group ">
								<label for="login" class="sr-only">Usuario</label> <input
									type="text" class="form-control" name="username" id="username"
									placeholder="Email" tabindex="1" value="" />
							</div>
							
							<div class="form-group ">
								<label for="password" class="sr-only">Password</label> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Password" value="" tabindex="2" />
							</div>


							<br />
							<div class="form-group ">
								<button type="submit" name="log-me-in" id="submit" tabindex="5"
									class="btn btn-lg btn-primary">Entra</button>
							</div>
						</form>
					</div>
				</div>

			</section>
		</article>
	</div>
	<script>
		$(document).ready(function() {
			$(".nav-tabs a").click(function() {
				$(this).tab('show');
			});

		});

		
	</script>
</body>
</html>