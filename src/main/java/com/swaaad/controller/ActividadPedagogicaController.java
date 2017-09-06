package com.swaaad.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.ActividadPedagogica;

@Controller
public class ActividadPedagogicaController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);


	@RequestMapping(value = { "actividades-pedagogicas" }, method = RequestMethod.GET)
	public ModelAndView listActividadPedagogica(ModelAndView model) throws Exception {

		logger.info("actividadPedagogicaPage");
		//
		List<ActividadPedagogica> ListarActividadPedagogica = null;

		//ListarActividadPedagogica = null;//objAlumnoService.getAllAlumnos();

		ActividadPedagogica actividadPedagogica = new ActividadPedagogica();
//		
//		actividadPedagogica.setFecha(new Date());
//		actividadPedagogica.setDescripcion("Decripcion1");
//		actividadPedagogica.setRecordar(recordar);
//		ListarActividadPedagogica.add(actividadPedagogica);

		model.addObject("actividadPedagogica", actividadPedagogica);
		model.addObject("listActividadPedagogica", ListarActividadPedagogica);

//		model.setViewName("pages/alumnos/alumnos");
		model.setViewName("actividades-pedagogicas");

		return model;
	}

	@RequestMapping(value = "/saveActividadPedagogica", method = RequestMethod.POST)
	public ModelAndView saveActividadPedagogica(@ModelAttribute ActividadPedagogica actividadPedagogica) throws Exception {

		logger.info("saveAlumno");

		try {
//			if (actividadPedagogica.getIdAlumno() == 0) {
//				//objAlumnoService.addAlumno(alumno);
//			} else {
//				//objAlumnoService.updateAlumno(alumno);
//			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/alumnos");
	}

	@RequestMapping(value = "/newActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView newActividadPedagogica(ModelAndView model) throws Exception {
		logger.info("newAlumno");
		ActividadPedagogica actividadPedagogica = new ActividadPedagogica();
		model.addObject("alumno", actividadPedagogica);
		model.setViewName("form-alumno");
		return model;
	}

	@RequestMapping(value = "/editActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView editActividadPedagogica(HttpServletRequest request) throws Exception {
		
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAlumno "+alumnoId);
		ActividadPedagogica actividadPedagogica = null;
		try {
			actividadPedagogica = null;//objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-alumno");
		model.addObject("alumno", actividadPedagogica);

		return model;
	}

	@RequestMapping(value = "/deleteActividadPedagogica", method = RequestMethod.GET)
	public ModelAndView deleteActividadPedagogica(HttpServletRequest request) throws Exception {
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAlumno " + alumnoId);
		try {
//			 objAlumnoService.deleteAlumno(alumnoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/alumnos");
	}
}
