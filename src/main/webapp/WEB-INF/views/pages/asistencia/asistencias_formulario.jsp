<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>


<!-- Opcion de la tabla -->

<div class='row'>
	<div class="col-md-4 col-lg-3">
	 <a class="btn btn-primary" href="${pageContext.request.contextPath}/asistencias?mes=${mes}">Regresar</a>
	</div>


</div>

<!-- Registros de la tabla -->
<div class="row gutter">
	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<div class="panel panel-light">
			<div class="panel-heading">
				<h4>Registro Asistencia</h4>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table id="miTable" class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								
									<th>Alumno</th>
									<th>Opcion</th>
								</tr>
							</thead>
							<tbody>
								<!-- ListaAlumnos -->
								<c:forEach var="lista" items="${listAlumnos}">
									<tr>
									
										<td>${lista.cursoAlumno.alumno.apellidos},${lista.cursoAlumno.alumno.nombres}</td>
										<td style="" width="100px"><select onchange="enviarAsistencia(this,${lista.idAsistencia})">
												<option value="A" ${lista.estado=="A"? " selected='selected'":"" }>Asistio
												<option value="F" ${lista.estado=="F"? " selected='selected'":"" }>Falta
												<option value="T" ${lista.estado=="T"? " selected='selected'":"" }>Tarde
												<option value="FJ" ${lista.estado=="FJ"? " selected='selected'":"" }>Falta Justificada
												<option value="TJ" ${lista.estado=="TJ"? " selected='selected'":"" }>Tardanza Justificada
										</select></td>
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


<script type="text/javascript">
	$(document).ready(function() {
	
		
	});
	function enviarAsistencia(obj, asistencia) {
		var tipoAsistencias = $(obj).val();
		var id_asistencia = asistencia;

		$.post( '${pageContext.request.contextPath}/asistencias/guardarAsistenciaAlumno',{ 
			 estado : tipoAsistencias,
			 idAsistencia : id_asistencia,
			 fecha:'${fecha}'},function( data ) {	
				// alert(data.message)		 
			});

	}
	</script>
