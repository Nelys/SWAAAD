<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1>Horario de Docente</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<h2>Formulario Horario</h2>
				<form name='horariosForm' id='horariosForm' action="saveHorario" method="post" role="form" class="">
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">Curso:</label>
								<div class="col-sm-9">
									<select class="form-control" name="cbxCursos" id="cbxCursos">
										<c:forEach var="lista" items="${listaCursos}"><option value="${lista.idCurso}">${lista.nombreCurso}</option></c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<h4>Seleccion Hora</h4>
							<div class="form-group">
								<label class="control-label" for="pwd">Hora Inicial:</label>
								<div>
									<div class="input-group bootstrap-timepicker timepicker">
										<input id="timepicker1" type="text" class="form-control input-small" readonly>
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-time"></i>
										</span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label" for="pwd">Hora Final:</label>
								<div>
									<div class="input-group bootstrap-timepicker timepicker">
										<input id="timepicker2" type="text" class="form-control input-small" readonly>
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-time"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-1  col-lg-7">
							<h4>Seleccione los días</h4>
							<div class="row">
								<div class="col-lg-6">
									<div class=" form-group">
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox1" name="checkbox1">
											<label for="checkbox1"> Lunes </label>
										</div>
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox2" name="checkbox2">
											<label for="checkbox2"> Martes </label>
										</div>
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox3" name="checkbox3">
											<label for="checkbox3"> Miercoles </label>
										</div>
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox4" name="checkbox4">
											<label for="checkbox4"> Jueves </label>
										</div>

									</div>
								</div>
								<div class="col-lg-6">
									<div class=" form-group">

										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox5" name="checkbox5">
											<label for="checkbox5"> Viernes </label>
										</div>
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox6" name="checkbox6">
											<label for="checkbox6"> Sabado </label>
										</div>
										<div class="checkbox checkbox-primary">
											<input type="checkbox" id="checkbox7" name="checkbox7">
											<label for="checkbox7"> Domingo </label>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						
					</div>
					<div class="row text-right">
						<div class="form-group">
							<div class="col-sm-11">
								<a class="btn btn-default" href="alumnos">Cancelar</a>
								<button id="btnGuardar" class="btn btn-success" type="submit">Guardar</button>
							</div>
						</div>
					</div>	
					<div class="row ">
						<br>
						<h4>Problemas de cruce de horario</h4>
						<div class="col-sm-12">
							<table id="table_errores" class="table table-border">
								<tbody>
									<tr>
										<td>Curso</td>
										<td>Dia</td>
										<td>Hora Inicio</td>
										<td>Hora Fin</td>
								    </tr>
								</tbody>
							</table>
						</div>						
					</div>	
					
				</form>
			</div>
			<div class="col-lg-8">
				<h2>Horario de Cursos</h2>
				<div id='calendar'></div>
			</div>

		</div>


		<!-- /.row -->
		<script type="text/javascript">
			$(document).ready(function() {

				

				cargarHorario();
				$('#timepicker1').timepicker({
					minuteStep: 5,
					showMeridian: false
				});

				$('#timepicker2').timepicker({
					minuteStep: 5,
					showMeridian: false
				});



				$('#horariosForm').bootstrapValidator({
					message: 'no esta validando',
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
					}
				}).on('success.form.bv', function (e) {

					e.preventDefault();


					var $form = $(e.target);


					var bv = $form.data('bootstrapValidator');


					$.post($form.attr('action'), $form.serialize(), function (result) {
						$('#calendar').fullCalendar( 'destroy' ); 
						cargarHorario();
						var time=1;
						
						for (var item in result.data.horarios) {
							console.log("agregar error");
							var fila = '<tr><td>'+result.data.horarios[item].curso+'</td><td>'+result.data.horarios[item].dia+'</td><td>'+result.data.horarios[item].inicio+'</td><td>'+result.data.horarios[item].fin+'</td></tr>';
							console.log(item+" - "+fila);
							setTimeout((function (texto) {		
								console.log(" & "+texto);
								$('#table_errores tbody').append(texto);
							})(fila), (time * 800), "JavaScript");
							time++;
						}
					}, 'json');
				});

			});
			function cargarHorario(){
				$.get("getHorarios", {}, function (datas) {
					console.log('uactualizar');
					$('#calendar').fullCalendar({
						header: {
							left: '',
							center: '',
							right: ''
						},
						defaultDate: '1990-01-01',
						defaultView: 'agendaWeek',
						locale: 'es',
						editable: false,
						events: datas.data.horarios
					});

				}, 'json');
			}
		</script>
	</div>
	<!-- /.container-fluid -->

</div>



				<!-- /#page-wrapper -->