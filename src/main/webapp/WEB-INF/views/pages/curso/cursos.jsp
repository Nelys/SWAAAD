<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<!-- Opcion de la tabla -->
		<br> <br>
		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">
				<div class="table-responsive">
					<table id="miTable"
						class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Curso</th>
								<th>Institucion</th>
								<th>Grado</th>
								<th>Seccion</th>
								<th>Año</th>
								<th>Seleccion</th>
								<th>ACCION</th>
							</tr>
						</thead>
						<c:if test="${!empty listCursos}">
							<tbody>
								<c:forEach var="lista" items="${listCursos}">
									<tr>
										<td>${lista.idCurso}</td>
										<td>${lista.nombreCurso}</td>
										<td>${lista.institucion}</td>
										<td>${lista.grado}</td>
										<td>${lista.seccion}</td>
										<td>${lista.anio}</td>
										<td style="text-align: center" width="100px"><a
											class="btn btn-sm btn-primary btn-sm"
											href="selectCurso?id=${lista.idCurso}"><i
												class="fa fa-eye"></i> Seleccionar</a></td>

										<td style="text-align: center" width="100px"><a
											class="btn btn-sm btn-warning btn-sm"
											href="editCurso?id=${lista.idCurso}"><i
											
												class="fa fa-pencil-square-o"></i></a> <a
											class="btn btn-sm btn-danger btn-sm"
											href="deleteCurso?id=${lista.idCurso}"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<!-- /.row -->
		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								var table = $('#miTable')
										.DataTable(
												{

													"language" : {
														"emplyTable" : "No hay datos disponible en la tabla.",
														"lengthMenu" : "Mostrar _MENU_ registros",
														"info" : "Pagina _PAGE_ de _PAGES_",
														"infoEmpty" : "No hay registros disponibles.",
														"infoFiltered" : "(Busqueda de _MAX_ Registros)",
														"loadingRecords" : "Cargando...",
														"processing" : "Prosesando...",
														"search" : "Buscar:",
														"zeroRecords" : "No hay registros de busqueda.",
														"paginate" : {
															"previous" : "Anterior",
															"next" : "Siguiente"
														}
													},
													dom : 'Bfrtip',
													buttons : [
															{
																text : '<i class="fa fa-plus"></i> Nuevo',
																action : function(
																		e, dt,
																		node,
																		config) {
																	window.location.href = 'newCurso';
																}
															},
															{
																extend : 'excelHtml5',
																text : '<i class="fa fa-file-excel-o"></i> Excel',
																titleAttr : 'Excel',
																exportOptions : {
																	columns : [
																			0,
																			1,
																			2,
																			3,
																			4,
																			5 ]
																}
															},
															{
																extend : 'pdfHtml5',
																text : '<i class="fa fa-file-pdf-o"></i> PDF',
																titleAttr : 'PDF',
																exportOptions : {
																	columns : [
																			0,
																			1,
																			2,
																			3,
																			4,
																			5 ]
																}
															},
															{
																extend : 'print',
																text : '<i class="fa fa-print"></i> Print',
																titleAttr : 'print',
																exportOptions : {
																	columns : [
																			0,
																			1,
																			2,
																			3,
																			4,
																			5 ]
																}
															},
															{
																text : '<i class="fa fa-print"></i> Imprimir',
																action : function(
																		e, dt,
																		node,
																		config) {
																	window.location.href = '#';
																}
															} ]
												});

								$('#miTable_wrapper a:eq(0)').removeClass(
										"btn-default").addClass("btn-success");
								$('#miTable_wrapper a:eq(1)').removeClass(
										"btn-default").addClass("btn-primary");
								$('#miTable_wrapper a:eq(2)').removeClass(
										"btn-default").addClass("btn-primary");

								$("#miTable_wrapper a:eq(0)").css({
									"margin-right" : "4px"
								});
								$("#miTable_wrapper a:eq(1)").css({
									"margin-right" : "4px"
								});
								$("#miTable_wrapper a:eq(2)").css({
									"margin-right" : "4px"
								});
								$("#miTable_wrapper a:eq(3)").css({
									"margin-right" : "4px"
								});
							});
		</script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->