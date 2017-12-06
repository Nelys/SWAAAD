<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<style>
.xicon {
      margin-top: 0px;
      position: absolute;
      margin-left: 0px;
      font: 15px bold;
      color: #FFF;
      font: message-box;
      text-decoration: none;
  }
/*   .xicon:hover { */
/*       background-color: #fff; */
/*       color: #000; */
/*       width: 5px; */
/*       height: 5px; */
/*       text-align: center; */
/*   } */
</style>
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
			<div class="col-sm-12">
				<button id="btnFormula" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm" type="button" ><i class="fa fa-plus"></i> Agregar Alumnos</button>
<!-- 				<a class="btn btn-success" href="newActividadPedagogica"><i class="fa fa-plus"></i> Agregar Alumnos</a> -->
				<a id="btnImprimir" class="btn btn-default pull-right" href="#"><i class="fa fa-print"></i> Imprimir</a>
			</div>

			<div class="col-sm-1 pull-right" >
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a> -->
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i> Excel</a> -->
				

			</div>
		</div>
		<br>
<!-- Contenido Aula Modal -->
				<div id="modalSistema" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Agregar Alumnos</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div id="divEvaluaciones" class="col-sm-7">
										<div class="panel panel-default">
											<div class="panel-heading">Lista de Alumnos</div>
											<div class="panel-body">
												<div id="external-events"
													style="height: 180px; overflow-y: scroll;">
													<c:forEach var="listaAlumnos" items="${listAlumnos}">
														<button
															id="btnIdAlumno_${listaAlumnos.idCursoAlumno}"
															class="btn btn-default"
															style="text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;" 
																			style="background-color:${listaEvaluacion.color}; color:${listaEvaluacion.colorTexto};text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;">
															${listaAlumnos.alumno.apellidos}, ${listaAlumnos.alumno.nombres}
														</button>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-5">
										<div class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-sm-2" for="pwd">Alumno:</label>
												<div class="col-sm-12">
													<div id="divFormula" class="form-control"
														style="border-radius: 4px 4px 4px 4px; height: 40px; border: 1px solid #9c9c9c; width: 100%; overflow-x: auto; white-space: nowrap; resize: none; font-size: 26px;">
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4" for="pwd">Color de Fondo:</label>
												<div class="col-sm-8">
													<div id="divColorFondo" class="input-group colorpicker-component">
														<input id="color" name="color" class="form-control"
															value='<c:out value="${evaluacion.color}"></c:out>'
															readonly="readonly" required> <span
															class="input-group-addon"><i></i></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4" for="pwd">Color de Letra:</label>
												<div class="col-sm-8">
													<div id="divColorTexto" class="input-group colorpicker-component">
														<input id="colorTexto" name="colorTexto" class="form-control"
															value='<c:out value="${evaluacion.colorTexto}"></c:out>'
															readonly="readonly"> <span class="input-group-addon"><i></i></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-4 col-sm-offset-4">
													<button id="btnNota" class="btn btn-success" style="float: none; margin: 0 auto;" >Agregar</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="modal-footer">
<!-- 								<button type="button" class="btn btn-default pull-left" -->
<!-- 									data-dismiss="modal">Cancelar</button> -->
								<button id="btnNota" class="btn btn-default pull-left"
									data-dismiss="modal">Salir</button>
							</div>
						</div>
					</div>
				</div>
				<!-- / Contenido Modal -->


		<!-- Resgistros de la tabla -->
		<div id="identificador" style="display: none;">hola</div>
		<div id="coordenadas" style="display: none;">hola</div>

		<form:form action="saveAulaDinamica"  style="display: none;" method="post"
			modelAttribute="aulaDinamica">
			<form:input path="idAulaDinamica" />
<%-- 			<form:input path="idAlumno" /> --%>
			<form:input path="cursoAlumno.idCursoAlumno" id="idCursoAlumno" />
			<form:input path="coordX" />
			<form:input path="coordY" />
			<form:input path="colorFondo" />
			<form:input path="colorTexto" />
			<form:input path="estado" />
			<button type="submit" style="display: none;">Guardar</button>
		</form:form>
		<div id="aulaBox" class="row">
			<div id="aula" class="col-lg-12"
				style="border: 1px black solid; height: 400px; position: relative;">
				<c:forEach var="lista" items="${listAulaDinamica}">
					<div id="alumno_${lista.idAulaDinamica}" class="principal"
						style="left:${lista.coordX}px; top:${lista.coordY}px; width:60px; height:85px; background:#${lista.colorFondo}; position: absolute; border-radius: 4px 4px 4px 4px">
						<!-- Datos del Alumno -->
