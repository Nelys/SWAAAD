package com.swaaad.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swaaad.model.ActividadPedagogica;
import com.swaaad.model.CursoAlumno;
import com.swaaad.model.Docente;
import com.swaaad.service.ActividadPedagogicaService;
import com.swaaad.service.DocenteService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

//	@Autowired
//	ActividadPedagogicaService objActividadService;
	// AlumnosService objAlumnoService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Se ejecuta el metodo home ");
//		try {
//			ActividadPedagogica actividad = new ActividadPedagogica();
//
//			CursoAlumno cursoAlumno = new CursoAlumno();
//
//			Date date = new Date();
//			
//		//	actividad.setCursoAlumno(cursoAlumno);
//			actividad.setFecha(date);
//			actividad.setDescripcion("revisar tarea");
//			actividad.setRecordar(new Byte("0"));
//			

			

	//		objActividadService.addActividad(actividad);;

//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//
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
		System.out.println("hola como estas");
		return "home";
	}

}
