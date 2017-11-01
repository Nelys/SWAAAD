<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<!-- 				<h2>Lista Actividades Academicas</h2> -->
			</div>
		</div>

		<!-- Opcion de la tabla -->

		<div class='row'>
			<div class="col-md-2">
				<a class="btn btn-success" href="newActividadPedagogica"><i
					class="fa fa-plus"></i> Nuevo</a>
			</div>
			<div class="col-md-2">
				<a class="btn btn-success" id="btnNuevo"><i class="fa fa-plus"></i>
					Nuevo</a>
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">Open Modal</button>
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

		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">

				<div class="table-responsive">
					<c:if test="${!empty listActividadPedagogica}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>ID</th>
								<!-- 								<th>Curso</th> -->
								<th>Fecha</th>
								<th>Descripción</th>
								<!-- 								<th>Recordar</th> -->
								<th>ACCION</th>
							</tr>
							<c:forEach var="lista" items="${listActividadPedagogica}">
								<tr>
									<td>${lista.idActividad}</td>
									<%-- 									<td>${lista.curso}</td> --%>
									<td>${lista.fecha}</td>
									<td>${lista.descripcion}</td>
									<%-- 									<td>${lista.recordar}</td> --%>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="editAlumno?id=${lista.idActividad}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="deleteAlumno?id=${lista.idActividad}"><i
											class="fa fa-trash-o"></i></a></td>
								</tr>
							</c:forEach>
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

							<div class="form-group">
								<label class="control-label col-sm-2" for="pwd">Recordar</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <%-- 	                        	<form:radiobutton path="recordar" value="Si"/>Si --%>
									</label> <label class="radio-inline"> <%-- 	                        	<form:radiobutton path="recordar" value="No" />No --%>
									</label>
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
		<script type="text/javascript">
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
		</script>
		<!-- /#page-wrapper -->