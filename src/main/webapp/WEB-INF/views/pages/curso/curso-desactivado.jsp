<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>

<!--     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
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
							<th>A�o</th>
							<th>Estado</th>

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

							<td style="text-align: center" width="100px">
								<a id="Activar" class="btn btn-sm btn-primary btn-sm" onclick="activar(${lista.idCurso})"> Activar</a>
							</td>

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
	$(document)	.ready(function() {
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"progressBar" : true,
			"preventDuplicates" : false,
			"positionClass" : "toast-top-right",
			"onclick" : null,
			"showDuration" : "400",
			"hideDuration" : "1000",
			"timeOut" : "7000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		};

		$.get("getRecordatorio/1",{},function(result) {

			var actividad = result.data.recordatorios;

			for (m in actividad) {
				var titulo = actividad[m].titulo;
				var curso = actividad[m].curso;
				var hora = actividad[m].hora;

				var mensaje = "Curso : "
				+ curso
				+ "<br>Hora : "
				+ hora;

				var $toast = toastr['success']
				(mensaje,
					titulo);

			}

		}, 'json');


		var table = $('#miTable').DataTable({

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
				text : '<i class="fa fa-plus"></i> Regresar',
				action : function(
					e, dt,
					node,
					config) {
					window.location.href = 'cursos';
				}
			},

			]
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
	function activar(idCurso){
		$.get("activarCurso/"+idCurso, {}, function (result) {
			if(result.response){
				alert("Activo Curso");
				location.reload();
			}else
			{
				alert("No pudo Activar Curso");
			}

		}, 'json');

	}
</script>
</div>
</div>