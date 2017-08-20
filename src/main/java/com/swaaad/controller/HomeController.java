package com.swaaad.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swaaad.model.Alumno;
import com.swaaad.service.AlumnosService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	AlumnosService objAlumnoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Se ejecuta el metodo home ");
		// 
//		try {
//			List<Alumno> ListarAlumno = objAlumnoService.getAllAlumnos();
//			for (Alumno alumno : ListarAlumno) {
//				logger.info("[NOMBRES: "+alumno.getNombres()+", APELLIDOS:"+alumno.getApellidos()+"]");	
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}

		try {
			
			Alumno alumno=objAlumnoService.getAlumnoById(1);
			//Elimino alumno
			alumno.setApellidos("Cardenas Rodrigues");
			objAlumnoService.updateAlumno(alumno);
						
			logger.info("nombre: " + alumno.getNombres() + "Apellidos" + alumno.getApellidos());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home";
	}

}
