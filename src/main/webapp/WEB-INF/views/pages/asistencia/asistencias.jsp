<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>


<!-- Opcion de la tabla -->

<div class='row'>
	<div class="col-md-4 col-lg-3">
		<button class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
			<i class="fa fa-plus"></i> Ir Asistencia
		</button>


	</div>
	<div class="col-lg-4 text-right">
		<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a> <a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i>
			Excel</a> <a class="btn btn-default" href="#"><i class="fa fa-print"></i> Imprimir</a>
	</div>

	<div class="col-md-4 form-horizontal">
		<div class="form-group">
			<label class="col-sm-3 control-label">Mes :</label>
			<div class="col-sm-5">
				<select class="form-control" id="cbxMeses">
					<option value="1" ${mes_actual=='1'?'selected="selected"':''}>Enero</option>
					<option value="2" ${mes_actual=='2'?'selected="selected"':''}>Febrero</option>
					<option value="3" ${mes_actual=='3'?'selected="selected"':''}>Marzo</option>
					<option value="4" ${mes_actual=='4'?'selected="selected"':''}>Abril</option>
					<option value="5" ${mes_actual=='5'?'selected="selected"':''}>Mayo</option>
					<option value="6" ${mes_actual=='6'?'selected="selected"':''}>Junio</option>
					<option value="7" ${mes_actual=='7'?'selected="selected"':''}>Julio</option>
					<option value="8" ${mes_actual=='8'?'selected="selected"':''}>Agosto</option>
					<option value="9" ${mes_actual=='9'?'selected="selected"':''}>Septiembre</option>
					<option value="10" ${mes_actual=='10'?'selected="selected"':''}>Octubre</option>
					<option value="11" ${mes_actual=='11'?'selected="selected"':''}>Noviembre</option>
					<option value="12" ${mes_actual=='12'?'selected="selected"':''}>Diciembre</option>
				</select>
			</div>
		</div>
	</div>

</div>

<!-- Resgistros de la tabla -->
<div class="row gutter">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="panel panel-light">
			<div class="panel-heading">
				<h4>Scroll Table</h4>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table id="miTable" class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>No</th>
									<th>Alumno</th>
									<c:forEach var="listaDia" items="${listarDiasMes}">
										<th>${listaDia}</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<!-- ListaAlumnos -->
								<c:forEach var="lista" items="${listAlumnos}">
									<tr>
										<td>${lista.alumno.nroOrden}</td>
										<td>${lista.alumno.apellidos},${lista.alumno.nombres}</td>
										<c:forEach var="listaEstado" items="${listaEstadoPorCurso}">
											<fmt:formatDate var="dia" value="${listaEstado.fecha}" pattern="dd" />
											<%-- 											<td>${listaEstado.fecha}</td> --%>
											<c:if test="${lista.alumno.idAlumno==listaEstado.cursoAlumno.alumno.idAlumno}">
												<c:forEach var="listaDia" items="${listarDiasMes}">
													<c:if test="${listaDia == dia}">
														<td>${listaEstado.estado}</td>
													</c:if>

												</c:forEach>
											</c:if>
										</c:forEach>
										<!-- fin estado-->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Seleccionar Fecha de Asistencia</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="form-group ">
					<label class="control-label">Fecha</label>
					<div class="input-group ">
						<span class="input-group-addon "> <i class="fa fa-calendar"> </i>
						</span> <input id="txtFecha" name="txtFecha" class="form-control datepicker" type="text">
					</div>
				</div>


			</div>
			<div class="modal-footer">
				<button id="btnNuevo" type="button" class="btn btn-primary">Cargar DAtos</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="mensajeModal" tabindex="-1" role="dialog" aria-labelledby="mensajeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="mensajeModalLabel">Asistencia</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<a class="btn btn-success" id="linkEnvio" href="">Ir a registro</a>
			</div>

		</div>
	</div>
</div>




<script type="text/javascript">
	$(document).ready(function() {

		$('#miTable').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
		});
		$('.datepicker').datepicker({
			format : 'dd-mm-yyyy',
			language : 'es',
			todayBtn : "linked",
			keyboardNavigation : true,
			forceParse : false,
			calendarWeeks : false,
			autoclose : true
		}).datepicker("setDate", new Date());

	});

	$('#btnNuevo')
			.click(
					function() {

						$('#exampleModal').modal('hide');

						$
								.get(
										"${pageContext.request.contextPath}/asistencias/generarAsistencia/${idCurso}/"
												+ $("#txtFecha").val() + "", {})
								.done(
										function(data) {
											$('#mensajeModal').modal('show');
											var fecha = $('.datepicker').val();
											$('#linkEnvio')
													.attr(
															'href',
															"${pageContext.request.contextPath}/asistencias/registrarAsistencia/${idCurso}/"
																	+ fecha);

										});
					});

	$("#cbxMeses").change(function() {
		location.href = "?mes=" + $("#cbxMeses").val();
	});
</script>
