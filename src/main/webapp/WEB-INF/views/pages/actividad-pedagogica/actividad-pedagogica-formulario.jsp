<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-6">
				<h1>Formulario Actividad Pedagogica</h1>
				<form:form action="saveActividadPedagogica" method="post" modelAttribute="actividadPedagogica" cssClass="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">ID</label>
						<div class="col-sm-10">
							<form:input path="idActividad" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Descripción:</label>
						<div class="col-sm-10">

							<form:input path="descripcion" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Fecha:</label>
						<div class="col-sm-10">
							<div class="input-group date" data-provide="datepicker">
								<form:input path="fecha" cssClass="form-control" />
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Hora:</label>

						<div class="col-sm-10">
							<div class="input-group bootstrap-timepicker timepicker">
								<input id="timepicker1" type="text" class="form-control input-small" readonly> <span class="input-group-addon"><i
									class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-default" href="calendarioActividadPedagogica">Cancelar</a>
							<button class="btn btn-success" type="submit">Guardar</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>

		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#fecha').datepicker();
	    $('#timepicker1').timepicker({
		minuteStep : 5,
		showMeridian : false
	    });

	});
    </script>
</div>
<!-- /#page-wrapper -->