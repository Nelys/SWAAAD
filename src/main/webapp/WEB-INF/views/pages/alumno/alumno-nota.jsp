<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<script src="<c:url value='/resources/js/bsvalidator/bootstrapValidator.js'/>"></script>
<script src="<c:url value='/resources/js/validate-forms.js' />"></script>

<style>
	.im-centered{margin: auto; max-width: 600px;}
</style>

<div id="page-wrapper">
	<div class="container-fluid">
		<div class='row'>
			<div class="col-sm-4 im-centered">
				<div class="input-group">
					<span class="input-group-addon">Ingrese el Correo Electronico</span>
					<input id="txtCorreo" type="text" class="form-control" value="${correo}" />
<!-- 					<div class="form-control"></div> -->
				</div>
			</div>
			<div class="col-sm-4 im-centered">
				<div class="input-group">
					<button id="btnCorreo" class="btn btn-primary">Buscar</button>
				</div>
			</div>
		</div>
		
		<br/>
		
		<c:forEach var="listaAlumnos" items="${listAlumnos}">
			<div class='row'>
				<div class="col-sm-4 im-centered">
					<div class="input-group">
						<span class="input-group-addon">Alumno</span>
						<div class="form-control">${listaAlumnos.apellidos}, ${listaAlumnos.nombres}</div>
					</div>
				</div>
			</div>
			<br/>
<%-- 			<th id="${lista.idEvaluacion}" class="tdEvaluacion" style="background-color:${lista.colorFondo};color:${lista.colorTexto};font-weight: bold;padding-top: 0px; padding-left: 17px; padding-right: 17px; padding-bottom: 0px;"> --%>
<%-- 				<div style="text-align: center;">${lista.nombre}   --%>
<%-- 					<a class="btn btn-xs btn-warning" href="editEvaluacion?id=${lista.idEvaluacion}"><i class="fa fa-pencil-square-o"></i></a> --%>
<!-- 				</div> -->
<!-- 			</th> -->
		</c:forEach>
		
<!-- 		<div id="divNotas" class="row"> -->
<!-- 			<div class="col-lg-12"> -->

<!-- 				<div id="parent" class="table-responsive"> -->
<%-- 					<c:if test="${!empty listAlumnos}"> --%>
<!-- <!-- 						<table id="miTable" class="table table-bordered table-hover table-striped"> --> -->
<!-- <!-- 						<table id="miTable" class="stripe row-border order-column"> --> -->
<!-- 						<table id="fixTable" class="stripe row-border order-column" cellspacing="0" width="100%"> -->
<!-- <!-- 						<table id="example" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%"> --> -->
<!-- 							<thead> -->
<!-- 							<tr> -->
<!-- 								<th><div class="contenedor"> -->
<!-- 										<span class='alignvertical'>Alumno</span> -->
<!-- 									</div></th> -->

<%-- 								<c:set var="primero" value="${1}" /> --%>
<%-- 								<c:forEach var="lista" items="${listEvaluaciones}"> --%>

<%-- 									<th id="${lista.idEvaluacion}" class="tdEvaluacion" style="background-color:${lista.colorFondo};color:${lista.colorTexto};font-weight: bold;padding-top: 0px; padding-left: 17px; padding-right: 17px; padding-bottom: 0px;"> --%>
<%-- 										<div style="text-align: center;">${lista.nombre}   --%>
<%-- 											<a class="btn btn-xs btn-warning" href="editEvaluacion?id=${lista.idEvaluacion}"><i class="fa fa-pencil-square-o"></i></a> --%>
<!-- 										</div> -->
<!-- 									</th> -->
<%-- 								</c:forEach> --%>
<!-- 							</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
							
							

