<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-6">
				<h1>Formulario Asistencia</h1>
				<form:form action="saveAsistencia" method="post"	modelAttribute="asistencias" cssClass="form-horizontal">
				
					<div class="form-group">
						<label class="control-label col-sm-2" for="id">ID</label>
						<div class="col-sm-10">
							<form:input path="idAsistencia" cssClass="form-control"  />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="estado">Estado:</label>
						<div class="col-sm-10">
							
							<form:input path="estado" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="fecha">Fecha:</label>
						<div class="col-sm-10">
							
							<form:input path="fecha" cssClass="form-control" />
						</div>
					</div>
					
<!-- 					<div class="form-group"> -->
<!--                         <label class="control-label col-sm-2" for="pwd">Genero:</label> -->
<!--                         <div class="col-sm-10"> -->
<!-- 	                        <label class="radio-inline"> -->
<!-- 	                            <input type="radio" name="myField" value="normal" /> Masculino -->
<!-- 	                        </label> -->
	                        
<!-- 	                        <label class="radio-inline"> -->
<!-- 	                            <input type="radio" name="myField" value="high" /> Femenino -->
<!-- 	                        </label> -->
<!--                         </div> -->
<!--                     </div> -->
                           
<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label col-sm-2" for="pwd">Email:</label> -->
<!-- 						<div class="col-sm-10"> -->
<%-- 							<form:input path="email" cssClass="form-control" /> --%>
<!-- 						</div> -->
<!-- 					</div> -->

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-default" href="alumnos">Cancelar</a>
							<button class="btn btn-success" type="submit" >Guardar</button>
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