<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<h2>Asistencia Alumnos</h2>
			</div>
		</div>

		<!-- Opcion de la tabla -->

		<div class='row'>
			<div class="col-md-4 col-lg-3">
				<button class="btn btn-success" href="newAsistencia"
					data-toggle="modal" data-target="#myModal">
					<i class="fa fa-plus"></i> Nuevo
				</button>
			</div>

		

			<div class="col-lg-4 text-right">
				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i>
					PDF</a> <a class="btn btn-primary" href="#"><i
					class="fa fa-file-excel-o"></i> Excel</a> <a class="btn btn-default"
					href="#"><i class="fa fa-print"></i> Imprimir</a>

			</div>

			<div class="col-md-4 form-horizontal">
				<div class="form-group">
					<label class="col-sm-1 control-label" >Mes</label>
					<div class="col-sm-4">
						<select class="form-control" id="cbxMeses">
							<option value="1">Enero</option>
							<option value="2">Febrero</option>
							<option value="3">Marzo</option>
							<option value="4">Abril</option>
							<option value="5">Mayo</option>
							<option value="6">Junio</option>
							<option value="7">Julio</option>
							<option value="8">Agosto</option>
							<option value="9">Septiembre</option>
							<option value="10">Octubre</option>
							<option value="11">Noviembre</option>
							<option value="12">Diciembre</option>
						</select>
					</div>
				</div>
			</div>

		</div>
		<br> <br> <br>

		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table id="table" class="table table-bordered table-hover table-striped">
							<tr>
								<th>No</th>
								<th>Alumno</th>
								<c:forEach var="listaDia" items="${listarDiasMes}">
									<th>${listaDia}</th>
								</c:forEach>
								<th>Accion</th>
							</tr>

							<!-- ListaAlumnos -->
							<c:forEach var="lista" items="${listAlumnos}">
								<tr id="${lista.idCursoAlumno}" class="tdAsistencia">
									<td>${lista.alumno.nroOrden}</td>
									<td>${lista.alumno.nombres},${lista.alumno.apellidos}</td>

									<!-- 						ListEstados				 -->
									<c:forEach var="listaEstado" items="${listaEstadoPorCurso}">
										<fmt:formatDate var="dia" value="${listaEstado.fecha}"
											pattern="dd" />
										<c:if
											test="${lista.alumno.idAlumno==listaEstado.cursoAlumno.alumno.idAlumno}">


											<c:forEach var="listaDia" items="${listarDiasMes}">

												<c:if test="${listaDia == dia}">

													<td>${listaEstado.estado}</td>

												</c:if>

											</c:forEach>
										</c:if>
									</c:forEach>

									<!-- fin estado-->
									<td style="" width="100px"><select
										onchange="enviarAsistencia(this,${lista.idCursoAlumno})">
											<option value="A">Asistio
											<option value="F">Falta
											<option value="T">Tarde
											<option value="FJ">Falta Justificada
											<option value="TJ">Tardanza Justificada
									</select></td>
								</tr>

							</c:forEach>

						</table>
					</c:if>
				</div>

			</div>
		</div>
		<!-- /.row -->

	</div>

</div>

<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Nueva Asistencia</h4>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label for="text">Fecha</label>
					<div class="input-group">
						<input type="date" class="form-control" id="fecha">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-default" id="guardarAsistencia">Guardar</button>

			</div>
		</div>

	</div>
</div>


<script type="text/javascript">
	
// 	$(document).on("click", "#table .tdAsistencia", function(e) {
		// Obteniendo el id del elemento td
// 		var id = $(".tdAsistencia").attr('id');
	
	
	
	$("#cbxMeses").change(function(){

// 		console.log($("#cbxMeses").val());
// 		alert("cambio  "+$(this).val());
// 		var numeroMes=$(this.val());
// 		console.log($(".tdAsistencia").attr('id'));
		enviarAsistencia($(this.val()), $(".tdAsistencia").attr('id'));
	});

	function enviarAsistencia(obj, idCursoAlumno) {

		var tipoAsistencias = $(obj).val();
		var AlumnoCurso = idCursoAlumno;

		$.ajax({
// 			type : "GET",
// 			dataType : "json",
			url : '${pageContext.request.contextPath}/guardarAsistenciaAlumno',
			data : {
				tipo : tipoAsistencias,
				idAlumnoCurso : AlumnoCurso
			}
		}).done(function(data, textStatus, jqXHR) {
			if (console && console.log) {
				console.log("La solicitud se ha completado correctamente. ");
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			if (console && console.log) {
				console.log("La solicitud a fallado: " + textStatus);
			}

		});
	}
	
</script>
<!-- /#page-wrapper -->