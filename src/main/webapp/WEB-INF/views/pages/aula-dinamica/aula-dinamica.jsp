<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<style>
.xicon {
	margin-top: 0px;
	position: absolute;
	margin-left: 0px;
	font: 15px bold;
	color: #FFF;
	font: message-box;
	text-decoration: none;
}

</style>
<div id="page-wrapper">

	<div class="container-fluid">
		<!-- Opcion de la tabla -->
		<div class='row'>
			<div class="col-sm-12">
				<button id="btnFormula" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm" type="button" ><i class="fa fa-plus"></i> Agregar Alumnos</button>
				<button id="btnEliminar" class="btn btn-warning"  type="button" ><i class="fa fa-trash"></i> <span>Eliminar</span></button>
				<a id="btnImprimir" class="btn btn-default pull-right" href="#"><i class="fa fa-print"></i> Imprimir</a>
			</div>

		<!-- 	<div class="col-sm-1 pull-right" >

		</div> -->
	</div>
	<br>
	<!-- Contenido Aula Modal -->
	<div id="modalSistema" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Agregar Alumnos</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div id="divEvaluaciones" class="col-sm-7">
							<div class="panel panel-default">
								<div class="panel-heading">Lista de Alumnos</div>
								<div class="panel-body">
									<div id="external-events" style="height: 180px; overflow-y: scroll;">
										<c:forEach var="listaAlumnos" items="${listAlumnos}">
										<button id="btnIdAlumno_${listaAlumnos.idCursoAlumno}" class="btn btn-default" style="text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;" style="background-color:${listaEvaluacion.color}; color:${listaEvaluacion.colorTexto};text-align: left;width: 100%;margin-bottom: 1px;margin-top: 1px;"> ${listaAlumnos.alumno.apellidos}, ${listaAlumnos.alumno.nombres}</button>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-5">
						<div class="form-horizontal">

						<div class="form-group">
							<label class="control-label col-sm-4" for="pwd">Color de Fondo:</label>
							<div class="col-sm-8">
								<div id="divColorFondo" class="input-group colorpicker-component">
									<input id="color" name="color" class="form-control"
									value='<c:out value="${evaluacion.color}"></c:out>'
									readonly="readonly" required> <span
									class="input-group-addon"><i></i></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="pwd">Color de Letra:</label>
							<div class="col-sm-8">
								<div id="divColorTexto" class="input-group colorpicker-component">
									<input id="colorTexto" name="colorTexto" class="form-control"
									value='<c:out value="${evaluacion.colorTexto}"></c:out>'
									readonly="readonly"> <span class="input-group-addon"><i></i></span>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div class="modal-footer">

			<button id="btnNota" class="btn btn-default pull-left"
			data-dismiss="modal">Salir</button>
		</div>
	</div>
</div>
</div>
<!-- / Contenido Modal -->



<div id="identificador" style="display: none;">hola</div>
<div id="coordenadas" style="display: none;">hola</div>

<form:form action="saveAulaDinamica"  style="display: none;" method="post"
modelAttribute="aulaDinamica">
<form:input path="idAulaDinamica" />

<form:input path="cursoAlumno.idCursoAlumno" id="idCursoAlumno" />
<form:input path="coordX" />
<form:input path="coordY" />
<form:input path="colorFondo" />
<form:input path="colorTexto" />
<form:input path="estado" />
<button type="submit" style="display: none;">Guardar</button>
</form:form>
<div id="aulaBox" class="row">
	<div id="aula" class="col-lg-12" style="border: 1px black solid; height: 400px; position: relative;">
		<c:forEach var="lista" items="${listAulaDinamica}">
		<div id="alumno_${lista.idAulaDinamica}" class="principal"	style="left:${lista.coordX}px; top:${lista.coordY}px; width:60px; height:85px; background:#${lista.colorFondo}; position: absolute; border-radius: 4px 4px 4px 4px">
			<a style="left: 50px; top: -1px; color: ${lista.idAulaDinamica};" onclick="eliminarAlumno(${lista.idAulaDinamica})" class='xicon' title='Quitar'>&times;</a>
			<div id="${lista.idAulaDinamica}" style='color:#${lista.colorTexto}; text-align: center; font-size: 12px;'>
				${lista.idAulaDinamica}
			</div>
			<div id="${lista.idAulaDinamica}" style='color:#${lista.colorTexto}; text-align: center; font-size: 12px;'>
				${lista.cursoAlumno.alumno.nombres}, ${lista.cursoAlumno.alumno.apellidos}
			</div>
		</div>
	</c:forEach>
