<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
<!-- 		<div class='row'> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<h2>Lista Alumnos</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- Opcion de la tabla -->
<!-- 		<div class='row'> -->
<!-- 			<div class="col-md-1"> -->
<!-- 				<a class="btn btn-success" href="newAlumno"><i -->
<!-- 					class="fa fa-plus"></i> Nuevo</a> -->
<!-- 			</div> -->

<!-- 			<div class="col-md-4"> -->
<!-- 				<a class="btn btn-default" href="hello"><i -->
<!-- 					class="fa fa-upload"></i> Importar</a> -->
<!-- 			</div> -->

<!-- 			<div class="col-lg-4 text-right"> -->
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> -->
<!-- 					PDF</a> <a class="btn btn-primary" href="xls"><i -->
<!-- 					class="fa fa-file-excel-o"></i> Excel</a> <a class="btn btn-default" -->
<!-- 					href="AlumnoReporte"><i class="fa fa-print"></i> Imprimir</a> -->

<!-- 			</div> -->
<!-- 			<div class="col-md-3"> -->
<!-- 				<div class="input-group"> -->
<!-- 					<span class="input-group-addon" id="sizing-addon2"><i -->
<!-- 						class="fa fa-search"></i></span> <input type="text" class="form-control" -->
<!-- 						placeholder="Buscar ..." aria-describedby="sizing-addon2"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<br> -->
		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">

				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table id="miTable" class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Alumno</th>
								<th>G</th>
								<th>Email</th>
<!-- 								<th>No</th> -->
								<th>Nombres Apoderado</th>
								<th>Apellidos Apoderado</th>
								<th>Email Apoderado</th>
								<th>ACCION</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lista" items="${listAlumnos}">
								<tr>
									<td>${lista.idAlumno}</td>
									<td>${lista.nombres},${lista.apellidos}</td>
									<td>${lista.genero}</td>
									<td>${lista.email}</td>
<%-- 									<td>${lista.nroOrden}</td> --%>
									<td>${lista.nombresApoderado}</td>
									<td>${lista.apellidosApoderado}</td>
									<td>${lista.emailApoderado}</td>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="editAlumno?id=${lista.idAlumno}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="deleteAlumno?id=${lista.idAlumno}"><i
											class="fa fa-trash-o"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
					</c:if>
				</div>

			</div>
		</div>
		<!-- /.row -->
		<script type="text/javascript">
			$(document).ready(function() {
			
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
							window.location.href = 'newAlumno';
		                }
		            },
		            {
		                extend:    'excelHtml5',
		                text:      '<i class="fa fa-file-excel-o"></i> Excel',
		                titleAttr: 'Excel',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
		                }
		            },
		            {
		                extend:    'pdfHtml5',
		                text:      '<i class="fa fa-file-pdf-o"></i> PDF',
		                titleAttr: 'PDF',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
		                }
		            },
		            {
		                extend:    'print',
		                text:      '<i class="fa fa-print"></i> Print',
		                titleAttr: 'print',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
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
			
		});
		</script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->