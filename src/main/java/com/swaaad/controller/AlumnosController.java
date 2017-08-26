package com.swaaad.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.swaaad.model.Alumno;
import com.swaaad.service.AlumnosService;

@CrossOrigin
@RestController
@RequestMapping("/apirest/alumno")
public class AlumnosController {

	private static final Logger logger = LoggerFactory.getLogger(AlumnosController.class);
	@Autowired
	AlumnosService objAlumnoService;

	@RequestMapping(value = "/lista", method = RequestMethod.GET)
	public List<Alumno> home(Locale locale, Model model) {
		logger.info("Se ejecuta el metodo home ");
		
		List<Alumno> ListarAlumno =null;
		try {
			ListarAlumno = objAlumnoService.getAllAlumnos();
			for (Alumno alumno : ListarAlumno) {
				logger.info("[NOMBRES: " + alumno.getNombres() + ",APELLIDOS:" + alumno.getApellidos() + "]");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// ------- Alumnos-------
		try {

			Alumno alumno = objAlumnoService.getAlumnoById(1);
			// Elimino alumno
			alumno.setApellidos("Cardenas Rodrigues");
			objAlumnoService.updateAlumno(alumno);

			logger.info("nombre: " + alumno.getNombres() + "Apellidos" + alumno.getApellidos());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ListarAlumno;

	}

}
