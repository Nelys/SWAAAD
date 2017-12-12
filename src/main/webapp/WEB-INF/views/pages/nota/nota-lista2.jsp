<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<link href="<c:url value='/resources/template/css/datatables/jquery.dataTables.min.css' />" rel="stylesheet" />
<%-- <link href="<c:url value='/resources/template/css/datatables/dataTables.bootstrap.min.css' />" rel="stylesheet" /> --%>
<link href="<c:url value='/resources/template/css/datatables/fixedColumns.dataTables.min.css' />" rel="stylesheet" />

<style>

	th, td { white-space: nowrap; }
    div.dataTables_wrapper {
/*         width: 800px; */
        margin: 0 auto;
    }
	
	td {
		width: 40px;
		text-align: center;
		cursor: pointer;
	}
</style>
<!-- 	<div class="container"> -->
		<div class='row'>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">Periodo</span>
					<select class="form-control" id="cbxPeriodo">
						<c:forEach var="listaPeriodo" items="${listPeriodos}">
							<option value="">Seleccionar Periodo</option>
							<option value="${listaPeriodo.curso.idCurso}" >${listaPeriodo.curso.idCurso}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
<!-- 	</div> -->
		<br />

		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">

				<div id="parent" class="table-responsive">
					<c:if test="${!empty listAlumnos}">
<!-- 						<table id="miTable" class="table table-bordered table-hover table-striped"> -->
<!-- 						<table id="miTable" class="stripe row-border order-column"> -->
						<table id="fixTable" class="stripe row-border order-column" cellspacing="0" width="100%">
