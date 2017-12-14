<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<!-- Bootstrap Core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">

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
	background: #12a5a0;
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
	color: #12a5a0;
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
	background-color: #12a5a0;
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

legend.scheduler-border {
	width: inherit; /* Or auto */
	padding: 0 10px; /* To give a bit of padding on the left and right */
	border-bottom: none;
}
</style>
</head>

<body onload='document.loginForm.username.focus();'>

	<div class="login-body">
		<article class="container-login center-block">
			<section>
				<div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
					<div id="login-access" class="tab-pane fade active in">
						<h2>
							<i class="glyphicon glyphicon-log-in"></i> Ingrese Contraseña
						</h2>
						<!-- Formulario de Acceso -->
						<form name='formulario' id='formulario' action="passwordRecuperar" method="post" accept-charset="utf-8" autocomplete="off" role="form"
							class="form-horizontal">

							<input type="text" value="${id_usuario}" name="usuario" id="usuario">
							<!-- usuario -->
							<div class="form-group ">
								<label for="login" class="sr-only">Constraseña</label> <input type="password" class="form-control" name="password" id="password"
									placeholder="Constraseña" tabindex="1" value="" />
							</div>
							<div class="form-group ">
								<label for="login" class="sr-only">Confirmar contraseña</label> <input type="password" class="form-control" name="password2" id="password2"
									placeholder="Confirmar contraseña" tabindex="2" value="" />
							</div>

							<div class="form-group ">
								<a href="login" class="btn btn-sm btn-danger">Regresar</a> 
								<input type="submit" class="btn btn-sm btn-success " value="Enviar">
							</div>
						</form>
					</div>
				</div>
			</section>
		</article>
	</div>
	<script>
	$(document).ready(function() {
	    $('#formulario')
		.bootstrapValidator(
		{
			message: 'Este valor es invalido',
			feedbackIcons: {
				valid: 'fa fa-check',
				invalid: 'fa fa-times',
				validating: 'fa fa-refresh'
			},
			fields: {
				password: {
					validators: {
						notEmpty: {
							message: 'El password es obligatorio y no puede estar vacia'
						},
						identical: {
							field: 'password2',
							message: 'El password y su confirmacion no son iguales'
						},
						different: {
							field: 'username',
							message: 'El password no puede ser igual que el nombre de usuario'
						},
						callback: {
							callback: function(value, validator) {
								// Check the password strength
								if (value.length < 6) {
									return {
										valid: false,
										message: 'El password debe tener mas de 6 caracteres'
									}
								}
	
								if (value === value.toLowerCase()) {
									return {
										valid: false,
										message: 'El password debe contener al menos un caracter en mayÃºscula'
									}
								}
								if (value === value.toUpperCase()) {
									return {
										valid: false,
										message: 'El password debe contener al menos un caracter en minuscula'
									}
								}
								if (value.search(/[0-9]/) < 0) {
									return {
										valid: false,
										message: 'El password debe contener al menos un digito'
									}
								}
	
								return true;
							}
						}
					}
				},
				password2: {
					validators: {
						notEmpty: {
							message: 'El password de confirmacion es obligatoria y no puede estar vacia'
						},
						identical: {
							field: 'password',
							message: 'El password y su confirmacion no son iguales'
						},
						different: {
							field: 'username',
							message: 'El password no puede ser igual que el nombre de usuario'
						}
					}
				}
			}
		});
	});
    </script>
</body>
</html>