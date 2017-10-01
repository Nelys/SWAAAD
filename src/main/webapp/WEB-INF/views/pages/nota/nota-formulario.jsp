<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<style>
	.jumbotron{
		margin-top: 20px;
	}
		h2{
			font-family: 'Lora', serif;
		}
		.text{
			margin-right: auto;
			margin-left: auto;
			font-size: 18px;
			width: 254px;
		}
		.btn{
			margin-bottom: 5px;
/* 			color: black; */
		}
		.btnWidth{
			width: 46px;
		}
		.parenthesis{
			width: 43px;
		}
		.plusMinus{
			padding-right: 12px;
			padding-left: 12px;
		}
	
	/* media query so .jumbotron can resize on screens below 600px */
	@media screen and (min-width:600px){
		.jumbotron{
			width: 100%;
			margin-right: auto;
			margin-left: auto;
		}
	}
</style>
<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-6">
				<h1>Formulario Evaluacion</h1>
				<form:form action="saveEvaluacion" method="post" modelAttribute="evaluacion" cssClass="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">ID</label>
						<div class="col-sm-10">
							<form:input path="idEvaluacion" cssClass="form-control"  />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Nombre:</label>
						<div class="col-sm-10">
							<form:input path="nombre" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Descripcion:</label>
						<div class="col-sm-10">
							<form:input path="descripcion" cssClass="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Color de Fondo:</label>
						<div  class="col-sm-10">
							<div id="divColorFondo" class="input-group colorpicker-component">
<!-- 								<input id="idColor" type="text" class="form-control" value="#00AABB"> -->
								<form:input path="color" cssClass="form-control" />
								<span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Color de Letra:</label>
						<div  class="col-sm-10">
							<div id="divColorTexto" class="input-group colorpicker-component">
<!-- 								<input id="idColorTexto" type="text" class="form-control" value="#00AABB"> -->
								<form:input path="colorTexto" cssClass="form-control" />
								<span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Sistema:</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Sistema de Evaluación" >
								<span class="input-group-btn">
									<button class="btn btn-primary" data-toggle="modal" data-target="#sistema" type="button">Sistema</button>
								</span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a class="btn btn-default" href="listNota">Cancelar</a>
							<button class="btn btn-success" type="submit" >Guardar</button>
						</div>
					</div>

				</form:form>
				
				<!-- Contenido nota Modal readonly -->
				<div id="sistema" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      	<div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Sistema de Evaluación</h4>
				        </div>
				        <div class="modal-body">
				        	<div class="container-fluid">
								<div class="row form-group text-center">
									<div id="divFormula"  style="border-radius: 4px 4px 4px 4px; height: 70px; border: 1px solid #9c9c9c;width: 100%;overflow-x: auto;	 white-space: nowrap; resize: none;  font-size: 26px; " ></div>
								</div>
							</div>
							<div class="row">
							
								<div id="divCalculo" class="col-sm-5">
									<div class="row text-center">
										<button id="btn7" class="btn btn-warning btn-lg input" value="7">7</button>
										<button id="btn8" class="btn btn-warning btn-lg input" value="8">8</button>
										<button id="btn9" class="btn btn-warning btn-lg input" value="9">9</button>
										<button id="btnSuma" class="btn btn-warning btn-lg btnWidth input" value="+">+</button>
									</div>
									<div class="row text-center">
										<button id="btn4" class="btn btn-warning btn-lg input" value="4">4</button>
										<button id="btn5" class="btn btn-warning btn-lg input" value="5">5</button>
										<button id="btn6" class="btn btn-warning btn-lg input" value="6">6</button>
										<button id="btnResta" class="btn btn-warning btn-lg input btnWidth" value="-">-</button>
									</div>
									<div class="row text-center">
										<button id="btn1" value="1" class="btn btn-warning btn-lg input">1</button>
										<button id="btn2" value="2" class="btn btn-warning btn-lg input">2</button>
										<button id="btn3" value="3" class="btn btn-warning btn-lg input">3</button>
										<button id="btnMultiplicacion" class="btn btn-warning btn-lg input btnWidth" value="*">*</button>
									</div>
									<div class="row text-center">
										<button id="btnAbrir" class="btn btn-warning btn-lg input parenthesis" value="(">(</button>
										<button id="btn0" value="0" class="btn btn-warning btn-lg input">0</button>
										<button id="btnCerrar" class="btn btn-warning btn-lg input parenthesis" value=")">)</button>
										<button id="btnDividir" class="btn btn-warning btn-lg input btnWidth" value="/">/</button>
										
									</div>
									<div class="row text-center">
										<button id="btnBorrar" class="btn btn-warning btn-lg input"><i class="fa fa-long-arrow-left"></i></button>
										<button id="btnPunto" class="btn btn-warning btn-lg input" value=".">.</button>
