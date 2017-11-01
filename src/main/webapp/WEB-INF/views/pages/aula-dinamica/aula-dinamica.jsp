<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>


<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
<!-- 		<div class='row'> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<h2>Aula</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- Opcion de la tabla -->
		<div class='row'>
			<div class="col-md-2">
				<button id="btnFormula" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm" type="button" ><i class="fa fa-plus"></i> Agregar Alumnos</button>
<!-- 				<a class="btn btn-success" href="newActividadPedagogica"><i class="fa fa-plus"></i> Agregar Alumnos</a> -->
			</div>

			<div class="col-md-3">
<!-- 				<a class="btn btn-default" href="newActividadPedagogica"><i class="fa fa-upload"></i> Importar</a> -->
				<div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-primary">
				    <input type="radio" name="options" id="option2" autocomplete="off"> Aleatorio
				  </label>
				  <label class="btn btn-primary">
				    <input type="radio" name="options" id="option3" autocomplete="off"> Afinidad
				  </label>
				</div>
				<div class="dropdown">
				  <button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    Dropdown trigger
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dLabel">
				    ...
				  </ul>
				</div>
			</div>

			<div class="col-lg-3 text-right" >
				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a>
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i> Excel</a> -->
				<a class="btn btn-default" href="#"><i class="fa fa-print"></i> Imprimir</a>

			</div>
		</div>
		<br>
<!-- Contenido Aula Modal -->
				<div id="modalSistema" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Agregar Alumnos</h4>
							</div>
							<div class="modal-body">
<!-- 								<div class="container-fluid"> -->
<!-- 									<div class="row form-group text-center"> -->
<!-- 										<div id="divFormula" -->
<!-- 											style="border-radius: 4px 4px 4px 4px; height: 70px; border: 1px solid #9c9c9c; width: 100%; overflow-x: auto; white-space: nowrap; resize: none; font-size: 26px;"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="row">
									<div id="divEvaluaciones" class="col-sm-12" style="overflow-y: scroll;">
<!-- 										<div class="panel panel-default"> -->
<!-- 											<div class="panel-heading">Alumnos</div> -->
<!-- 											<div class="panel-body"> -->
<!-- 												<div id="external-events" -->
<!-- 													style="height: 180px; overflow-y: scroll;"> -->
													<c:forEach var="listaAlumnos"
														items="${listAlumnos}">
														<button
															id="btnIdAlumno_${listaAlumnos.idAlumno}"
															class="btn btn-default"
															style="text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;">
<%-- 															style="background-color:${listaEvaluacion.color}; color:${listaEvaluacion.colorTexto};text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;"> --%>
															${listaAlumnos.apellidos}, ${listaAlumnos.nombres}
														</button>
													</c:forEach>
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left"
									data-dismiss="modal">Cancelar</button>
								<button id="btnNota" class="btn btn-success"
									data-dismiss="modal">Aceptar</button>
							</div>
						</div>
					</div>
				</div>
				<!-- / Contenido Modal -->


		<!-- Resgistros de la tabla -->
		<div id="identificador" style="display: none;">hola</div>
		<div id="coordenadas" style="display: none;">hola</div>

		<form:form action="saveAulaDinamica" method="post"
			modelAttribute="aulaDinamica">
			<form:input path="idAulaDinamica" />
<%-- 			<form:input path="cursoAlumno.idCursoAlumno" /> --%>
			<form:input path="coordX" />
			<form:input path="coordY" />
			<form:input path="colorFondo" />
			<form:input path="colorTexto" />
			<form:input path="estado" />
			<button type="submit" style="display: none;">Guardar</button>
		</form:form>
		<div class="row">
			<div id="aula" class="col-lg-12"
				style="border: 1px black solid; height: 400px; position: relative;">
				<c:forEach var="lista" items="${listAulaDinamica}">
					<div id="alumno_${lista.idAulaDinamica}" class="principal"
						style="left:${lista.coordX}px; top:${lista.coordY}px; width:60px; height:80px; background:#${lista.colorFondo}; position: absolute; border-radius: 4px 4px 4px 4px">
						<!-- Datos del Alumno -->
<%-- 						<div id="idAulaDinamica" style="display: none;">${lista.cursoAlumno.idCursoAlumno}</div> --%>
						<div id="idAula" style="color: white; text-align: center; font-size: 100%;">${lista.idAulaDinamica}</div>
						<div style="color: white; text-align: center; font-size: 100%;">${lista.cursoAlumno.alumno.nombres}, ${lista.cursoAlumno.alumno.apellidos}</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<script type="text/JavaScript">
			$(function() {
				$("#aula div.principal").draggable({
					stack : "#aula div",
					containment : "#aula"
				});
			});

			var color;
			function hexc(colorval) {
				var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
				delete (parts[0]);
				for (var i = 1; i <= 3; ++i) {
					parts[i] = parseInt(parts[i]).toString(16);
					if (parts[i].length == 1)
						parts[i] = '0' + parts[i];
				}
				color = parts.join('');
			}

			$(document).ready(
					function() {

						var id;

						$('div.principal').mousedown(
								function() {
									id = $(this).attr('id');

									$('#idAulaDinamica').val(
											id.replace('alumno_', ''));
									$('#identificador').text(id);

									hexc($('#' + id).css("backgroundColor"));

									$('#colorFondo').val(color);
									$('#cursoAlumno.idCursoAlumno').val($('#idAula').text());
									console.log($( '#idAula' ).text());
								});

						$('#aula').mousemove(
								function(event) {
									if (id != null) {
										var p = $('#' + id);
										var position = p.position();
										$('#coordX').val(position.left);
										$('#coordY').val(position.top);

										$('#coordenadas').text(
												"left: " + position.left
														+ ", top: "
														+ position.top);
									}
								});

// 						$('#aulaDinamica').submit(function(event) {
// 							console.log("enviara y dentendra");
// 							// 							event.preventDefault();
// 						});
						$('div.principal').mouseup(function() {
														console.log("ssss");
							var formulario = $("#aulaDinamica").serialize();

							id = null;
							$.post("saveAulaDinamica2",formulario, function(data) {
								console.log("recepcion");
// 								console.log(data);
							});

						});

					});
		</script>
		<p></p>
		<!-- Resgistros de la tabla -->
		<div class="row" style="display: none;">
<!-- 		<div class="row"> -->
			<div class="col-lg-12">

				<div class="table-responsive">
					<c:if test="${!empty listAulaDinamica}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>ID</th>
								<!-- 								<th>Curso</th> -->
								<th>Fila</th>
								<th>Columna</th>
								<th>Color</th>
								<th>ACCION</th>
							</tr>
							<c:forEach var="lista" items="${listAulaDinamica}">
								<tr>
									<td>${lista.idAulaDinamica}</td>
									<%-- 									<td>${lista.curso}</td> --%>
									<td>${lista.coordX}</td>
									<td>${lista.coordY}</td>
									<td>${lista.colorFondo}</td>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="editAlumno?id=${lista.idAulaDinamica}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="deleteAlumno?id=${lista.idAulaDinamica}"><i
											class="fa fa-trash-o"></i></a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->