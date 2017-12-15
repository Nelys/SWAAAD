<%@page import="com.swaaad.model.ActividadPedagogica"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
				<%@ page session="false"%>

					<style>
						#calendar {
							max-width: 900px;
							margin: 0 auto;
						}
					</style>

					<div class='row'>
						<div class="col-md-12">
							<a class="btn btn-success" href="newActividadPedagogica">
								<i class="fa fa-plus"></i> Nuevo</a>
							<a class="btn btn-default" href="actividades-pedagogicas">
								<i class="fa fa-list"></i> Listado</a>
							<button id="btnImprimir" class="btn btn-default pull-right">
								<i class="fa fa-print"></i> Imprimir
							</button>
						</div>

					</div>
					<br>

					<div class='row'>
						<div id="calendarBox" class="col-md-12">
							<div id='calendar'></div>
						</div>
					</div>

					<div class="row">
						<div class="result"></div>
					</div>

					<script type="text/javascript">
						// 	var array_fechas = [

						// 		];

						// Calendar	


						// Datatable
						$(document).ready(function () {
							$.get("getActividades/1", {}, function (result) {
								// console.log(result);

								// alert(result.data.actividades2);

								$('#calendar').fullCalendar({
									header: {
										left: 'prev,next today',
										center: 'title',
										right: 'month,basicWeek,basicDay'
									},
									defaultDate: '2017-12-12',
									navLinks: true,
									editable: false,
									eventLimit: true,
									events: result.data.actividades2
								});
								// setTimeout(function () { location.href = 'login'; }, 2000);
							}, 'json');


							$('#btnImprimir').click(function () {
								var myStyle = ''
									+ '<link href=<c:url value="/resources/template/css/bootstrap.min.css" /> rel="stylesheet" > '
									+ '<link href=<c:url value="/resources/template/css/calendar/fullcalendar.css" /> rel="stylesheet" /> ';
								var w = window.open(null,
									'Print_Page',
									'scrollbars=yes');
								w.document
									.write(myStyle
									+ '<div style="width: 800px;" >'
									+ $('#calendarBox')
										.html()
									+ '</div>');
								w.document.close();
								w.print();
							});

							var table = $('#miTable').DataTable({
								"language": {
									"emplyTable": "No hay datos disponible en la tabla.",
									"lengthMenu": "Mostrar _MENU_ registros",
									"info": "Pagina _PAGE_ de _PAGES_",
									"infoEmpty": "No hay registros disponibles.",
									"infoFiltered": "(Busqueda de _MAX_ Registros)",
									"loadingRecords": "Cargando...",
									"processing": "Prosesando...",
									"search": "Buscar:",
									"zeroRecords": "No hay registros de busqueda.",
									"paginate": {
										"previous": "Anterior",
										"next": "Siguiente"
									}
								},
								dom: 'Bfrtip',
								buttons: [
									{
										text: '<i class="fa fa-plus"></i> Nuevo',
										action: function (e,
											dt, node,
											config) {
											window.location.href = 'newActividadPedagogica';
										}
									},
									{
										extend: 'excelHtml5',
										text: '<i class="fa fa-file-excel-o"></i> Excel',
										titleAttr: 'Excel',
										exportOptions: {
											columns: [0, 1, 2]
										}
									},
									{
										extend: 'pdfHtml5',
										text: '<i class="fa fa-file-pdf-o"></i> PDF',
										titleAttr: 'PDF',
										exportOptions: {
											columns: [0, 1, 2]
										}
									},
									{
										extend: 'print',
										text: '<i class="fa fa-print"></i> Print',
										titleAttr: 'print',
										exportOptions: {
											columns: [0, 1, 2]
										}
									},
									{
										text: '<i class="fa fa-print"></i> Imprimir',
										action: function (e,
											dt, node,
											config) {
											window.location.href = '#';
										}
									}]
							});

							$('#miTable_wrapper a:eq(0)')
								.removeClass("btn-default").addClass(
								"btn-success");
							$('#miTable_wrapper a:eq(1)')
								.removeClass("btn-default").addClass(
								"btn-primary");
							$('#miTable_wrapper a:eq(2)')
								.removeClass("btn-default").addClass(
								"btn-primary");

							$("#miTable_wrapper a:eq(0)").css({
								"margin-right": "4px"
							});
							$("#miTable_wrapper a:eq(1)").css({
								"margin-right": "4px"
							});
							$("#miTable_wrapper a:eq(2)").css({
								"margin-right": "4px"
							});
							$("#miTable_wrapper a:eq(3)").css({
								"margin-right": "4px"
							});
						});
					</script>
					<!-- /#page-wrapper -->