</div>
</div>

<script type="text/JavaScript">


	function inicializar(){
		$('#btnImprimir').click(function() {
			var myStyle = '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" /> ';
			var myStyle2 = "<style>.xicon {  margin-top: 0px; position: absolute;  margin-left: 0px; font: 15px bold; color: #FFF; font: message-box; text-decoration: none; } </style>"
			var w=window.open(null, 'Print_Page', 'scrollbars=yes');        
			w.document.write(myStyle + myStyle2 + $('#aulaBox').html());
			w.document.close();
			w.print();
		});
		$('#divColorFondo').colorpicker({
			color: '#2f2f30',
			format: "hex",
			colorSelectors: {
				'black': '#000000',
				'white': '#ffffff',
				'red': '#FF0000',
				'default': '#000000',
				'primary': '#337ab7',
				'success': '#5cb85c',
				'info': '#5bc0de',
				'warning': '#f0ad4e',
				'danger': '#d9534f'
			}
		});

		$('#btnEliminar').click(function (){
			if(opcion==0){
				opcion=1;
				$('#btnEliminar span').html("Cancelar Eliminar");
				$('#btnFormula').css("display","none");
				
			}else{
				opcion=0;
				$('#btnEliminar span').html("Eliminar");
				$('#btnFormula').css("display","inline");
			}
		});
		$('#divColorTexto').colorpicker({
			color: '#ffffff',
			format: "hex",
			colorSelectors: {
				'black': '#000000',
				'white': '#ffffff',
				'red': '#FF0000',
				'default': '#777777',
				'primary': '#337ab7',
				'success': '#5cb85c',
				'info': '#5bc0de',
				'warning': '#f0ad4e',
				'danger': '#d9534f'
			}
		});
		$('#aula').mousemove(function(event) {
			console.log(".mousemove(function "+id);
			if (id != null) {
				console.log("$('#aula').mousemove(function entro "+id);
				var p = $('#' + id);
				var position = p.position();
				$('#coordX').val(position.left);
				$('#coordY').val(position.top);
				$('#coordenadas').text("left: " + position.left+ ", top: "+ position.top);
			}else{
				// console.log("$('#aula').mousemove(function entro"+id);
			}
		});
		
	}
	var color;
	function hexc(colorval) {
		var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
		delete (parts[0]);
		for (var i = 1; i <= 3; ++i) {
			parts[i] = parseInt(parts[i]).toString(16);
			if (parts[i].length == 1)
				parts[i] = '0' + parts[i];
		}

		return parts.join('');
	}
	var id;
	$(document).ready(function() {
		inicializar();
		agregarMetodos();


		/* Funcion click del boton Aceptar de la pagina modal para guardar nota*/
		$('#divEvaluaciones button').click(function() {
			
			var idAlumno = $(this).attr('id');
			var iColor =  $('#' + idAlumno ).css('background-color');
			$('#' + idAlumno ).toggle("slide");
			idAlumno = idAlumno.replace('btnIdAlumno_', '');
			var colorTexto= hexc($('#divColorTexto i' ).css('background-color'));
			var colorFondo= hexc($('#divColorFondo i').css('background-color'));



			$('#idAulaDinamica').val(0);
			$('#cursoAlumno.idCursoAlumno').val(idAlumno);
			$('#coordX').val(5);
			$('#coordY').val(5);
			$('#colorFondo').val(hexc(iColor));

			var datos={
				idAulaDinamica:0,
				cursoAlumno:idAlumno,
				coordX:5,
				coordY:5,
				colorFondo:colorFondo,
				colorTexto:colorTexto
			};
			var nombre =$(this).html() ;

			/* Guardando Datos*/
			var formulario = $("#aulaDinamica").serialize();

			id = null;
			console.log("saveAulaDinamica2 divEvaluaciones button");
			$.post("saveAulaDinamica2",datos, function(data) {
				console.log("saveAulaDinamica2 divEvaluaciones button ------");
				var texto="<div " + "id='alumno_" +  data.idAlumno + "' class='principal ui-draggable ui-draggable-handle' " +	"style='left:5px; top:5px; width:60px; height:85px; background:#" + colorFondo + "; color:#"+colorTexto+"; position: absolute; border-radius: 4px 4px 4px 4px' >" +"<a style='left: 50px; top: -1px' onclick='eliminarAlumno("+  data.idAlumno +")' class='xicon' title='Quitar'>&times;</a><div style='color: #"+colorTexto+"; text-align: center; font-size: 12px;'>" + data.idAlumno + "</div>" + 
				"<div style='color:#"+colorTexto+"; text-align: center; font-size: 12px;'>"+nombre+"</div>" +
				"</div>";

				$('#aula').append(texto);

				agregarMetodoAlumno(data.idAlumno);
			});
		});
	});
	var opcion=0;
	function eliminarAlumno(iden){
		console.log("eliminarAulaDinamica");
		$.get("eliminarAulaDinamica/"+iden,{}, function(data) {
			console.log("eliminarAulaDinamica------");
			$("#alumno_"+iden).remove();
		});
	}
	function agregarMetodoAlumno(iden){
		console.log("el id "+ iden)
		$("#alumno_"+iden).draggable({
			stack : "#aula div",
			containment : "#aula"
		});
		$("#alumno_"+iden).mousedown(function() {

			var id_alumno = $(this).attr('id').replace('alumno_', '');
			

			if(opcion==0){
				id = $(this).attr('id');
				// console.log(id);
				$('#idAulaDinamica').val(id.replace('alumno_', ''));
				$('#identificador').text(id);

				color = hexc($('#' + id).css("backgroundColor"));

				$('#colorFondo').val(color);
				$('#cursoAlumno.idCursoAlumno').val($('#idAula').text());
			}

		});
		$("#alumno_"+iden).mouseup(function() {
			var id_alumno = $(this).attr('id').replace('alumno_', '');
			console.log(id_alumno);
			if(opcion==0){
				var formulario = $("#aulaDinamica").serialize();
				id = null;
				console.log("saveAulaDinamica2 div.principal");
				$.post("saveAulaDinamica2",formulario, function(data) {
					console.log("saveAulaDinamica2 div.principal--------");
				});
			}
			else{
				// alert("eliminara");
				eliminarAlumno(id_alumno);
			}

		});
	}


	function agregarMetodos(){
		$("#aula div.principal").draggable({
			stack : "#aula div",
			containment : "#aula"
		});
		$('div.principal').mousedown(function() {
			if(opcion==0){
				id = $(this).attr('id');

				$('#idAulaDinamica').val(id.replace('alumno_', ''));
				$('#identificador').text(id);

				color = hexc($('#' + id).css("backgroundColor"));

				$('#colorFondo').val(color);
				$('#cursoAlumno.idCursoAlumno').val($('#idAula').text());
			}
		});


		$('#aula div.principal').mouseup(function() {

			var id_alumno = $(this).attr('id').replace('alumno_', '');
			console.log(id_alumno);
			if(opcion==0){
				var formulario = $("#aulaDinamica").serialize();

				id = null;
				console.log("saveAulaDinamica2 div.principal");
				$.post("saveAulaDinamica2",formulario, function(data) {
					console.log("saveAulaDinamica2 div.principal--------");
				});
			}else{
				// alert("eliminara");
				eliminarAlumno(id_alumno)
			}
		});
	}
</script>

<!-- Resgistros de la tabla -->
<div class="row" style="display: none;">
	<!-- 		<div class="row"> -->
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
						<td>${lista.coordX}</td>
						<td>${lista.coordY}</td>
						<td>${lista.colorFondo}</td>
						<td style="text-align: center" width="100px"><a
							class="btn btn-sm btn-warning btn-sm"
							href="editAlumno?id=${lista.idAulaDinamica}"><i
							class="fa fa-pencil-square-o"></i></a> <a
							class="btn btn-sm btn-danger btn-sm"
							href="deleteAlumno?id=${lista.idAulaDinamica}"><i
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