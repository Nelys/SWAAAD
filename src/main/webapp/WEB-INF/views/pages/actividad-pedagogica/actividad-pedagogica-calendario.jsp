<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<style>

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>

<!-- <div id="page-wrapper"> -->

<!-- 	<div class="container-fluid"> -->

		<!-- Opcion de la tabla -->

		<div class='row'>
			<div class="col-md-12">
				<a class="btn btn-success" href="newActividadPedagogica"><i class="fa fa-plus"></i> Nuevo</a>
				<a class="btn btn-default" href="actividades-pedagogicas"><i class="fa fa-list"></i> Listado</a>
				<button id="btnImprimir" class="btn btn-default pull-right"><i class="fa fa-print"></i> Imprimir</button>
			</div>
			
<!-- 			<div class="col-md-4"> -->
<!-- 				<button type="button" class="btn btn-info btn-lg" -->
<!-- 					data-toggle="modal" data-target="#myModal">Open Modal</button> -->
<!-- 			</div> -->

<!-- 			<div class="col-lg-4 text-right"> -->
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> -->
<!-- 					PDF</a> <a class="btn btn-primary" href="#"><i -->
<!-- 					class="fa fa-file-excel-o"></i> Excel</a> <a class="btn btn-default" -->
<!-- 					href="#"><i class="fa fa-print"></i> Imprimir</a> -->

<!-- 			</div> -->
<!-- 			<div class="col-md-3"> -->
<!-- 				<div class="input-group"> -->
<!-- 					<span class="input-group-addon" id="sizing-addon2"><i -->
<!-- 						class="fa fa-search"></i></span> <input type="text" class="form-control" -->
<!-- 						placeholder="Buscar ..." aria-describedby="sizing-addon2"> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<br>
		<div class='row'>
			<div id="calendarBox" class="col-md-12">
				<div id='calendar'></div>
			</div>
		</div>

		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">

				<div class="table-responsive">
					<c:if test="${!empty listActividadPedagogica}">
						<table id="miTable" class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<!-- 								<th>Curso</th> -->
								<th>Fecha</th>
								<th>Descripción</th>
								<!-- 								<th>Recordar</th> -->
								<th>ACCION</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lista" items="${listActividadPedagogica}">
								<tr>
									<td>${lista.idActividad}</td>
									<%-- 									<td>${lista.curso}</td> --%>
									<td>${lista.fecha}</td>
									<td>${lista.descripcion}</td>
									<%-- 									<td>${lista.recordar}</td> --%>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="editActividadPedagogica?id=${lista.idActividad}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="deleteAlumno?id=${lista.idActividad}"><i
											class="fa fa-trash-o"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
					</c:if>
				</div>
				<!-- /.container-fluid -->

			</div>
		</div>

		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						<form:form action="saveActividadPedagogica" method="post"
							modelAttribute="actividadPedagogica" cssClass="form-horizontal">
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

						</form:form>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default" href="actividades-pedagogicas">Cancelar</a>
						<button type="button" class="btn btn-default"
							id="guardarFormulario">Close</button>
					</div>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="result"></div>
		</div>
<!-- 	</div> -->
<!-- </div> -->
		
		
		<script type="text/javascript">
		
		// Calendar
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2017-10-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'Combate de Angamos',
					start: '2017-10-08',
