<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<script
	src="<c:url value='/resources/js/bsvalidator/bootstrapValidator.js'/>"></script>
<script src="<c:url value='/resources/js/validate-forms.js' />"></script>

<style>
.im-centered {
	margin: auto;
	max-width: 600px;
}
</style>

<div id="page-wrapper">

	<div class="container-fluid">
		<div class="im-centered">
			<div class="row">
				<div class="col-lg-12">
					<h1>Cambiar Contraseña</h1>
					<form name='docenteForm' id='docenteForm' action="cambiarPassword"
						method="post" role="form" class="form-horizontal">

						<div class="form-group ">
							<label for="password" class="sr-only">Contraseña Actual</label> <input
								type="password" class="form-control" name="password"
								id="password" placeholder="Contraseña Actual" value=""
								required="required" />
						</div>

						<div class="form-group ">
							<label for="password" class="sr-only">Nuevo Contraseña</label> <input
								type="password" class="form-control" name="nuevoPassword" id="nuevoPassword"
								placeholder="Nuevo Password" value="" required="required" />
						</div>
						<div class="form-group ">
							<label for="password" class="sr-only">Confirmar
								Contraseña</label> <input type="password" class="form-control"
								name="confirmarPassword" id="confirmarPassword" placeholder="Confirmar Password" value=""
								required="required" />
						</div>

						<div class="form-group ">
							<!-- 						<button type="submit" name="signup" class="btn btn-primary" disabled="disabled">Guardar</button> -->
							<a href="perfil" class="btn btn-primary">Cancelar</a> 
							
							 <button type="submit" class="btn btn-success pull-right">Guardar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->

</div>

<script type="text/javascript">
	$(document).ready(function() {

		$('#docenteForm')
        .bootstrapValidator({
            message: 'no esta validando',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
               
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        }
                    }
                },
            
            
                nuevoPassword: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    }
                }
            },
                
            confirmarPassword: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        }
                    }
                }
            
            }
        }).on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
                alert(result.message);
                if(result.response){
                	location.href="logout";
                }
            }, 'json');
        });
		
	});

</script>
<!-- /#page-wrapper -->