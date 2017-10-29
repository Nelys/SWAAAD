// validación Registro 
$(document)
		.ready(
				function() {
					$('#registroForm')
							.bootstrapValidator(
									{
										message : 'Este valor es invalido',
										feedbackIcons : {
											valid : 'fa fa-check',
											invalid : 'fa fa-times',
											validating : 'fa fa-refresh'
										},
										fields : {
											username : {
												message : 'no es valido',
												validators : {
													notEmpty : {
														message : 'Dato necesario'
													},
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														// regexp:
														// /^[a-zA-Z0-9_\.]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

//											apellidos : {
//												message : 'no es valido',
//												validators : {
//													notEmpty : {
//														message : 'Dato necesario'
//													},
//													stringLength : {
//														min : 2,
//														max : 50,
//														message : 'Minimo 2 - maximo 50 caracteres'
//													},
//													regexp : {
//														regexp : /^[a-zA-Z ]+$/,
//														message : 'el nombre puede contener solo letras de la A-Z'
//													}
//												}
//											},
//
//											email : {
//												validators : {
//													notEmpty : {
//														message : 'El email es requerido y no puede estar vacio'
//													},
//													emailAddress : {
//														message : 'El email ingresado es invalido'
//													}
//												}
//											},
//
//											// contrasena : {
//											// validators : {
//											// notEmpty : {
//											// message : 'El password es
//											// requerido no puede estar vacio'
//											// },
//											// identical : {
//											// field : 'confirmPassword',
//											// message : 'The password and its
//											// confirm are not the same'
//											// }
//											// }
//											// },
//
//											nombresApoderado : {
//												message : 'no es valido',
//												validators : {
//													// notEmpty : {
//													// message : 'Dato
//													// necesario'
//													// },
//													stringLength : {
//														min : 2,
//														max : 50,
//														message : 'Minimo 2 - maximo 50 caracteres'
//													},
//													regexp : {
//														regexp : /^[a-zA-Z ]+$/,
//														// regexp:
//														// /^[a-zA-Z0-9_\.]+$/,
//														message : 'el nombre puede contener solo letras de la A-Z'
//													}
//												}
//											},
//
//											apellidosApoderado : {
//												message : 'no es valido',
//												validators : {
//													// notEmpty : {
//													// message : 'Dato
//													// necesario'
//													// },
//													stringLength : {
//														min : 2,
//														max : 50,
//														message : 'Minimo 2 - maximo 50 caracteres'
//													},
//													regexp : {
//														regexp : /^[a-zA-Z ]+$/,
//														message : 'el nombre puede contener solo letras de la A-Z'
//													}
//												}
//											},

											emailApoderado : {
												validators : {
													// notEmpty : {
													// message : 'El email es
													// requerido y no puede
													// estar vacio'
													// },
													emailAddress : {
														message : 'El email ingresado es invalido'
													}
												}
											},

										}

									});
				});


//Alumno
$(document)
		.ready(
				function() {
					$('#alumno')
							.bootstrapValidator(
									{
										message : 'Este valor es invalido',
										feedbackIcons : {
											valid : 'fa fa-check',
											invalid : 'fa fa-times',
											validating : 'fa fa-refresh'
										},
										fields : {
											nombres : {
												message : 'no es valido',
												validators : {
													notEmpty : {
														message : 'Dato necesario'
													},
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														// regexp:
														// /^[a-zA-Z0-9_\.]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

											apellidos : {
												message : 'no es valido',
												validators : {
													notEmpty : {
														message : 'Dato necesario'
													},
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

											email : {
												validators : {
													notEmpty : {
														message : 'El email es requerido y no puede estar vacio'
													},
													emailAddress : {
														message : 'El email ingresado es invalido'
													}
												}
											},

											// contrasena : {
											// validators : {
											// notEmpty : {
											// message : 'El password es
											// requerido no puede estar vacio'
											// },
											// identical : {
											// field : 'confirmPassword',
											// message : 'The password and its
											// confirm are not the same'
											// }
											// }
											// },

											nombresApoderado : {
												message : 'no es valido',
												validators : {
													// notEmpty : {
													// message : 'Dato
													// necesario'
													// },
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														// regexp:
														// /^[a-zA-Z0-9_\.]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

											apellidosApoderado : {
												message : 'no es valido',
												validators : {
													// notEmpty : {
													// message : 'Dato
													// necesario'
													// },
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

											emailApoderado : {
												validators : {
													// notEmpty : {
													// message : 'El email es
													// requerido y no puede
													// estar vacio'
													// },
													emailAddress : {
														message : 'El email ingresado es invalido'
													}
												}
											},

										}

									});
				});

// Curso
$(document)
		.ready(
				function() {
					$('#curso')
							.bootstrapValidator(
									{
										message : 'Este valor es invalido',
										feedbackIcons : {
											valid : 'fa fa-check',
											invalid : 'fa fa-times',
											validating : 'fa fa-refresh'
										},
										fields : {
											nombreCurso : {
												message : 'no es valido',
												validators : {
													notEmpty : {
														message : 'Dato necesario'
													},
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														// regexp:
														// /^[a-zA-Z0-9_\.]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

											institucion : {
												message : 'no es valido',
												validators : {
//													notEmpty : {
//														message : 'Dato necesario'
//													},
													stringLength : {
														min : 2,
														max : 50,
														message : 'Minimo 2 - maximo 50 caracteres'
													},
													regexp : {
														regexp : /^[a-zA-Z ]+$/,
														message : 'el nombre puede contener solo letras de la A-Z'
													}
												}
											},

										}

									});
				});