// 			        className : 'danger-bg',
				},
				{
					id: 999,
					title: 'Matematicas',
					start: '2017-10-09T16:00:00',
// 					className : 'warning-bg',
				},
				{
					id: 999,
					title: 'Examen Parcial',
					start: '2017-10-16T16:00:00',
// 					className : 'success-bg',
				},
				{
					title: 'Aritmetica',
					start: '2017-10-12T10:30:00',
					end: '2017-10-12T12:30:00',
// 					className : 'warning-bg',
				},
				{
					title: 'Reunion',
					start: '2017-10-12T12:00:00'
				},
				{
					title: 'Matematicas',
					start: '2017-10-12T14:30:00',
// 					className : 'warning-bg',
				},
				{
					title: 'Trabajo Grupal',
					start: '2017-10-12T17:30:00'
				},
				{
					title: 'Geometria',
					start: '2017-10-13T07:00:00',
// 					className : 'warning-bg',
				},
				{
					title: 'Matematicas',
					start: '2017-10-28',
// 					className : 'warning-bg',
				}
			]
		});
		

		
		// Datatable
			
			$("#guardarFormulario")
					.click(
							function() {
								$
										.post(
												"${pageContext.request.contextPath}/asistencias/ejemploPost",$( "#actividadPedagogica" ).serialize(),
												function(data) {
													alert(data.data['alumno'].apellidos);
												});
							});
			
			$(document).ready(function() {
				
				$('#btnImprimir').click(function() {
					
					var myStyle = ''
						+ '<link href=<c:url value="/resources/template/css/bootstrap.min.css" /> rel="stylesheet" > '
						+ '<link href=<c:url value="/resources/template/css/calendar/fullcalendar.css" /> rel="stylesheet" /> '
						;
					var w=window.open(null, 'Print_Page', 'scrollbars=yes');        
				    w.document.write(myStyle + '<div style="width: 800px;" >' + $('#calendarBox').html() + '</div>' );
				    w.document.close();
				    w.print();
				});
				
				var table = $('#miTable').DataTable( {

					"language": {
		                "emplyTable":"No hay datos disponible en la tabla.",
		                "lengthMenu": "Mostrar _MENU_ registros",
		                "info": "Pagina _PAGE_ de _PAGES_",
		                "infoEmpty": "No hay registros disponibles.",
		                "infoFiltered": "(Busqueda de _MAX_ Registros)",
		                "loadingRecords": "Cargando...",
		                "processing": "Prosesando...",
		                "search": "Buscar:",
		                "zeroRecords": "No hay registros de busqueda.",
		                "paginate": {
		                    "previous":"Anterior",
		                    "next":"Siguiente"
		                }
		            },
					dom: 'Bfrtip',
			        buttons: [
			        	{
			        		text: '<i class="fa fa-plus"></i> Nuevo',
			                action: function ( e, dt, node, config ) {
								window.location.href = 'newActividadPedagogica';
			                }
			            },
			            {
			                extend:    'excelHtml5',
			                text:      '<i class="fa fa-file-excel-o"></i> Excel',
			                titleAttr: 'Excel',
			                exportOptions: {
			                    columns: [ 0, 1, 2 ]
			                }
			            },
			            {
			                extend:    'pdfHtml5',
			                text:      '<i class="fa fa-file-pdf-o"></i> PDF',
			                titleAttr: 'PDF',
			                exportOptions: {
			                	columns: [ 0, 1, 2 ]
			                }
			            },
			            {
			                extend:    'print',
			                text:      '<i class="fa fa-print"></i> Print',
			                titleAttr: 'print',
			                exportOptions: {
			                	columns: [ 0, 1, 2 ]
			                }
			            },
						{
			        		text: '<i class="fa fa-print"></i> Imprimir',
			                action: function ( e, dt, node, config ) {
								window.location.href = '#';
			                }
			            }
					]
			    } );
				
				$('#miTable_wrapper a:eq(0)').removeClass("btn-default").addClass("btn-success");
				$('#miTable_wrapper a:eq(1)').removeClass("btn-default").addClass("btn-primary");
				$('#miTable_wrapper a:eq(2)').removeClass("btn-default").addClass("btn-primary");
				
				$("#miTable_wrapper a:eq(0)").css({"margin-right": "4px"});
				$("#miTable_wrapper a:eq(1)").css({"margin-right": "4px"});
				$("#miTable_wrapper a:eq(2)").css({"margin-right": "4px"});
				$("#miTable_wrapper a:eq(3)").css({"margin-right": "4px"});
			});
		</script>
		<!-- /#page-wrapper -->