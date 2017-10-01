<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>


<div id="page-wrapper">
	
	<div class="container-fluid">
		<!-- Titulo -->
<!-- 		<div class='row'> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<h2>Aula</h2> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- Opcion de la tabla -->
<!-- 		<p> -->
<!-- 		<div class='row'> -->
<!-- 			<div class="col-md-1"> -->
<!-- 				<a class="btn btn-success" href="newActividadPedagogica"><i class="fa fa-plus"></i> Nuevo</a> -->
<!-- 			</div> -->

<!-- 			<div class="col-md-4"> -->
<!-- 				<a class="btn btn-default" href="newActividadPedagogica"><i class="fa fa-upload"></i> Importar</a> -->
<!-- 			</div> -->

<!-- 			<div class="col-lg-4 text-right" > -->
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a> -->
<!-- 				<a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i> Excel</a> -->
<!-- 				<a class="btn btn-default" href="#"><i class="fa fa-print"></i> Imprimir</a> -->
				
<!-- 			</div> -->
<!-- 			<div class="col-md-3"> -->
<!-- 				<div class="input-group"> -->
<!-- 					<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search"></i></span> -->
<!-- 					<input type="text" class="form-control" placeholder="Buscar ..." aria-describedby="sizing-addon2"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</p> -->
		
		<!-- Resgistros de la tabla -->
		<div id="identificador" style="display: none;">hola</div>
		<div id="coordenadas" style="display: none;">hola</div>
		
		<form:form action="saveAulaDinamica" method="post" modelAttribute="aulaDinamica">
			<form:hidden path="idAulaDinamica" />
<%-- 			<form:input path="idCurso" value="1"/> --%>
			<form:hidden path="x" />
			<form:hidden path="y" />
			<form:hidden path="color" />
			<button type="submit" style="display: none;">Guardar</button>
		</form:form>
		<div class="row">
			<div id="aula" class="col-lg-12" style="border: 1px black solid; height:400px; position: relative;">
			<c:forEach var="lista" items="${listAulaDinamica}">
				<div id="alumno_${lista.idAulaDinamica}" class="principal"  style="left:${lista.x}px; top:${lista.y}px; width:60px; height:80px; background:#${lista.color}; position: absolute; border-radius: 4px 4px 4px 4px">
					<div style="color: white; text-align: center; font-size: 100%;">Id: ${lista.idAulaDinamica}</div>
					
				</div>
			</c:forEach>
			</div>
		</div>

		<script type="text/JavaScript">

			$( function() {
			  $( "#aula div.principal" ).draggable({ stack: "#aula div", containment: "#aula" });
			} );
			
			var color;
			function hexc(colorval) {
			    var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
			    delete(parts[0]);
			    for (var i = 1; i <= 3; ++i) {
			        parts[i] = parseInt(parts[i]).toString(16);
			        if (parts[i].length == 1) parts[i] = '0' + parts[i];
			    }
			    color = parts.join('');
			}
			
			$(document).ready(function() {
				
				var id ;
				
				$('div.principal').mousedown(function(){
					id = $(this).attr('id');

					$( '#idAulaDinamica' ).val(id.replace('alumno_', ''));
					$( '#identificador' ).text(id);
					
					hexc($('#' + id).css("backgroundColor"));
					
					$( '#color' ).val(color);
			    });
				
				$('#aula').mousemove(function(event){
					if(id != null){
						var p = $('#' + id);
						var position = p.position();
						$( '#x' ).val(position.left);
						$( '#y' ).val(position.top);
						
						$( '#coordenadas' ).text( "left: " + position.left + ", top: " + position.top );
					}
			    });
				
				$('div.principal').mouseup(function(){
					$('#aulaDinamica').submit();
					id = null;
			    });
				
			});
						
		</script>
		<p></p>
		<!-- Resgistros de la tabla -->
		<div class="row" style="display: none;">
			<div class="col-lg-12">
				
				<div class="table-responsive">
					<c:if test="${!empty listAulaDinamica}">
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>ID</th>
<!-- 								<th>Curso</th> -->
								<th>Fila</th>
								<th>Columna</th>
								<th>Color</th>
								<th>ACCION</th>
							</tr>
							<c:forEach var="lista" items="${listAulaDinamica}">
								<tr>
									<td>${lista.idAulaDinamica}</td>
<%-- 									<td>${lista.curso}</td> --%>
									<td>${lista.x}</td>
									<td>${lista.y}</td>
									<td>${lista.color}</td>
									<td style="text-align:center" width="100px">
									<a class="btn btn-sm btn-warning btn-sm" href="editAlumno?id=${lista.idAulaDinamica}"><i class="fa fa-pencil-square-o"></i></a>
									<a class="btn btn-sm btn-danger btn-sm" href="deleteAlumno?id=${lista.idAulaDinamica}"><i class="fa fa-trash-o"></i></a>
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