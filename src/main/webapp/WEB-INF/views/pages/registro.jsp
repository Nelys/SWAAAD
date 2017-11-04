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
<script src='https://www.google.com/recaptcha/api.js?hl=es'></script>
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

legend.scheduler-border {
	width: inherit; /* Or auto */
	padding: 0 10px; /* To give a bit of padding on the left and right */
	border-bottom: none;
}
</style>
</head>

<body onload=''>

	<div class="login-body">
		<article class="container-login center-block">
			<section>
				<ul id="top-bar" class="nav nav-tabs nav-justified">
					<li><a href="login">Ingresar</a></li>
					<li class="active"><a href="#menu1">Crear Cuenta</a></li>

				</ul>
				<div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
					<div id="login-access" class="tab-pane fade active in">

						<!-- Formulario de Acceso -->
						<h2>
							<i class="glyphicon glyphicon-log-in"></i> Crear Cuenta
						</h2>
						<!-- 	<form name='RegistrarForm' id='RegistrarForm' action="javascript:alert( 'success!' );"  method="post" role="form" class="form-horizontal"> -->
						<form name='registroForm' id='registroForm' action="registrarUsuario" method="post" role="form" class="form-horizontal">

							<div class="form-group ">
								<label for="login" class="sr-only">Nombre</label> <input type="text" class="form-control" name="nombres" id="nombres" placeholder="Nombres"
									tabindex="1" value="" required="required" />
							</div>

							<div class="form-group ">
								<label for="login" class="sr-only">Apellidos</label> <input type="text" class="form-control" name="apellidos" id="apellidos"
									placeholder="Apellidos" tabindex="1" value="" required="required" />
							</div>

							<div class="form-group ">
								<fieldset>
									<legend>Genero</legend>
									<label class="radio-inline"> <input type="radio" name="optradio" value="F" checked="checked">Femenino
									</label> <label class="radio-inline"> <input type="radio" name="optradio" value="M">Masculino
									</label>
								</fieldset>
							</div>

							<div class="form-group ">
								<label for="login" class="sr-only">Email</label> <input type="email" class="form-control" name="email" id="email" placeholder="Email" value=""
									required="required" />
							</div>

							<div class="form-group ">
								<label for="password" class="sr-only">Password</label> <input type="password" class="form-control" name="password" id="password"
									placeholder="Password" value="" required="required" />
							</div>
							<div class="form-group ">
								<label for="password" class="sr-only">Password</label> <input type="password" class="form-control" name="password2" id="password2"
									placeholder="Confirmar Password" value="" required="required" />
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label" id="captchaOperation"></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" name="captcha" />
								</div>
							</div>
							<div class="form-group ">
								<button type="submit" name="signup" class="btn btn-primary" disabled="disabled">Registrar</button>


							</div>
							<div class="form-group ">

								<button type="reset" class="btn btn-danger" id="resetBtn">Limpiar</button>
							</div>
						</form>
					</div>


					<!-- Registrar Usuario -->

					<div id="menu1" class="tab-pane fade"></div>

					<!-- 					Fin registro -->
				</div>

			</section>
		</article>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							function randomNumber(min, max) {
								return Math.floor(Math.random()
										* (max - min + 1) + min);
							}
							;
							$('#captchaOperation').html(
									[ randomNumber(1, 100), '+',
											randomNumber(1, 200), '=' ]
											.join(' '));
							$('#registroForm')
									.bootstrapValidator(
											{
												message : 'Este valor es invalido',
												feedbackIcons : {
													valid : 'fa fa-check',
													invalid : 'fa fa-times',
													validating : 'fa fa-refresh'
												},
												fields : {
													nombres : {
														message : 'no es valido',
														validators : {
															notEmpty : {
																message : 'Dato necesario'
															},
															stringLength : {
																min : 2,
																max : 50,
																message : 'Minimo 2 - maximo 50 caracteres'
															},
															regexp : {
																regexp : /^[a-zA-Z ]+$/,
																// regexp:
																// /^[a-zA-Z0-9_\.]+$/,
																message : 'el nombre puede contener solo letras de la A-Z'
															}
														}
													},

													apellidos : {
														message : 'no es valido',
														validators : {
															notEmpty : {
																message : 'Dato necesario'
															},
															stringLength : {
																min : 2,
																max : 50,
																message : 'Minimo 2 - maximo 50 caracteres'
															},
															regexp : {
																regexp : /^[a-zA-Z ]+$/,
																message : 'el nombre puede contener solo letras de la A-Z'
															}
														}
													},
													captcha : {
														validators : {
															callback : {
																message : 'Respuesta Incorrecta',
																callback : function(
																		value,
																		validator) {
																	var items = $(
																			'#captchaOperation')
																			.html()
																			.split(
																					' '), sum = parseInt(items[0])
																			+ parseInt(items[2]);
																	return value == sum;
																}
															}
														}
													}

												}
											})
									.on(
											'success.form.bv',
											function(e) {
												// Prevent form submission
												e.preventDefault();

												// Get the form instance
												var $form = $(e.target);

												// Get the BootstrapValidator instance
												var bv = $form
														.data('bootstrapValidator');

												// Use Ajax to submit form data
												$
														.post(
																$form
																		.attr('action'),
																$form
																		.serialize(),
																function(result) {
																	console
																			.log(result);

																	alert(result.message);

																}, 'json');
											});
						});
	</script>
</body>
</html>