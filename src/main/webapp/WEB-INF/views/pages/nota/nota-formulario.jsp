<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<style>
/* CkeckBox */
.btn span.glyphicon {
	opacity: 0;
}

.btn.active span.glyphicon {
	opacity: 1;
}

.jumbotron {
	margin-top: 20px;
}

h2 {
	font-family: 'Lora', serif;
}

.text {
	margin-right: auto;
	margin-left: auto;
	font-size: 18px;
	width: 254px;
}

.btn {
	margin-bottom: 5px;
	/* 			color: black; */
}

.btnWidth {
	width: 46px;
}

.parenthesis {
	width: 43px;
}

.plusMinus {
	padding-right: 12px;
	padding-left: 12px;
}

/* media query so .jumbotron can resize on screens below 600px */
@media screen and (min-width:600px) {
	.jumbotron {
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
<!-- 				<h1>Formulario Evaluación</h1> -->
				<form:form action="saveEvaluacion" method="post"
					modelAttribute="evaluacion" cssClass="form-horizontal" role="form"
					data-toggle="validator">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">ID</label>
						<div class="col-sm-10">
							<input id="idEvaluacion" name="idEvaluacion" class="form-control"
								value='<c:out value="${evaluacion.idEvaluacion}"></c:out>'
								readonly="readonly" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Nombre:</label>
						<div class="col-sm-10">
							<input id="nombre" name="nombre" class="form-control"
								maxlength="30"
								value='<c:out value="${evaluacion.nombre}"></c:out>' required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Descripcion:</label>
						<div class="col-sm-10">
							<input id="descripcion" name="descripcion" class="form-control"
								maxlength="60"
								value='<c:out value="${evaluacion.descripcion}"></c:out>'>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Color de
							Fondo:</label>
						<div class="col-sm-10">
							<div id="divColorFondo" class="input-group colorpicker-component">
								<input id="colorFondo" name="colorFondo" class="form-control"
									value='<c:out value="${evaluacion.colorFondo}"></c:out>'
									readonly="readonly" required> <span
									class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Color de
							Letra:</label>
						<div class="col-sm-10">
							<div id="divColorTexto" class="input-group colorpicker-component">
								<input id="colorTexto" name="colorTexto" class="form-control"
									value='<c:out value="${evaluacion.colorTexto}"></c:out>'
									readonly="readonly"> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Sistema:</label>
						<div class="col-sm-10">
							<div class="input-group">
								<form:hidden path="formula" class="form-control"
									placeholder="Sistema de Evaluación" />
								<div class="btn-group" data-toggle="buttons">
									<label for="esFormula"
										class="btn btn-primary <c:if test="${evaluacion.esFormula == 1}">active</c:if> ">
										<input type="checkbox" id="esFormula" name="esFormula"
										value='<c:out value="${evaluacion.esFormula}"></c:out>'
										<c:if test="${evaluacion.esFormula == 1}">checked</c:if>>
										<span class="glyphicon glyphicon-ok"></span>
									</label> <span class="input-group-btn">
										<button id="btnFormula" class="btn btn-primary"
											data-toggle="modal" data-target="#modalSistema" type="button"
											<c:if test="${evaluacion.esFormula == 0}">disabled</c:if>>Sistema</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Eliminar</button>
							<div class="pull-right">
								<a class="btn btn-default" href="listNota">Cancelar</a>
								<button class="btn btn-success" type="submit">Guardar</button>
							</div>
						</div>
					</div>

				</form:form>

				<!-- Contenido nota Modal readonly -->
				<div id="modalSistema" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Sistema de Evaluación</h4>
							</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="row form-group text-center">
										<div id="divFormula"
											style="border-radius: 4px 4px 4px 4px; height: 70px; border: 1px solid #9c9c9c; width: 100%; overflow-x: auto; white-space: nowrap; resize: none; font-size: 26px;"></div>
									</div>
								</div>
								<div class="row">

									<div id="divCalculo" class="col-sm-5">
										<div class="row text-center">
											<button id="btn7" class="btn btn-warning btn-lg input"
												value="7">7</button>
											<button id="btn8" class="btn btn-warning btn-lg input"
												value="8">8</button>
											<button id="btn9" class="btn btn-warning btn-lg input"
												value="9">9</button>
											<button id="btnSuma"
												class="btn btn-warning btn-lg btnWidth input" value="+">+</button>
										</div>
										<div class="row text-center">
											<button id="btn4" class="btn btn-warning btn-lg input"
												value="4">4</button>
											<button id="btn5" class="btn btn-warning btn-lg input"
												value="5">5</button>
											<button id="btn6" class="btn btn-warning btn-lg input"
												value="6">6</button>
											<button id="btnResta"
												class="btn btn-warning btn-lg input btnWidth" value="-">-</button>
										</div>
										<div class="row text-center">
											<button id="btn1" value="1"
												class="btn btn-warning btn-lg input">1</button>
											<button id="btn2" value="2"
												class="btn btn-warning btn-lg input">2</button>
											<button id="btn3" value="3"
												class="btn btn-warning btn-lg input">3</button>
											<button id="btnMultiplicacion"
												class="btn btn-warning btn-lg input btnWidth" value="*">*</button>
										</div>
										<div class="row text-center">
											<button id="btnAbrir"
												class="btn btn-warning btn-lg input parenthesis" value="(">(</button>
											<button id="btn0" value="0"
												class="btn btn-warning btn-lg input">0</button>
											<button id="btnCerrar"
												class="btn btn-warning btn-lg input parenthesis" value=")">)</button>
											<button id="btnDividir"
												class="btn btn-warning btn-lg input btnWidth" value="/">/</button>

										</div>
										<div class="row text-center">
											<button id="btnBorrar" class="btn btn-warning btn-lg input">
												<i class="fa fa-long-arrow-left"></i>
											</button>
											<button id="btnPunto" class="btn btn-warning btn-lg input"
												value=".">.</button>
											<!-- 										<button id="btnFormula" >Formula</button> -->
										</div>
									</div>

									<div id="divEvaluaciones" class="col-sm-7">
										<div class="panel panel-default">
											<div class="panel-heading">Evaluaciones</div>
											<div class="panel-body">
												<div id="external-events"
													style="height: 180px; overflow-y: scroll;">
													<c:forEach var="listaEvaluacion"
														items="${listEvaluaciones}">
														<c:if test="${listaEvaluacion.idEvaluacion!=evaluacion.idEvaluacion}">
															<button
																id="btnIdEvaluacion_${listaEvaluacion.idEvaluacion}"
																class="btn btn-default"
																style="background-color:${listaEvaluacion.colorFondo}; color:${listaEvaluacion.colorTexto};text-align: left;width: 100%; margin-bottom: 1px;margin-top: 1px;">
																<b>${listaEvaluacion.nombre}</b><span
																	style="font-size: 12px;">:
																	${listaEvaluacion.descripcion}</span>
															</button>
														</c:if>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left"
									data-dismiss="modal">Cancelar</button>
								<button id="btnNota" class="btn btn-success"
									data-dismiss="modal">Aceptar</button>
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
			$('#esFormula').change(function(){
				if($('#esFormula').prop('checked')== true){
					$('#esFormula').val(1);
					$('#btnFormula').prop('disabled', false);
				} else {
					$('#esFormula').val(0);
					$('#btnFormula').prop('disabled', true);
				}
				
// 				console.log($('#esFormula').val());
// 				$('#esFormula').prop('checked', true);
		    });
			
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
							"style='border: 1px solid #e0e0e0;display: inline-block;white-space: nowrap; border-radius: 4px 4px 4px 4px; padding-right: 6px; padding-left: 6px; margin-top: 7px; margin-right: 1px; margin-left: 1px;" + 
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
			 * Funcion formula
			 */
			$('#btnNota').click(function() {
				
				var sTextFormula = $('#divFormula').text();
				
				$('#divFormula > div').each(function () {

				    sTextFormula = sTextFormula.replace($(this).text(), $(this).attr('id'));
				});
// 				console.log(sTextFormula);
				$( '#formula' ).val(sTextFormula);
				
				// show when page load
			    toastr.info('Page Loaded!', 'sdfds');

			    toastr.error('Click Button');

				
			});
			
			/**
			 * Funcion click (Obtener Formula)
			 */
			$('#btnFormula').click(function() {
				var divFormula = $("#formula").val();
				var divFormulaFija = $("#formula").val();
// 				console.log(divFormula);
// 				console.log(divFormula.indexOf("idEvaluacion_"));
				
				var a = 0;
				var idEvaluacion='';
				var id=0;
				
				while(divFormula.indexOf("idEvaluacion_")!=-1){
					a = divFormula.indexOf("idEvaluacion_")+13;
					
					for (i = a; i <= divFormula.length-1; i++) { 
// 						console.log(divFormula.substring(i, i+1));
// 						console.log(Number.isInteger(parseInt(divFormula.substring(i, i+1))));
						id = parseInt(divFormula.substring(i, i+1));
						if(Number.isInteger(parseInt(divFormula.substring(i, i+1)))){
							idEvaluacion= divFormula.substring(divFormula.indexOf("idEvaluacion_"), i+1);							
// 							console.log(idEvaluacion);	
							break;
						} 
					}
					
					divFormula = divFormula.substring(a, divFormula.lenght);
					$.ajax({
						type : "POST",
						url: "${pageContext.request.contextPath}/generarFormula/" +id,
						success :function(search) {
							
							$('#btnIdEvaluacion_' + id ).toggle("slide");
							$('#btnIdEvaluacion_' + id ).toggle("slide");
							
							divFormulaFija = divFormulaFija.replace(idEvaluacion, 
									"<div " + "id='idEvaluacion_" +  id + "' " +
										"style='border: 1px solid #e0e0e0;display: inline-block;white-space: nowrap; border-radius: 4px 4px 4px 4px; padding-right: 6px; padding-left: 6px; margin-top: 7px; margin-right: 1px; margin-left: 1px;" +
										"background-color:" +  search['colorFondo'] +
										"; color:" +  search['colorTexto'] + 
									";'>" + 
									search['nombre'] +
									"</div>");
							console.log(divFormulaFija);
							$( '#divFormula' ).html(divFormulaFija);
				  		},async: false,
						error: function(x,e){	
							toastr.error('Formula mal obtenida: ' + e + x, 'Error');
						} 
					});
				}
			});
		});
	</script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->