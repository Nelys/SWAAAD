//Default Form
$(document).ready(function() {
  $('#alumno').bootstrapValidator({
    message: 'Este valor es invalido',
    feedbackIcons: {
      valid: 'fa fa-check',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    },
    fields: {
    	nombres: {
        message: 'no es valido',
        validators: {
          notEmpty: {
            message: 'DAto necesario'
          },
          stringLength: {
            min: 2,
            max: 20,
            message: 'Minimo 2 - maximo 20 caracteres'
          },
          regexp: {
            regexp: /^[a-zA-Z ]+$/,
//            regexp: /^[a-zA-Z0-9_\.]+$/,
            message: 'el nombre puede contener solo letras de la A-Z'
          }
        }
      },
      
      apellidos: {
            message: 'no es valido',
            validators: {
              notEmpty: {
                message: 'Dato necesario'
              },
              stringLength: {
                min: 2,
                max: 20,
                message: 'Minimo 2 - maximo 20 caracteres'
              },
              regexp: {
                regexp: /^[a-zA-Z ]+$/,
                message: 'el nombre puede contener solo letras de la A-Z'
              }
            }
          },
          
       email: {
              validators: {
                notEmpty: {
                  message: 'El email es requerido y no puede estar vacio'
                },
                emailAddress: {
                  message: 'El email ingresado es invalido'
                }
              }
            }, 
    } 

  });
});

$(document).ready(function() {
	 $('#saveCurso').bootstrapValidator({
		 
		 
		 
		 
		 
	 });
});

