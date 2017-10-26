package com.swaaad.controller;

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
import com.swaaad.reports.AlumnoReport;
import com.swaaad.service.AlumnosService;

@Controller
public class AlumnoController {
	private static final Logger logger = LoggerFactory.getLogger(AlumnoController.class);
	@Autowired
	AlumnosService objAlumnoService;

	@RequestMapping(value = { "alumnos" }, method = RequestMethod.GET)
	public ModelAndView alumnosPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("alumnosPage");
		
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));

		model.setViewName("alumnos");

		return model;
	}

	@RequestMapping(value = "/saveAlumno", method = RequestMethod.POST)
	public ModelAndView saveAlumno(@ModelAttribute Alumno alumno, HttpServletRequest request) throws Exception {

		logger.info("saveAlumno");

		try {
			if (alumno.getIdAlumno() == 0) {
				objAlumnoService.addAlumno(alumno, request);
			} else {
				objAlumnoService.updateAlumno(alumno);
			}

		} catch (Exception e) {
		    logger.info("Excepcion: ", e);
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
		logger.info("editAlumno ", alumnoId);
		Alumno alumno = null;
		try {
			alumno = objAlumnoService.getAlumnoById(alumnoId);
		} catch (Exception e) {
		    logger.info("Excepcion en edicion: ", e);
		}
		ModelAndView model = new ModelAndView("form-alumno");
		model.addObject("alumno", alumno);

		return model;
	}

	@RequestMapping(value = "/deleteAlumno", method = RequestMethod.GET)
	public ModelAndView deleteAlumno(HttpServletRequest request) throws Exception {
		int alumnoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAlumno ", alumnoId);
		 try {
		     objAlumnoService.deleteAlumno(alumnoId);
		 } catch (Exception e) {
		     logger.info("Excepcion en Eliminacion: ", e);
		 }
		//
		return new ModelAndView("redirect:/alumnos");
	}
	
	@RequestMapping(value = "/AlumnoReporte", method = RequestMethod.GET)
    public String alumnoReporte(ModelMap modelMap, HttpServletRequest request) throws Exception {

        List<Alumno> listaAlumnosCursos = objAlumnoService.getAllAlumnosByIdCurso(request);
        
        AlumnoReport ar = new AlumnoReport();
//        modelMap.addAttribute("format", "xls");
//        modelMap.put(JRParameter.REPORT_LOCALE, locale);
        modelMap.put("listaAlumnos", ar.findAllAlumnos(listaAlumnosCursos));
        
        return "pages/alumno/alumno-report";
    }
}