<!-- 										<button id="btnFormula" >Formula</button> -->
									</div>
								</div>
								
								<div id="divEvaluaciones" class="col-sm-7">
									<div class="panel panel-default">
										<div class="panel-heading">Evaluaciones</div>
										<div class="panel-body">
											<div id="external-events" style="height: 180px;overflow-y: scroll;">
												<c:forEach var="listaEvaluacion" items="${listEvaluaciones}">
													<button id="btnIdEvaluacion_${listaEvaluacion.idEvaluacion}" class="btn btn-default"  style="background-color:${listaEvaluacion.color}; color:#ffffff;text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;"><b>${listaEvaluacion.nombre}</b><span style="font-size: 12px;">: ${listaEvaluacion.descripcion}</span></button>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>

				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
				          <button id="buttonNota"  class="btn btn-success" data-dismiss="modal">Aceptar</button>
				        </div>
				    </div>
				  </div>
				</div>
				<!-- / Contenido Modal -->
				
			</div>
		</div>
		<!-- /.row -->
	<script>
		
		$(function() {
		    $('#divColorFondo').colorpicker({
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
		    
		    $('#divColorTexto').colorpicker({
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
		});
		
		/**
		 * Funciones de la pagina cargada
		 */
		$(document).ready(function() {
			
			/**
			 * Evento click de los botones de calculo
			 */
			$(document).on("click", "#divCalculo button", function(e) {
				
				// Obteniendo el id del elemento td
				var id = $(this).attr('id');
				
				$( '#divFormula' ).html($( '#divFormula' ).html()+$( '#' + id ).val());

			});
			
			/**
			 * Evento click de los botones de las evaluaciones
			 */
			$(document).on("click", "#divEvaluaciones button", function(e) {
				
				
				// Obteniendo el id del elemento td
				var id = $(this).attr('id');
				
				var idEvaluacion = id.replace('btnIdEvaluacion_', '');
				
				var a = $('#' + id ).css('background-color')
				
				//console.log(id + " " +a);
				
				$( '#divFormula' ).html($( '#divFormula' ).html() + 
						"<div " + "id='idEvaluacion_" +  idEvaluacion + "' " +
							"style='display: inline-block;white-space: nowrap; border-radius: 4px 4px 4px 4px; padding-right: 6px; padding-left: 6px; margin-top: 7px; margin-right: 1px; margin-left: 1px;" + 
							"background-color:" +  $('#' + id ).css('background-color') +
							"; color:" +  $('#' + id ).css('color') + 
						"'>" + 
							$('#' + id  + ' b').html() + 
						"</div>");
				
				//$('#' + id ).toggle("slide");
				
				$('#' + id ).toggle("slide");

			});

			/**
			 * Funcion para borrar el ultimo caracter
			 */
			$('#btnBorrar').click(function() {
				
				// Obtener el contenido de div formula
				var txtContenido = $('#divFormula').html();
				
				// Obtener ultimo caracter
				var txtCaracter = txtContenido.substring(txtContenido.length, txtContenido.length - 1);
				
				// Elimina un elemento o caracter
				if (txtCaracter==">"){
					// Elimina elementos
					var id = $('#divFormula').children().last().attr('id');
					
					var idEvaluacion = id.replace('idEvaluacion_', 'btnIdEvaluacion_');
					
					$('#' + idEvaluacion ).toggle("slide");
					
					$('#divFormula').children().last().remove();
					
					
				} else {
					// Elimina caracteres
					$('#divFormula').html(function (_,txt) {
					    return txt.slice(0, -1);
					});
				}

			});
			
			/**
			 * Funcion para borrar el ultimo caracter
			 */
			$('#btnFormula').click(function() {
				
				//$('#divFormula').children('div').each(function () {
				$('#divFormula > div').each(function () {
				    console.log($(this).html()); // "this" is the current element in the loop
				});
				
// 				// Obtener el contenido de div formula
// 				var txtContenido = $('#divFormula').html();
				
// 				// Obtener ultimo caracter
// 				var txtCaracter = txtContenido.substring(txtContenido.length, txtContenido.length - 1);
				
// 				// Elimina un elemento o caracter
// 				if (txtCaracter==">"){
// 					// Elimina elementos
// 					var id = $('#divFormula').children().last().attr('id');
					
// 					var idEvaluacion = id.replace('idEvaluacion_', 'btnIdEvaluacion_');
					
// 					$('#' + idEvaluacion ).toggle("slide");
					
// 					$('#divFormula').children().last().remove();
					
					
// 				} else {
// 					// Elimina caracteres
// 					$('#divFormula').html(function (_,txt) {
// 					    return txt.slice(0, -1);
// 					});
// 				}

			});
		});
	</script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->