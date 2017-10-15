<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<h2>Lista Cursos</h2>
			</div>
		</div>

		<!-- Opcion de la tabla -->
		<p>
		<div class='row'>
			<div class="col-md-5">
				<a class="btn btn-success" href="newCurso"><i class="fa fa-plus"></i>
					Nuevo</a> <a class="btn btn-default" href="#"><i
					class="fa fa-upload"></i> Importar</a>
			</div>

			<!-- 			<div class="col-md-4"> -->

			<!-- 			</div> -->

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
			<div class="col-lg-12">

				<div class="table-responsive">
					<c:if test="${!empty listCursos}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>ID</th>
								<th>Curso</th>
								<th>Institucion</th>
								<th>Grado</th>
								<th>Seccion</th>
								<th>Año</th>

								<th>Seleccion</th>

								<th>ACCION</th>
							</tr>
							<c:forEach var="lista" items="${listCursos}">
								<tr>
									<td>${lista.idCurso}</td>
									<td>${lista.nombreCurso}</td>
									<td>${lista.institucion}</td>
									<td>${lista.grado}</td>
									<td>${lista.seccion}</td>
									<td>${lista.anio}</td>
									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-primary btn-sm"
										href="selectCurso?id=${lista.idCurso}"><i
											class="fa fa-eye"></i> Seleccionar</a></td>

									<td style="text-align: center" width="100px"><a
										class="btn btn-sm btn-warning btn-sm"
										href="editCurso?id=${lista.idCurso}"><i
											class="fa fa-pencil-square-o"></i></a> <a
										class="btn btn-sm btn-danger btn-sm"
										href="deleteCurso?id=${lista.idCurso}"><i
											class="fa fa-trash-o"></i></a></td>
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

</div>
<!-- /#page-wrapper -->