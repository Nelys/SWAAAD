<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">

				<div class="table-responsive">
					
						<table id="miTable" class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>G</th>
								<th>Email</th>
								<th>Nombres Apoderado</th>
								<th>Apellidos Apoderado</th>
								<th>Email Apoderado</th>
								<th>ACCION</th>
							</tr>
						</thead>
						<c:if test="${!empty listAlumnos}">
						<tbody>
							<c:forEach var="lista" items="${listAlumnos}">
								<tr>
									<td>${lista.idAlumno}</td>
									<td>${lista.nombres}</td>
									<td>${lista.apellidos}</td>
									<td>${lista.genero}</td>
									<td>${lista.email}</td>
									<td>${lista.nombresApoderado}</td>
									<td>${lista.apellidosApoderado}</td>
									<td>${lista.emailApoderado}</td>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="alumnos/editAlumno?id=${lista.idAlumno}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="alumnos/deleteAlumno?id=${lista.idAlumno}"><i
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
		
		
		<!-- Contenido Aula Modal -->
		<div id="modalSistema" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Seleccionar archivo Excel</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div id="divEvaluaciones" class="col-sm-12">
								<form id="formExcel" action="alumnos/importAlumno" method="post" enctype="multipart/form-data" class="form-horizontal">
									<div class="form-group">
										<div class="col-sm-12">
											<input name="excelfile2007" id="excelfile2007" class="btn btn-primary" type="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-12">
											<input type="submit" class="btn btn-success pull-right" value="Generar" >
										</div>
									</div>
									
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="btnNota" class="btn btn-default pull-left"
							data-dismiss="modal">Salir</button>
					</div>
				</div>
			</div>
		</div>
		<!-- / Contenido Modal -->
		
		<script type="text/javascript">
		$(document).ready(function() {
			
			$('#excelfile2007').jfilestyle({
				text : 'Navegar',
				dragdrop: false,
				buttonBefore: true,
				onChange : function (e) {
					console.log(CheckFileName());
				}
			});
			
			function CheckFileName() {
		        var fileName = document.getElementById("excelfile2007").value
		        if (fileName == "") {
		            alert("Seleccionar un archivo excel de extención .xlsx");
		            return false;
		        }
		        else if (fileName.split(".")[1].toUpperCase() == "XLSX"){
// 		        	alert("¡Importación exitosa!");
		            return true;
		        }
		        else {
		        	$('#excelfile2007').jfilestyle('clear');
		            alert("Archivo con extención ." + fileName.split(".")[1] + " es invalido. Cargar un archivo valido con extención .xlsx");
		            return false;
		        }
		        return true;
		    }
			
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
							window.location.href = 'alumnos/newAlumno';
		                }
		            },
		            {
		        		text: '<i class="fa fa-upload"></i> Importar',
		                action: function ( e, dt, node, config ) {
// 							window.location.href = 'hello';
		                }
		            },
		            {
		                extend:    'excelHtml5',
		                text:      '<i class="fa fa-file-excel-o"></i> Excel',
		                titleAttr: 'Excel',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
		                }
		            },
		            {
		                extend:    'pdfHtml5',
		                text:      '<i class="fa fa-file-pdf-o"></i> PDF',
		                titleAttr: 'PDF',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
		                }
		            },
		            {
		                extend:    'print',
		                text:      '<i class="fa fa-print"></i> Print',
		                titleAttr: 'print',
		                exportOptions: {
		                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
		                }
		            },
					{
		        		text: '<i class="fa fa-print"></i> Imprimir',
		                action: function ( e, dt, node, config ) {
							window.location.href = 'alumnos/AlumnoReporte';
		                }
		            }
				]
		    } );
			
			$('#miTable_wrapper a:eq(0)').removeClass("btn-default").addClass("btn-success");
			$('#miTable_wrapper a:eq(2)').removeClass("btn-default").addClass("btn-primary");
			$('#miTable_wrapper a:eq(3)').removeClass("btn-default").addClass("btn-primary");
			
			$("#miTable_wrapper a:eq(0)").css({"margin-right": "4px"});
			$("#miTable_wrapper a:eq(1)").css({"margin-right": "4px"});
			$("#miTable_wrapper a:eq(2)").css({"margin-right": "4px"});
			$("#miTable_wrapper a:eq(3)").css({"margin-right": "4px"});
			$("#miTable_wrapper a:eq(4)").css({"margin-right": "4px"});
			
			// Agregar atributos
			$('#miTable_wrapper a:eq(1)').attr('data-toggle', 'modal');
			$('#miTable_wrapper a:eq(1)').attr('data-target', '#modalSistema');
			
		});
		</script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->