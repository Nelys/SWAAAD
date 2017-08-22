package com.swaaad.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swaaad.model.Docente;
import com.swaaad.service.DocenteService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	DocenteService objDocenteService;

	// AlumnosService objAlumnoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Se ejecuta el metodo home ");

		//
		// try {
		// List<Alumno> ListarAlumno = objAlumnoService.getAllAlumnos();
		// for (Alumno alumno : ListarAlumno) {
		// logger.info("[NOMBRES: "+alumno.getNombres()+",
		// APELLIDOS:"+alumno.getApellidos()+"]");
		// }
		// } catch (Exception e) {
		// // TODO: handle exception
		// }
		// ------- Alumnos-------
		// try {
		//
		// Alumno alumno=objAlumnoService.getAlumnoById(1);
		// //Elimino alumno
		// alumno.setApellidos("Cardenas Rodrigues");
		// objAlumnoService.updateAlumno(alumno);
		//
		// logger.info("nombre: " + alumno.getNombres() + "Apellidos" +
		// alumno.getApellidos());
		//
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// ----Docente--

		try {
			Docente docente = new Docente();
			docente.setNombre("Carlos");
			docente.setApellidos("Supo Mollocondo");
			docente.setGenero("M");
			docente.setEmail("Carlos@gmail.com");
			docente.setContrasena("123456");
			docente.setFoto("f");

			objDocenteService.addDocente(docente);

			System.out.println(docente.getApellidos());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "home";
	}

}
