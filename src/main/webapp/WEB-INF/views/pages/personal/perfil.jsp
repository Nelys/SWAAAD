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
				<h1>Perfil</h1>
				<form name='docenteForm' id='docenteForm' action="registrarUsuario" method="post" role="form" class="form-horizontal">
					<div class="form-group ">
						<label for="login" class="control-label col-sm-2">Nombre:</label>
						<div class="col-sm-10">
							<label for="login" class="form-control">Nombre del Docente</label>
						</div>
					</div>
					
					<div class="form-group ">
						<label for="login" class="control-label col-sm-2">Apellidos:</label>
						<div class="col-sm-10">
							<label for="login" class="form-control">Apellidos del Docente</label>
						</div>
					</div>
					
					<div class="form-group ">
						<label for="login" class="control-label col-sm-2">E-mail:</label>
						<div class="col-sm-10">
							<label for="login" class="form-control">Correo del Docente</label>
						</div>
					</div>

					<div class="form-group ">
<!-- 						<button type="submit" name="signup" class="btn btn-primary" >Cambiar Contraseña</button> -->
						<a href="cambiar" class="btn btn-primary pull-right" >Cambiar Contraseña</a>
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