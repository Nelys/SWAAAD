<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1>Horario del Curso</h1>
			</div>
		</div>
		<h3>Seleccione los curso</h3>



		<div class='row'>
			<div class="col-md-4 form-horizontal pull-right">
				<div class="form-group">
					<label class="col-sm-3 control-label">Mes:</label>
					<div class="col-sm-5">
						<select class="form-control" id="cbxCursos" onchange="comboCursos()">
							<c:forEach var="lista" items="${listaCursos}">
								<option value="${lista.idCurso}">${lista.nombreCurso}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		
		<h3>Seleccione los días</h3>
		<form action="#">
			<div class="row">
				<!-- 				<div class="col-lg-1"></div> -->
				<div class="col-lg-3">
					<div class="form-group">
						<div class="col-sm-10">
							<div class="checkbox checkbox-primary">
								<input id="checkbox1" type="checkbox"> <label
									for="checkbox1"> Lunes </label>
							</div>
							<div class="checkbox checkbox-primary">
								<input id="checkbox2" type="checkbox" checked=""> <label
									for="checkbox2"> Martes </label>
							</div>
							<div class="checkbox checkbox-primary">
								<input id="checkbox3" type="checkbox"> <label
									for="checkbox3"> Miercoles </label>
							</div>
							<div class="checkbox checkbox-primary">
								<input id="checkbox4" type="checkbox"> <label
									for="checkbox4"> Jueves </label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="form-group">
						<div class="col-sm-10">
							<div class="checkbox checkbox-primary">
								<input id="checkbox5" type="checkbox" checked=""> <label
									for="checkbox5"> Viernes </label>
							</div>
							<div class="checkbox checkbox-primary">
								<input id="checkbox6" type="checkbox"> <label
									for="checkbox6"> Sabado </label>
							</div>
							<div class="checkbox checkbox-primary">
								<input id="checkbox7" type="checkbox"> <label
									for="checkbox7"> Domingo </label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label class="control-label" for="pwd">Hora Inicial:</label>
						<div>
							<div class="input-group bootstrap-timepicker timepicker">
								<input id="timepicker1" type="text"
									class="form-control input-small" readonly> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label" for="pwd">Hora Final:</label>
						<div>
							<div class="input-group bootstrap-timepicker timepicker">
								<input id="timepicker2" type="text"
									class="form-control input-small" readonly> <span
									class="input-group-addon"><i
									class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 				<div class="col-lg-1"></div> -->
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a class="btn btn-default" href="alumnos">Cancelar</a>
					<button class="btn btn-success" type="submit">Guardar</button>
				</div>
			</div>
		</form>

		<!-- /.row -->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#timepicker1').timepicker({
					minuteStep : 5,
					showMeridian : false
				});

				$('#timepicker2').timepicker({
					minuteStep : 5,
					showMeridian : false
					
				}).on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();

		            // Get the form instance
		            var $form = $(e.target);

		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');

		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		                alert(result.message);
		                if(result.response){
		                	location.href="logout";
		                }
		            }, 'json');
		        });
				
				
				
				
			});
			
		</script>
	</div>
	<!-- /.container-fluid -->

</div>



<!-- /#page-wrapper -->