<%-- 							<c:forEach var="listaAlumno" items="${listAlumnos}"> --%>
<%-- 								<tr id="${listaAlumno.idAlumno}"> --%>
<%-- 									<td style="text-align: left;">${listaAlumno.nombres}, ${listaAlumno.apellidos}</td> --%>
<%-- 									<c:forEach var="listaEvaluacion" items="${listEvaluaciones}"> --%>
<%-- 										<c:forEach var="listaNotas" items="${listNotas}"> --%>
<%-- 											<c:choose> --%>
<%-- 											    <c:when test="${listaAlumno.idAlumno==listaNotas.alumno.idAlumno}"> --%>
<%-- 											    	<c:choose> --%>
<%-- 													    <c:when test="${listaNotas.evaluacion.idEvaluacion==listaEvaluacion.idEvaluacion}"> --%>
<%-- 													    	<td style="background-color:${listaEvaluacion.colorFondo};color:${listaEvaluacion.colorTexto};" >${listaNotas.notaEvaluativa}</td> --%>
<%-- 													    </c:when>     --%>
<%-- 													    <c:otherwise> --%>
<%-- 													    	<td style="background-color:${listaEvaluacion.colorFondo};color:${listaEvaluacion.colorTexto};" >00</td> --%>
<%-- 													    </c:otherwise> --%>
<%-- 													</c:choose> --%>
<%-- 											    </c:when>     --%>
<%-- 											    <c:otherwise> --%>
<%-- 											    	<td style="background-color:${listaEvaluacion.colorFondo};color:${listaEvaluacion.colorTexto};" >00</td> --%>
<%-- 											    </c:otherwise> --%>
<%-- 											</c:choose> --%>
<%-- 										</c:forEach> --%>
<%-- 									</c:forEach> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>


							
<%-- 							<c:forEach var="listaAlumno" items="${listAlumnos}"> --%>
<%-- 								<tr id="${listaAlumno.idAlumno}"> --%>
<%-- 									<td style="text-align: left;">${listaAlumno.nombres}, ${listaAlumno.apellidos}</td> --%>
<%-- 									<c:forEach var="listaEvaluacion" items="${listEvaluaciones}"> --%>
<!-- 										<td -->
<%-- 											id="idAlumno_${listaAlumno.idAlumno}-idEvaluacion_${listaEvaluacion.idEvaluacion}" --%>
<%-- 											style="background-color:${listaEvaluacion.colorFondo};color:${listaEvaluacion.colorTexto};" --%>
<!-- 											class="tdNota" data-toggle="modal" -->
<!-- 											data-target=".bs-example-modal-sm">00</td> -->
<%-- 									</c:forEach> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
							
<!-- 							</tbody> -->
<!-- 						</table> -->
<%-- 					</c:if> --%>

				</div>
	
		<div class="im-centered">
		
		</div>
		<!-- /.row -->
	
		<script type="text/javascript">
		$(document).ready(function() {
			
			/**
			 * Funcion click (Obtener datos Periodo)
			 */
			$('#btnCorreo').click(function() {
				window.location.href = '${pageContext.request.contextPath}/alumnos/alumnoNota/' + $("#txtCorreo").val();;
// 				$.ajax({
// 					type : "POST",
// 					url: "${pageContext.request.contextPath}/btnCorreo",
// 					success :function(search) {
// 						$("#descripcion").val(search['descripcion']);
// 						$("#numPeriodo").val(search['numero']);
// 						$("#numPeriodo").attr( "min" , search['numero'] );
// 			  		},
// 					error: function(x,e){	
// 						toastr.error('Debe ingresar una nota', 'Error');
// 					} 
// 				});
			});
			
			var idPeriodo = 0;
			$("#btn").click(function(e){
				idPeriodo++;
				
				var btn = $('<button/>', {
	                text: '-',
	                id: 'b'+idPeriodo,
// 	                class: 'btn btn-danger remove-me',
	                click: function () { 
						$('#'+$(this).attr('id').replace('b', 'periodo')).remove();
						$('#'+$(this).attr('id').replace('b', 'br')).remove();
	                }
	            });
				
				var ped = 	'<div class="input-group" id="periodo'+ idPeriodo +'">' +
								'<span class="input-group-addon" id="basic-addon1">'+ idPeriodo +'</span>' +
				    			'<input autocomplete="off" class="input form-control" id="field1" name="prof1" type="text" placeholder="Nombre del Periodo" />' +
				        		'<span id="span'+ idPeriodo +'" class="input-group-btn">'+
				        			'<div id="btn'+ idPeriodo +'"></div>'+
				        		'</span>'+
				        	'</div><br id="br'+ idPeriodo +'">';
	        	
	        	var a = $('#periodo').before($('#periodo').html()+ ped);
				
	        	$('#btn' + idPeriodo).before(btn);
	        	
	        	$( '#b' + idPeriodo ).html( "<i class='glyphicon glyphicon-minus'></i>" );
	        	
			});
		});
		</script>
			
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->