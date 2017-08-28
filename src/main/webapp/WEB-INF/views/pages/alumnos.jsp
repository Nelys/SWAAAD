<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">

				<h1>Lista Alumnos</h1>
				<a class="btn btn-success" href="newAlumno">Nuevo Alumno</a>
				<hr>
				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>ID</th>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>Genero</th>
								<th>Email</th>
								<th>Nro Orden</th>
								<th>Nombres Apoderado</th>
								<th>Apellidos Apoderado</th>
								<th>Email Apoderado</th>
								<th>Opciones</th>
							</tr>
							<c:forEach var="lista" items="${listAlumnos}">
								<tr>
									<td>${lista.idAlumno}</td>
									<td>${lista.nombres}</td>
									<td>${lista.apellidos}</td>
									<td>${lista.genero}</td>
									<td>${lista.email}</td>
									<td>${lista.nroOrden}</td>
									<td>${lista.nombresApoderado}</td>
									<td>${lista.apellidosApoderado}</td>
									<td>${lista.emailApoderado}</td>
									<td>
									<a class="btn btn-sm btn-primary" href="editAlumno?id=${lista.idAlumno}">Editar</a>
									<a class="btn btn-sm btn-danger" href="deleteAlumno?id=${lista.idAlumno}">Eliminar</a>
									</td>
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