<!-- 						<table id="example" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%"> -->
							<thead>
							<tr>
								<th><div class="contenedor">
										<span class='alignvertical'>Alumno</span>
									</div></th>

								<c:set var="primero" value="${1}" />
								<c:forEach var="lista" items="${listEvaluaciones}">

									<th id="${lista.idEvaluacion}" class="tdEvaluacion"
										style="background-color:${lista.color};color:${lista.colorTexto};font-weight: bold;padding-top: 0px; padding-left: 17px; padding-right: 17px; padding-bottom: 0px;"><div
										>${lista.nombre}</div></th>
								</c:forEach>
							</tr>
							</thead>
							<tbody>

							<c:forEach var="listaAlumno" items="${listAlumnos}">
								<tr id="${listaAlumno.idAlumno}">
									<td style="text-align: left;">${listaAlumno.nombres},
										${listaAlumno.apellidos}</td>
									<c:forEach var="listaEvaluacion" items="${listEvaluaciones}">
										<td
											id="idAlumno_${listaAlumno.idAlumno}-idEvaluacion_${listaEvaluacion.idEvaluacion}"
											style="background-color:${listaEvaluacion.color};color:${listaEvaluacion.colorTexto};"
											class="tdNota" data-toggle="modal"
											data-target=".bs-example-modal-sm">00</td>
									</c:forEach>
								</tr>
							</c:forEach>
							
							</tbody>
						</table>
					</c:if>

				</div>
				<!-- Contenido nota Modal -->
				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Nota</h4>
							</div>
							<form:form action="saveNota" method="GET" modelAttribute="nota">
								<div class="modal-body">
								
									<div>
										<form:hidden path="idNota" />
										<form:hidden cssClass="idAlumno" path="alumno.idAlumno" />
										<form:hidden cssClass="idEvaluacion" path="evaluacion.idEvaluacion" /> 
										<p>
											<b>Alumno: </b><span id="alumno">Aaaaaaa</span>
										</p>
										<p>
											<b>Evaluación: </b><span id="evaluacion">Tarea</span>
										</p>
									</div>

									<div class="form-group">
										<input id="notaEvaluativa" name="notaEvaluativa"
											class="form-control required" type="number" value="1" min="0"
											max="20" />
									</div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default pull-left"
										data-dismiss="modal">Cancelar</button>
									<button id="buttonNota" type="submit" class="btn btn-success"
										data-dismiss="modal">Aceptar</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- / Contenido Modal -->


				<fieldset>
					<input type="button" value="Demo 1" id="buttonDemo1"
						style="display: none;"><br> <input type="button"
						value="JSON 1" id="buttonJson1" style="display: none;"><br>
					<a href="json4" style="display: none;">Boton</a> <span id="result2"></span>
					<div id="show-data"></div>
				</fieldset>
			</div>
		</div>
		<!-- /.row -->
		<script src="<c:url value='/resources/js/bootstrap-number-input.js' />"></script>
		<script>

		
		$(function() {
			
			$('#notaEvaluativa').bootstrapNumber({
				upClass: 'success',
				downClass: 'danger'
			});
		});
	
		/**
		 * Funciones de la pagina cargada
		 */
		$(document).ready(function() {
			
			$('#fixTable').DataTable( {
				scrollY:        "800px",
		        scrollX:        true,
		        scrollCollapse: true,
		        paging:         true,
		        fixedColumns:   true,
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
		        		text: '<i class="fa fa-plus"></i> Nueva Evaluación',
		                action: function ( e, dt, node, config ) {
							window.location.href = 'newEvaluacion';
		                }
		            },
		            {
		                extend:    'excelHtml5',
		                text:      '<i class="fa fa-file-excel-o"></i> Excel',
		                titleAttr: 'Excel'
		            },
		            {
		                extend:    'pdfHtml5',
		                text:      '<i class="fa fa-file-pdf-o"></i> PDF',
		                titleAttr: 'PDF'
		            },
		            {
		                extend:    'print',
		                text:      '<i class="fa fa-print"></i> Print',
		                titleAttr: 'print'
		            }
// 		            ,
// 					{
// 		        		text: '<i class="fa fa-print"></i> Imprimir',
// 		                action: function ( e, dt, node, config ) {
// 							window.location.href = '#';
// 		                }
// 		            }
				]
		    } );
			
			$('#fixTable_wrapper a:eq(0)').removeClass("btn-default").addClass("btn-success");
			$('#fixTable_wrapper a:eq(1)').removeClass("btn-default").addClass("btn-primary");
			$('#fixTable_wrapper a:eq(2)').removeClass("btn-default").addClass("btn-primary");
			
			$("#fixTable_wrapper a:eq(0)").css({"margin-right": "4px"});
			$("#fixTable_wrapper a:eq(1)").css({"margin-right": "4px"});
			$("#fixTable_wrapper a:eq(2)").css({"margin-right": "4px"});
			$("#fixTable_wrapper a:eq(3)").css({"margin-right": "4px"});
			
			
			/**
			 * Funcion AJAX donde se establece la nota por alumno y evaluacion
			 */
		    $.getJSON('${pageContext.request.contextPath}/json4', function (data) {
		    	console.log("mensaje1");
		        $.each(data.notas, function(i, item) {
		        	
		        	// Formato al id alumno evaluacion
		        	var id ='#idAlumno_' + item.idAlumno + '-idEvaluacion_' + item.idEvaluacion;
		        	
		        	// Formato de 2 digitos a item.notaEvaluativa
		        	$( id ).text(("0" + item.notaEvaluativa).slice(-2));
		        	
		    	});
		    });

		    /**
			 * Evento Click de lso elementos td de la primera fila
			 */
			$(document).on("click", "#fixTable .tdEvaluacion", function(e) {
				var id = $(this).attr('id');
				console.log(id);
				window.location.href="editEvaluacion?id=" + id;
			    // Prevent the click from going up the chain
			    e.stopPropagation();
			});
			
		    /**
			 * Evento Click de un elemento td de la tabla fixTable
			 */
			$(document).on("click", "#fixTable .tdNota", function(e) {
				console.log("mensaje1");
				// Obteniendo el id del elemento td
				var id = $(this).attr('id');
			    
				// Obteniendo idAlumno e idEvaluacion
				var arr = id.split('-');//$(this).attr('id');
				var idAlumno= arr[0];
				var idEvaluacion= arr[1];
				
				idAlumno = idAlumno.replace('idAlumno_', '');
				
				$.ajax({
					url : '${pageContext.request.contextPath}/getAlumnoById',
					data: { idAlumno: idAlumno },
					success: function(result){
						$( '#alumno' ).html(result.apellidos + ', ' + result.nombres);
					},
					error: function(x,e){
					    alert("error occur");
					} 
				});
				
				idEvaluacion = idEvaluacion.replace('idEvaluacion_', '');
				
				$.ajax({
					url : '${pageContext.request.contextPath}/getEvaluacionById',
					data: { idEvaluacion: idEvaluacion },
					success: function(result){
						$( '#evaluacion' ).html(result.nombre);
					},
					error: function(x,e){
					    alert("error occur");
					} 
				});
				
				$.ajax({
					url : '${pageContext.request.contextPath}/getIdNota',
					data: { idAlumno: idAlumno, idEvaluacion: idEvaluacion},
					success: function(result){
						$( '#idNota' ).val(result);
					},
					error: function(x,e){
					    alert("error occur");
					} 
				});
				
				// Obteniendo el text del elemento td
			    $( '.idAlumno' ).val(idAlumno);
				
				// Obteniendo el text del elemento td
			    $( '.idEvaluacion' ).val(idEvaluacion);
				
				// Obteniendo el text del elemento td
			    $( '#notaEvaluativa' ).val($('#' + id).html());
				
				// Almacen variable Session
			    localStorage['id'] = id;
			     
			}); 

			/**
			 * Funcion click del boton Aceptar de la pagina modal para guardar nota
			 */
			$('#buttonNota').click(function() {
				console.log("mandar");
				//$("#nota").ajaxSubmit({url: '${pageContext.request.contextPath}/saveNota', type: 'post'});
				
				$.ajax({
					url : '${pageContext.request.contextPath}/prepararNota',
					data: { idNota:  $( '#idNota' ).val(), 
							idAlumno:  $( '.idAlumno' ).val(),
							idEvaluacion:  $( '.idEvaluacion' ).val(), 
							notaEvaluativa: $( '#notaEvaluativa' ).val()
							},
					
					success: function(result){
						//$( '#result2' ).html(result);
						location.reload();
					},
					error: function(x,e){
						toastr.error('Debe ingresar una nota', 'Error');
// 					    alert("error occur");
					} 
				});
	
			});
			
			

			/**
			 * Funcion click (Prueba)
			 */
			$('#buttonDemo1').click(function() {
				colId = $("#fixTable td:first").attr('id');
				//alert(colId);
				$.ajax({
					type: 'GET',
					url :'${pageContext.request.contextPath}/demo1',
					success: function(result){
						$('#result2').html(result);
					}
				});
			});
			
		});

    </script>
<!-- 	</div> -->
	<!-- /.container-fluid -->

<!-- </div> -->
<!-- /#page-wrapper -->