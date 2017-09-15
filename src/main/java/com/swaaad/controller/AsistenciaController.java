package com.swaaad.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Asistencia;
import com.swaaad.service.AsistenciaService;

@Controller
public class AsistenciaController {
	private static final Logger logger = LoggerFactory.getLogger(AsistenciaController.class);

	@Autowired
	AsistenciaService objAsistenciaService;

	@RequestMapping(value = { "asistencias" }, method = RequestMethod.GET)
	public ModelAndView asistenciaPage(ModelAndView model) throws Exception {

		logger.info("asistenciaPage");
		System.out.println("hola como estas");
		List<Asistencia> ListarAsistencia = objAsistenciaService.getAllAsistencia();

		//ListarAsistencia = objAsistenciaService.getAllAsistencia();

		for (Asistencia asistenci : ListarAsistencia) {

			logger.info("s:" + asistenci.getEstado());
		}
		// logger.info("[NOMBRES: "+alumno.getNombres()+",
		// APELLIDOS:"+alumno.getApellidos()+"]");
		Asistencia asistencia = new Asistencia();

		model.addObject("asistencia", asistencia);
		model.addObject("ListarAsistencia", ListarAsistencia);

		

		return model;
		
	}
	@RequestMapping(value = "/saveAsistencia", method = RequestMethod.POST)
	public ModelAndView saveAsistencia(@ModelAttribute Asistencia asistencia) throws Exception {

		logger.info("saveAsistencia");

		try {
			if (asistencia.getIdAsistencia() == 0) {
				objAsistenciaService.addAsistencia(asistencia);
			} else {
				objAsistenciaService.updateAsistencia(asistencia);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/asistencias");
	}
	

	@RequestMapping(value = "/newAsistencia", method = RequestMethod.GET)
	public ModelAndView newAsistencia(ModelAndView model) throws Exception {
		logger.info("newAsistencia");
		Asistencia asistencia = new Asistencia();
		model.addObject("asistencia", asistencia);
		model.setViewName("form-asistencia");
		return model;
	}

//	@RequestMapping(value = "/editAsistencia", method = RequestMethod.GET)
//	public ModelAndView editContact(HttpServletRequest request) throws Exception {
//		
//		int asistenciaId = Integer.parseInt(request.getParameter("id"));
//		logger.info("editAsistencia "+asistenciaId);
//		Alumno alumno = null;
//		try {
//			asistencia = objAsistenciaService.getgetAlumnoById(asistenciaId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		ModelAndView model = new ModelAndView("form-alumno");
//		model.addObject("alumno", alumno);
//
//		return model;
//	}

	
}
