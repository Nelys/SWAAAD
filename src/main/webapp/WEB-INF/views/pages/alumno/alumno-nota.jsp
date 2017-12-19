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
				<h1>Notas del Alumno</h1>
				
				<form action="" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="idCurso">ID</label>
						<div class="col-sm-10">
							<form:input path="idCurso" cssClass="form-control" />
						</div>
					</div>
				</form>
				
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

<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label col-sm-2" for="pwd">Horario:</label> -->
<!-- 						<div class="col-sm-10"> -->
<!-- 							<div class="input-group"> -->
<!-- 								<input type="text" class="form-control" placeholder="Horario" -->
<!-- 									value="L-V (9:00am - 11:00 am)"> <span -->
<!-- 									class="input-group-btn"> -->
<!-- 									<button class="btn btn-danger" type="button"> -->
<!-- 										<i class="glyphicon glyphicon-minus"></i> -->
<!-- 									</button> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label col-sm-2" for="pwd"></label> -->
<!-- 						<div class="col-sm-10"> -->
<!-- 							<div class="input-group"> -->
<!-- 								<input type="text" class="form-control"> -->
<!-- 								<span class="input-group-btn">  -->
<!-- 									<a href="newHorario" class="btn btn-primary" type="button"> -->
<!-- 										<i class="glyphicon glyphicon-plus"></i> -->
<!-- 									</a> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Periodo:</label>
				        <div class="col-sm-10" id="fields">
				        	<input type="hidden" name="count" value="1" />
			            	<div id="periodo"></div>
			            	
			            	<div class="input-group" id="field">
			            		<input autocomplete="off" class="input form-control" id="field1" name="prof1" type="text" placeholder="Nombre del Periodo" data-items="8"/>
			            		<span class="input-group-btn"> 
			            			<button id="btn" class="btn btn-primary add-more" type="button"><i class="glyphicon glyphicon-plus"></i></button>
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
	
		<script type="text/javascript">
		$(document).ready(function() {
			var idPeriodo = 0;
			$("#btn").click(function(e){
				idPeriodo++;
				
				var btn = $('<button/>', {
	                text: '-',
	                id: 'b'+idPeriodo,
	                class: 'btn btn-danger remove-me',
	                click: function () { 
						$('#'+$(this).attr('id').replace('b', 'periodo')).remove();
						$('#'+$(this).attr('id').replace('b', 'br')).remove();
	                }
	            });
				
				var ped = 	'<div class="input-group" id="periodo'+ idPeriodo +'">' +
								'<span class="input-group-addon" id="basic-addon1">'+ idPeriodo +'</span>' +
				    			'<input autocomplete="off" class="input form-control" id="field1" name="prof1" type="text" placeholder="Nombre del Periodo" />' +
				        		'<span id="span'+ idPeriodo +'" class="input-group-btn">'+
				        			'<div id="btn'+ idPeriodo +'"></div>'+
				        		'</span>'+
				        	'</div><br id="br'+ idPeriodo +'">';
	        	
	        	var a = $('#periodo').before($('#periodo').html()+ ped);
				
	        	$('#btn' + idPeriodo).before(btn);
	        	
	        	$( '#b' + idPeriodo ).html( "<i class='glyphicon glyphicon-minus'></i>" );
	        	
			});
		});
		</script>
			
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->