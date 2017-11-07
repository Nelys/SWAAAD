<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<script src="<c:url value='/resources/js/bsvalidator/bootstrapValidator.js'/>"></script>
<script src="<c:url value='/resources/js/validate-forms.js' />"></script>

<style>
	.im-centered{margin: auto; max-width: 600px;}
</style>

<div id="page-wrapper">

	<div class="container-fluid">
		<div class="im-centered">
		<div class="row">
			<div class="col-lg-12">
				<h1>Cambiar Contraseña</h1>
				<form name='docenteForm' id='docenteForm' action="registrarUsuario" method="post" role="form" class="form-horizontal">
					<div class="form-group ">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" name="password" id="password" placeholder="Password" value="" required="required"
						/>
					</div>
					<div class="form-group ">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" name="password2" id="password2" placeholder="Confirmar Password" value="" required="required"
						/>
					</div>

					<div class="form-group ">
<!-- 						<button type="submit" name="signup" class="btn btn-primary" disabled="disabled">Guardar</button> -->
						<a href="perfil" class="btn btn-primary" >Cancelar</a>
						<a href="perfil" class="btn btn-success pull-right" >Guardar</a>
					</div>
				</form>
			</div>
		</div>
		</div>
		<!-- /.row -->
	
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->