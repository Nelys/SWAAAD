<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<h2>Lista Alumnos</h2>

			</div>
		</div>

		<!-- Opcion de la tabla -->
		<p>
		<div class='row'>
			<div class="col-md-1">
				<a class="btn btn-success" href=""><i class="fa fa-plus"></i>
					Nuevo</a>
			</div>

			<div class="col-md-4">
				<a class="btn btn-default" href=""><i class="fa fa-upload"></i>
					Importar</a>
			</div>

			<div class="col-lg-4 text-right">

				<a class="btn btn-primary" href="#"><i clas s="fa fa-file-pdf-o"></i>
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
		<!-- Registros de la tabla -->
		<div class="row">
			<div class="col-lg-8">

				<div class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>No</th>
								<th>Alumno</th>
								<th>Estado</th>
							</tr>
							<c:forEach var="lista" items="${listAlumnos}">
								<tr>
									<td>${lista.nroOrden}</td>
									<td>${lista.nombres},${lista.apellidos}</td>
									<%-- 									<td>${lista.estado}</td> --%>

									<td style="text-align: center" width="100px">
									<select>
									<option  value="A"> Asistio
									<option value="F"> Falta
									<option value="T"> Tarde
									<option value="FJ"> Falta Justificada
									<option value="TJ"> Tardanza Justificada
									</select>
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