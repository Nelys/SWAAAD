<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
	<style>
		/*.btn {
		    border: none;
		    color: white;
		    padding: 6px 12px;
		    font-size: 14px;
		    cursor: pointer;
		}*/
		
		td {
		    width: 40px;
		    text-align: center;
		    padding-top: 0px;
		    padding-left: 0px;
		    padding-bottom: 0px;
		    padding-right: 0px;
		    cursor: pointer;
		}
		
		.asd {background-color: #4CAF50;} /* Green */
		.asd:hover {background-color: #46a049;}
		
/* 		.info {background-color: #2196F3;} /* Blue */ */
/* 		.info:hover {background: #0b7dda;} */
		
/* 		.warning {background-color: #ff9800;} /* Orange */ */
/* 		.warning:hover {background: #e68a00;} */
		
/* 		.danger {background-color: #f44336;} /* Red */  */
/* 		.danger:hover {background: #da190b;} */
		
/* 		.default {background-color: #e7e7e7; color: black;} /* Gray */  */
/* 		.default:hover {background: #ddd;} */
		
		/**
		 *	Columnas de la tabla
		 */
		thead th {
		  height: 25px;
		  width: 100px;
		  padding-left: 5px;
		  padding-right: 5px;
		  line-height: 25px;
		}
		
		/* Primera Columna*/
		thead th:first-child {
		  width: 300px;
		}
		
		/* Celdas de la tabla*/
		tbody td {
		  word-break: break-all;
		  /*padding: 5px;*/
		  border: 0;
		  width: 50px; /* 100px; */
		  vertical-align: top;
		  
		}
		
		tbody td:first-child {
		  width: 300px;
		}
		
		div.fTHLC-outer-wrapper {
		  /*border: 1px solid #000000;*/
		  /*margin: 50px auto;*/
		}
		
		div.fTHLC-inner-wrapper {
		  /*border: 1px dotted #000000;*/
		}
		
		div.fTHLC-outer-corner {
		  /*background-color: #ffffff;*/
		  /*border-right: 1px solid #000000;
		  border-bottom: 1px solid #000000;*/
		}
		
		table tr .cols {
		  background-color: #FFE4E1;
		}
		
		table tr .rows {
		  background-color: #E0FFFF;
		}
		
		/* texto Vertical */
		.contenedor {
		    position: relative;
		    min-height: 105px;
		}
		.alignvertical{
			position: absolute;
		    bottom: 0;
		    left: 0;
		}

		.rotate .celda {
		    width: 50px; /* 100px; */
		    height: 100px;
		    
			padding-top: 16px; padding-left: 16px; padding-right: 16px;	padding-bottom: 16px;
		
		    /* Rotate div */
/* 		    -ms-transform: rotate(-90deg); /* IE 9 */ */
/* 		    -webkit-transform: rotate(-90deg); /* Chrome, Safari, Opera */ */
/* 		    transform: rotate-90deg); */
		}
	</style>
<div id="page-wrapper">
	
	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<h2>Lista Notas</h2>
			</div>
		</div>

		<!-- Opcion de la tabla -->
		<p>
			<div class='row'>
				<div class="col-md-2">
					<a class="btn btn-success" href="newEvaluacion"><i class="fa fa-plus"></i> Nueva Evaluación</a>
				</div>
	
	<!-- 			<div class="col-md-2"> -->
	<!-- 				<a class="btn btn-default" href="#"><i class="fa fa-upload"></i> Sistema Evaluativo</a> -->
	<!-- 			</div> -->
	
				<div class="col-md-5 text-right" >
					<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a>
					<a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i> Excel</a>
					<a class="btn btn-default" href="#"><i class="fa fa-print"></i> Imprimir</a>
					
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Buscar ..." aria-describedby="sizing-addon2">
					</div>
				</div>
			</div>
		</p>
		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">
				
				<div id="parent" class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table  id="fixTable" class="table table-bordered table-hover table-striped" >
<!-- 							<table id="fixTable" class="table" cellpadding="0" cellspacing="0" align="center"> -->
<!-- 							<thead> -->
		                            <tr>
		                                <td><div class="contenedor"><span class='alignvertical'>Alumno</span></div></td>

									<c:set var = "primero"  value = "${1}"/>
									<c:forEach var="lista" items="${listEvaluaciones}">

	                                	<td id="${lista.idEvaluacion}" class="tdEvaluacion" style="background-color:${lista.color};color:${lista.colorTexto};font-weight: bold;padding-top: 0px; padding-left: 17px; padding-right: 17px; padding-bottom: 0px;"><div class='rotate'>${lista.nombre}</div></td>
	                        		</c:forEach>
                            	</tr>

	<!-- 	                        </thead> -->
	<!-- 	                        <tbody> -->
								<c:forEach var="listaAlumno" items="${listAlumnos}">
		                            <tr id="${listaAlumno.idAlumno}">
		                                <td style="text-align: left;">${listaAlumno.nombres}, ${listaAlumno.apellidos}</td>
		                                <c:forEach var="listaEvaluacion" items="${listEvaluaciones}">
		                                	<td id="idAlumno_${listaAlumno.idAlumno}-idEvaluacion_${listaEvaluacion.idEvaluacion}" style="background-color:${listaEvaluacion.color};color:${listaEvaluacion.colorTexto};" class="tdNota" data-toggle="modal" data-target=".bs-example-modal-sm">00</td>
		                                </c:forEach>
		                            </tr>
	                            </c:forEach>

						</table>
					</c:if>
					
				</div>
				<!-- Contenido nota Modal -->
				<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				  <div class="modal-dialog modal-sm" role="document">
				    <div class="modal-content">
				      	<div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Nota</h4>
				        </div>
				        <form:form action="saveNota" method="GET" modelAttribute="nota">
					        <div class="modal-body">
	<%-- 							<form name="ejemplo2" action="11-html5-number-input.php" method="POST"> --%>
								<div>
									<form:hidden path="idNota" />
									<form:hidden path="idAlumno" />
									<form:hidden  cssClass="idEvaluacion" path="evaluacion.idEvaluacion" />
								    <p><b>Alumno: </b><span id="alumno">Aaaaaaa</span></p>
								    <p><b>Evaluación: </b><span id="evaluacion">Tarea</span></p>
								</div>
							    <div align="center">
								    <input id="notaEvaluativa" type="number" name="notaEvaluativa" min="0" max="20" step="1" style="text-align: center; required="required />
							    </div>
	<%-- 							</form>  --%>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
					          <button id="buttonNota" type="submit" class="btn btn-success" data-dismiss="modal">Aceptar</button>
					        </div>
				        </form:form>
				    </div>
				  </div>
				</div>
				<!-- / Contenido Modal -->
				
				
				<fieldset>
					<input type="button" value="Demo 1" id="buttonDemo1" style="display: none;"><br>
					<input type="button" value="JSON 1" id="buttonJson1" style="display: none;"><br>
					<a href="json4" style="display: none;">Boton</a>
					<span id="result2"></span>
					<div id="show-data"></div>
				</fieldset>
			</div>
		</div>
		<!-- /.row -->
	<script>

		$(function() {
		  $('table').fixedTblHdrLftCol({
		    scroll: {
		      height: '100%',
		      width: '100%'
		    }
		  });
		});
	
		/**
		 * Funciones de la pagina cargada
		 */
		$(document).ready(function() {
			
			/**
			 * Funcion AJAX donde se establece la nota por alumno y evaluacion
			 */
		    $.getJSON('${pageContext.request.contextPath}/json4', function (data) {
		        $.each(data.notas, function(i, item) {
		        	
		        	// Formato al id alumno evaluacion
		        	var id ='#idAlumno_' + item.idAlumno + '-idEvaluacion_' + item.idEvaluacion;
		        	
		        	// Formato de 2 digitos a item.notaEvaluativa
		        	$( id ).html(("0" + item.notaEvaluativa).slice(-2));
		        	
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
			    $( '#idAlumno' ).val(idAlumno);
				
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
				
				//$("#nota").ajaxSubmit({url: '${pageContext.request.contextPath}/saveNota', type: 'post'});
				
				$.ajax({
					url : '${pageContext.request.contextPath}/prepadarNota',
					data: { idNota:  $( '#idNota' ).val(), 
							idAlumno:  $( '#idAlumno' ).val(),
							idEvaluacion:  $( '.idEvaluacion' ).val(), 
							notaEvaluativa: $( '#notaEvaluativa' ).val()
							},
					
					success: function(result){
						//$( '#result2' ).html(result);
						location.reload();
					},
					error: function(x,e){
					    alert("error occur");
					} 
				});
				
// 				// Obteniendo el id del elemento td
// 				//var id = $(this).attr('id');
// 				var id = localStorage['id'];
				
// 				// Obteniendo idAlumno e idEvaluacion
// 				var arr = id.split('-');//$(this).attr('id');
// 				var idAlumno= arr[0];
// 				var idEvaluacion= arr[1];
				
// 				idAlumno = idAlumno.replace('idAlumno_', '');
// 				idEvaluacion = idEvaluacion.replace('idEvaluacion_', '');
// 				console.log( idAlumno + ' ' + idEvaluacion );
				
// 				$.ajax({
// 					url : '${pageContext.request.contextPath}/getIdNota',
// 					data: { idAlumno: idAlumno, idEvaluacion: idEvaluacion},
// 					success: function(result){
// 						$('#result2').html(result);
// 					},
// 					error: function(x,e){
// 					    alert("error occur");
// 					} 
// 				});
				
				
				//////////////////////////////////////////////////////////
				/*$.post('${pageContext.request.contextPath}/saveNota2', { idAlumno: 6, idEvaluacion : 1}, 
				    function(returnedData){
				         console.log(returnedData);
				}, 'json');*/
				//////////////////////////////////////////////////////////
				
				// Enviando paramentros por AJAX
				/*$.ajax({
					type: 'POST',
					url : '${pageContext.request.contextPath}/saveNota2',
					data: { idAlumno: 6, idEvaluacion: 1},
					//data: '{ idAlumno:' + idAlumno + ', idEvaluacion:' + idEvaluacion + '}',
					ContentType: 'application/x-www-form-urlencoded',
					//contentType: "application/json; charset=utf-8",
				    dataType: "json",
				    async: true,
				    cache: false,
					success: function(result){
						$('#result2').html(result);
					},
					error: function(x,e){
					    alert("error occur");
					} 
				});*/
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
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->