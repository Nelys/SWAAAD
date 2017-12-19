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
					<span class="input-group-addon btn-primary">Ingrese el Correo Electronico</span>
					<input id="txtCorreo" type="text" class="form-control" value="${correo}" />
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
			<c:forEach var="listaCursoAlumnos" items="${listCursoAlumnos}">
				<c:forEach var="listaCursos" items="${listCursos}">
					<c:if test="${listaCursos.idCurso==listaCursoAlumnos.curso.idCurso}"> 
						<div class='row'>
							<div class="col-sm-4 im-centered">
								<div class="input-group">
									<span class="input-group-addon">Curso</span>
									<div class="form-control">${listaCursos.nombreCurso}</div>
								</div>
							</div>
						</div>
						<br/>
						<c:forEach var="listaPeriodos" items="${listPeriodos}">
							<c:if test="${listaPeriodos.curso.idCurso==listaCursoAlumnos.curso.idCurso}">
								<div class='row'>
									<div class="col-sm-4 im-centered">
										<div class="input-group">
											<span class="input-group-addon">Periodo</span>
											<div class="form-control">${listaPeriodos.descripcion} ${listaPeriodos.numeroPeriodos}</div>
										</div>
									</div>
								</div>
								<br/> 
								
<!-- 										<table id="fixTable" class="stripe row-border order-column" cellspacing="0" width="100%"> -->
										<table id="example" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
											
											<thead>
											<tr>
												<c:forEach var="listaEvaluaciones" items="${listEvaluaciones}">
													<c:if test="${listaPeriodos.idPeriodo==listaEvaluaciones.periodo.idPeriodo}">
														<th id="${listaEvaluaciones.idEvaluacion}" class="tdEvaluacion" style="background-color:${listaEvaluaciones.colorFondo};color:${listaEvaluaciones.colorTexto};font-weight: bold;padding-top: 0px; padding-left: 17px; padding-right: 17px; padding-bottom: 0px;">
															<div style="text-align: center;">${listaEvaluaciones.nombre}</div>
														</th>
													</c:if>
												</c:forEach>
											</tr>
											</thead>
											<tbody>
											<tr>
												<c:forEach var="listaEvaluaciones" items="${listEvaluaciones}">
													<c:if test="${listaPeriodos.idPeriodo==listaEvaluaciones.periodo.idPeriodo}">
												    	<td id="idAlumno_${listaAlumnos.idAlumno}-idEvaluacion_${listaEvaluaciones.idEvaluacion}"
														style="background-color:${listaEvaluaciones.colorFondo};color:${listaEvaluaciones.colorTexto};text-align: center;"
														class="tdNota" data-toggle="modal"
														data-target=".bs-example-modal-sm">00</td>
													</c:if>
												</c:forEach>
											</tr>
											</tbody>
										</table>
									
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>

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
			});
			
			var collection = $("#example .tdNota");
			collection.each(function(element, index, set) {
				var id=$(this).attr('id');
				
				var arr = id.split('-');//$(this).attr('id');
				var idAlumno= arr[0];
				var idEvaluacion= arr[1];
				
				idAlumno = idAlumno.replace('idAlumno_', '');
				idEvaluacion = idEvaluacion.replace('idEvaluacion_', '');
				
				$.ajax({
					type : "POST",
					url: "${pageContext.request.contextPath}/alumnos/obtenerNota",
					data: { idAlumno: idAlumno, idEvaluacion: idEvaluacion},
					success :function(search) {
						console.log(search);
						$("#" + id).html(search);
						
			  		},async:false,
					error: function(x,e){	
						console.log(x + " " + e);
						toastr.error('Se ha generado un error', 'Error');
					} 
				});
			});
			
		});
		</script>
			
<!-- 	</div> -->
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->