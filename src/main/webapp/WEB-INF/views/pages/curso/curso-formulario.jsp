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
		<div class="im-centered">
		<div class="row">
			<div class="col-lg-12">
				<h1>Formulario Curso</h1>
				
				<form:form action="saveCurso" method="post" modelAttribute="curso"
					cssClass="form-horizontal">
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="idCurso">ID</label>
						<div class="col-sm-10">
							<form:input path="idCurso" cssClass="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="nombreCurso">Curso:</label>
						<div class="col-sm-10">

							<form:input path="nombreCurso" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Institución:</label>
						<div class="col-sm-10">

							<form:input path="institucion" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Grado:</label>
						<div class="col-sm-10">

							<form:input path="grado" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Sección:</label>
						<div class="col-sm-10">

							<form:input path="seccion" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Año:</label>
						<div class="col-sm-10">

							<form:input path="anio" cssClass="form-control" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Horario:</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Horario"
									value="L-V (9:00am - 11:00 am)"> <span
									class="input-group-btn">
									<button class="btn btn-danger" type="button">
										<i class="glyphicon glyphicon-minus"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd"></label>
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control"> <span
									class="input-group-btn"> <a href="newHorario"
									class="btn btn-primary" type="button"><i
										class="glyphicon glyphicon-plus"></i></a>
								</span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-default" href="cursos">Cancelar</a>
							<button class="btn btn-success" type="submit">Guardar</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
		</div>
		<!-- /.row -->
	
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->