<%-- 						<div id="idAulaDinamica" style="display: none;">${lista.cursoAlumno.idCursoAlumno}</div> --%>
						<a style="left: 50px; top: -1px; color: ${lista.idAulaDinamica};" href='#' class='xicon' title='Quitar'>&times;</a>
						<div id="${lista.idAulaDinamica}" style='color:#${lista.colorTexto}; text-align: center; font-size: 12px;'>${lista.idAulaDinamica}</div>
						<div id="${lista.idAulaDinamica}" style='color:#${lista.colorTexto}; text-align: center; font-size: 12px;'>${lista.cursoAlumno.alumno.nombres}, ${lista.cursoAlumno.alumno.apellidos}</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<script type="text/JavaScript">
		
			$(function() {
			    $('#divColorFondo').colorpicker({
			        format: "hex",
			        colorSelectors: {
		                'black': '#000000',
		                'white': '#ffffff',
		                'red': '#FF0000',
		                'default': '#777777',
		                'primary': '#337ab7',
		                'success': '#5cb85c',
		                'info': '#5bc0de',
		                'warning': '#f0ad4e',
		                'danger': '#d9534f'
		            }
			    });
			    
			    $('#divColorTexto').colorpicker({
			        format: "hex",
			        colorSelectors: {
		                'black': '#000000',
		                'white': '#ffffff',
		                'red': '#FF0000',
		                'default': '#777777',
		                'primary': '#337ab7',
		                'success': '#5cb85c',
		                'info': '#5bc0de',
		                'warning': '#f0ad4e',
		                'danger': '#d9534f'
		            }
			    });
			    
			    
			});
			
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
// 				color = parts.join('');
				return parts.join('');
			}

			$(document).ready(
					function() {

						var id;
						
						$('#btnImprimir').click(function() {
// 							var myStyle = '<link rel="stylesheet" href="http://mysite.com/mystyle.css" />';
							
							var myStyle = '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" /> ';
							var myStyle2 = "<style>.xicon {  margin-top: 0px; position: absolute;  margin-left: 0px; font: 15px bold; color: #FFF; font: message-box; text-decoration: none; } </style>";
							var w=window.open(null, 'Print_Page', 'scrollbars=yes');        
						    w.document.write(myStyle + myStyle2 + $('#aulaBox').html());
						    w.document.close();
						    w.print();
						});

						/**
						 * Funcion click del boton Aceptar de la pagina modal para guardar nota
						 */
						$('#divEvaluaciones button').click(function() {
							var idAlumno = $(this).attr('id');
							var iColor =  $('#' + idAlumno ).css('background-color');
// 							console.log(idAlumno);
// 							console.log(hexc(iColor));
// 							console.log($(this).html());
							
							$('#' + idAlumno ).toggle("slide");
							
							idAlumno = idAlumno.replace('btnIdAlumno_', '');
							console.log(idAlumno);
							
							
							var colorTexto= hexc($('#divColorTexto i' ).css('background-color'));
							var colorFondo= hexc($('#divColorFondo i').css('background-color'));
							 console.log(colorTexto);
							 console.log(colorFondo);
							 
							
							$( '#aula' ).html($( '#aula' ).html() + 
									"<div " + "id='alumno_" +  idAlumno + "' class='principal ui-draggable ui-draggable-handle' " +
										"style='left:5px; top:5px; width:60px; height:85px; background:#" + colorFondo + "; color:#"+colorTexto+"; position: absolute; border-radius: 4px 4px 4px 4px' >" +
										"<div style='color: #"+colorTexto+"; text-align: center; font-size: 12px;'>" + idAlumno + "</div>" + 
										"<div style='color:#"+colorTexto+"; text-align: center; font-size: 12px;'>" + $(this).html() + "</div>" +
									"</div>");
							
// 							console.log($( '#aula' ).html());
							
							
							
							
							
							
							// Estableciendo propiedades
							
							$('#idAulaDinamica').val(0);
							$('#cursoAlumno.idCursoAlumno').val(idAlumno);
							$('#coordX').val(5);
							$('#coordY').val(5);
							$('#colorFondo').val(hexc(iColor));
					
							var datos={
								idAulaDinamica:0,
								cursoAlumno:idAlumno,
								coordX:5,
								coordY:5,
								colorFondo:colorFondo,
								colorTexto:colorTexto
							};
							
							// Guardando Datos
							var formulario = $("#aulaDinamica").serialize();

							id = null;
							$.post("saveAulaDinamica2",datos, function(data) {
								console.log("recepcion");
							});
							
						});
						
						$('div.principal').mousedown(
								function() {
									id = $(this).attr('id');

									$('#idAulaDinamica').val(
											id.replace('alumno_', ''));
									$('#identificador').text(id);

									color = hexc($('#' + id).css("backgroundColor"));

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