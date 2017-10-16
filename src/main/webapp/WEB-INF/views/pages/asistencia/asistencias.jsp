<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<p>
		<div class='row'>
			<div class="col-md-2 col-lg-1">
				<a class="btn btn-success" href="newAsistencia"><i
					class="fa fa-plus"></i> Nuevo</a>
			</div>

			<div class="col-md-4">
				<a class="btn btn-default" href="importarAlumno"><i
					class="fa fa-upload"></i> Importar</a>
			</div>

			<div class="col-lg-4 text-right">
				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i>
					PDF</a> <a class="btn btn-primary" href="#"><i
					class="fa fa-file-excel-o"></i> Excel</a> <a class="btn btn-default"
					href="#"><i class="fa fa-print"></i> Imprimir</a>

			</div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon2"><i
						class="fa fa-search"></i></span> <input type="text" class="form-control"
						placeholder="Buscar ..." aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		</p>
		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-6">

				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>No</th>
								<th>Alumno</th>
								<th>Accion</th>

							</tr>
							<c:forEach var="lista" items="${listAlumnos}">
								<tr>
									<td>${lista.alumno.nroOrden}</td>
									<td>${lista.alumno.nombres},${lista.alumno.apellidos}</td>
									<td style="text-align: center" width="100px"><select
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
	<!-- /.container-fluid -->
	<script>
function enviarAsistencia(obj,idCursoAlumno){
	
	
	var tipoistencias=$(obj).val();
	var AlumnoCurso=idCursoAlumno;
	$.ajax({
		type: "GET",
	  	dataType: "json",
		url : '${pageContext.request.contextPath}/guardarAsistenciaAlumno',
		data: { 
			tipo :  tipoAsistencias,
			idAlumnoCurso :AlumnoCurso
        }
	})
	.done(function( data, textStatus, jqXHR ) {
		if ( console && console.log ) {
			console.log( "La solicitud se ha completado correctamente. " );
			}
	})
	.fail(function( jqXHR, textStatus, errorThrown ) {
            if ( console && console.log ) {
                console.log( "La solicitud a fallado: " +  textStatus);
            }
// 		success: function(result){
// 			console.log("trajo");
// 		},
// 		error: function(x,e){
// 			toastr.error('Debe ingresar una nota', 'Error');
// //			    alert("error occur");
// 		} 
	});

}
</script>
</div>
<!-- /#page-wrapper -->