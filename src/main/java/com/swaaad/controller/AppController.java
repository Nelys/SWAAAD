package com.swaaad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.service.ActividadPedagogicaService;
import com.swaaad.service.AlumnosService;

@Controller
@RequestMapping("/")
public class AppController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	AlumnosService objAlumnoService;

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "home";
	}

	@RequestMapping(value = { "/perfil" }, method = RequestMethod.GET)
	public String perfilPage(ModelMap model) {
		return "perfil";
	}

	@RequestMapping(value = { "/cursos" }, method = RequestMethod.GET)
	public String cursosPage(ModelMap model) {
		return "cursos";
	}

	/////// nelys
	/*@RequestMapping(value = { "/alumnos" }, method = RequestMethod.GET)
	public ModelAndView alumnosPage(ModelAndView model) throws Exception {

		logger.info("alumnosPage");
		//
		List<Alumno> ListarAlumno = null;

		ListarAlumno = objAlumnoService.getAllAlumnos();

		Alumno alumno = new Alumno();

		model.addObject("alumno", alumno);
		model.addObject("listAlumnos", ListarAlumno);

		model.setViewName("alumnos");

		return model;
	}

	@RequestMapping(value = "/saveAlumno", method = RequestMethod.POST)
	public ModelAndView saveAlumno(@ModelAttribute Alumno alumno) throws Exception {

		logger.info("saveAlumno");

		try {
			if (alumno.getIdAlumno() == 0) {
				objAlumnoService.addAlumno(alumno);
			} else {
				objAlumnoService.updateAlumno(alumno);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/alumnos");
	}

	@RequestMapping(value = "/newAlumno", method = RequestMethod.GET)
	public ModelAndView newAlumno(ModelAndView model) throws Exception {
		logger.info("newAlumno");
		Alumno alumno = new Alumno();
		model.addObject("alumno", alumno);
		model.setViewName("form-alumno");
		return model;
	}

	@RequestMapping(value = "/editAlumno", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAlumno "+alumnoId);
		Alumno alumno = null;
		try {
			alumno = objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-alumno");
		model.addObject("alumno", alumno);

		return model;
	}

	@RequestMapping(value = "/deleteAlumno", method = RequestMethod.GET)
	public ModelAndView deleteAlumno(HttpServletRequest request) throws Exception {
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAlumno " + alumnoId);
		 try {
		objAlumnoService.deleteAlumno(alumnoId);
		 } catch (Exception e) {
		// // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		//
		return new ModelAndView("redirect:/alumnos");
	}*/

	// fin nelys
	@RequestMapping(value = { "/evaluaciones" }, method = RequestMethod.GET)
	public String evaluacionesPage(ModelMap model) {
		return "evaluaciones";
	}

	@RequestMapping(value = { "/asistencias" }, method = RequestMethod.GET)
	public String asistenciasPage(ModelMap model) {
		return "asistencias";
	}

//	@RequestMapping(value = { "/actividades-pedagogicas" }, method = RequestMethod.GET)
//	public String actividadesPedagogicasPage(ModelMap model) {
//		return "actividades-pedagogicas";
//	}

	@RequestMapping(value = { "/aula-dinamica" }, method = RequestMethod.GET)
	public String aulaDinamicaPage(ModelMap model) {
		return "aula-dinamica";
	}

	@RequestMapping(value = { "/participacion" }, method = RequestMethod.GET)
	public String participacionPage(ModelMap model) {
		return "participacion";
	}

	@RequestMapping(value = { "/grupos" }, method = RequestMethod.GET)
	public String gruposPage(ModelMap model) {
		return "grupos";
	}

}