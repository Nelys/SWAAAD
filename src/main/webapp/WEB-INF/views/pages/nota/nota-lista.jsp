<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
	<style>
		/*.btn {
		    border: none;
		    color: white;
		    padding: 6px 12px;
		    font-size: 14px;
		    cursor: pointer;
		}*/
		
		td {
		    width: 40px;
		    text-align: center;
		    padding-top: 0px;
		    padding-left: 0px;
		    padding-bottom: 0px;
		    padding-right: 0px;
		    cursor: pointer;
		}
		
		.asd {background-color: #4CAF50;} /* Green */
		.asd:hover {background-color: #46a049;}
		
/* 		.info {background-color: #2196F3;} /* Blue */ */
/* 		.info:hover {background: #0b7dda;} */
		
/* 		.warning {background-color: #ff9800;} /* Orange */ */
/* 		.warning:hover {background: #e68a00;} */
		
/* 		.danger {background-color: #f44336;} /* Red */  */
/* 		.danger:hover {background: #da190b;} */
		
/* 		.default {background-color: #e7e7e7; color: black;} /* Gray */  */
/* 		.default:hover {background: #ddd;} */
		
		thead th {
		  height: 25px;
		  width: 100px;
		  padding-left: 5px;
		  padding-right: 5px;
		  line-height: 25px;
		}
		
		thead th:first-child {
		  width: 300px;
		}
		
		tbody td {
		  word-break: break-all;
		  padding: 5px;
		  border: 0;
		  width: 100px;
		  vertical-align: top;
		}
		
		tbody td:first-child {
		  width: 300px;
		}
		
		div.fTHLC-outer-wrapper {
		  /*border: 1px solid #000000;*/
		  /*margin: 50px auto;*/
		}
		
		div.fTHLC-inner-wrapper {
		  /*border: 1px dotted #000000;*/
		}
		
		div.fTHLC-outer-corner {
		  /*background-color: #ffffff;*/
		  /*border-right: 1px solid #000000;
		  border-bottom: 1px solid #000000;*/
		}
		
		table tr .cols {
		  background-color: #FFE4E1;
		}
		
		table tr .rows {
		  background-color: #E0FFFF;
		}
		
		/* texto Vertical */
		.contenedor {
		    position: relative;
		    min-height: 105px;
		}
		.alignvertical{
			position: absolute;
		    bottom: 0;
		    left: 0;
		}

		.rotate {
		    width: 100px;
		    height: 100px;
		
		    /* Rotate div */
		    -ms-transform: rotate(-90deg); /* IE 9 */
		    -webkit-transform: rotate(-90deg); /* Chrome, Safari, Opera */
		    transform: rotate-90deg);
		}
	</style>
<div id="page-wrapper">
	
	<div class="container-fluid">
		<!-- Titulo -->
		<div class='row'>
			<div class="col-md-12">
				<h2>Lista Notas</h2>
			</div>
		</div>

		<!-- Opcion de la tabla -->
		<p>
		<div class='row'>
			<div class="col-md-2">
				<a class="btn btn-success" href="#"><i class="fa fa-plus"></i> Nueva Nota</a>
			</div>

			<div class="col-md-2">
				<a class="btn btn-default" href="#"><i class="fa fa-upload"></i> Sistema Evaluativo</a>
			</div>

			<div class="col-md-5 text-right" >
				<a class="btn btn-primary" href="#"><i class="fa fa-file-pdf-o"></i> PDF</a>
				<a class="btn btn-primary" href="#"><i class="fa fa-file-excel-o"></i> Excel</a>
				<a class="btn btn-default" href="#"><i class="fa fa-print"></i> Imprimir</a>
				
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search"></i></span>
					<input type="text" class="form-control" placeholder="Buscar ..." aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		</p>
		<!-- Resgistros de la tabla -->
		<div class="row">
			<div class="col-lg-12">
				
				<div id="parent" class="table-responsive">
					<c:if test="${!empty listAlumnos}">
						<table  id="fixTable" class="table table-bordered table-hover table-striped" >
<!-- 							<table id="fixTable" class="table" cellpadding="0" cellspacing="0" align="center"> -->
<!-- 							<thead> -->
	                            <tr>
	                                <td><div class="contenedor"><span class='alignvertical'>Alumno</span></div></td>
	                                <c:forEach var="lista" items="${listPeriodos}">
	                                <td><div class='rotate'>${lista.descripcion}</div></td>
	                                </c:forEach>
	                                
	                            </tr>
<!-- 	                        </thead> -->
<!-- 	                        <tbody> -->
								<c:forEach var="lista" items="${listAlumnos}">
	                            <tr>
	                                <td style="text-align: left;">${lista.nombres}, ${lista.apellidos}</td>
	                                <td class="asd" data-toggle="modal" data-target=".bs-example-modal-sm">1265</td>
	                                <td class="default" data-toggle="modal" data-target=".bs-example-modal-sm">1265</td>
	                                <td class="primary" data-toggle="modal" data-target=".bs-example-modal-sm">1265</td>
	                                <td class="success" data-toggle="modal" data-target=".bs-example-modal-sm">1265</td>
	                                <td class="info" data-toggle="modal" data-target=".bs-example-modal-sm">1265</td>
<!-- 	                                <td class="success" onclick="window.location='http://www.google.com'">1265</td> -->
	                            </tr>
	                            </c:forEach>
						</table>
					</c:if>
					
				</div>
				<!-- Contenido nota Modal -->
				<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				  <div class="modal-dialog modal-sm" role="document">
				    <div class="modal-content">
				      	<div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Nota</h4>
				        </div>
				        <div class="modal-body">
							<form name="ejemplo2" action="11-html5-number-input.php" method="POST">
								<div align="center">
								    <p>Alumno: Aaaaaaa</p>
								    <p>Tarea 1</p>
								    <input type="number" name="edad" min="0" max="20" step="1"  required="required">
							    </div>
							</form> 
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
				          <button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
				        </div>
				    </div>
				  </div>
				</div>
				<!-- / Contenido Modal -->
			</div>
		</div>
		<!-- /.row -->
	<script>
	/*$(document).ready(function(){
	    $("td").mouseup(function(){
	        $(this).after("<p style='color:green;'>Mouse button released.</p>");
	    });
	    $("td").mousedown(function(){
	        $(this).after("<p style='color:purple;'>Mouse button pressed down.</p>");
	    });
	});*/
	$(function() {
        $('table').fixedTblHdrLftCol({
          scroll: {
            height: '100%',
            width: '100%'
          }
        });
      });
// 		$(document).ready(function() {
// 			$("#fixTable").tableHeadFixer({"head" : false, "left" : 1}); 
// 		});
//     	$(document).ready(function() {
//   		  $('.rotate').css('height', $('.rotate').width());
//   		});
    </script>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->