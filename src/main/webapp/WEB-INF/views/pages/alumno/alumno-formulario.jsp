<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-6">
				<h1>Formulario Alumnos</h1>
				<form:form action="saveAlumno" method="post" modelAttribute="alumno"
					cssClass="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">ID</label>
						<div class="col-sm-10">
							<form:input path="idAlumno" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Nombres:</label>
						<div class="col-sm-10">

							<form:input path="nombres" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Apellidos:</label>
						<div class="col-sm-10">

							<form:input path="apellidos" cssClass="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Genero:</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
								name="myField" value="normal" /> Masculino
							</label> <label class="radio-inline"> <input type="radio"
								name="myField" value="high" /> Femenino
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Email:</label>
						<div class="col-sm-10">
							<form:input path="email" cssClass="form-control" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-default" href="alumnos">Cancelar</a>
							<button class="btn btn-success" type="submit">Guardar</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->