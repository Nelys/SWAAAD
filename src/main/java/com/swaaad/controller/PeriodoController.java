package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Periodo;
import com.swaaad.service.PeriodoService;

@Controller
public class PeriodoController {
	private static final Logger logger = LoggerFactory.getLogger(PeriodoController.class);

	@Autowired
	PeriodoService objPeriodoService;

//	@RequestMapping(value = { "periodo" }, method = RequestMethod.GET)
//	public ModelAndView alumnosPage(ModelAndView model) throws Exception {
//
//		logger.info("periodoPage");
//		//
//		List<Periodo> ListarPeriodo = null;
//
//		// ListarAlumno = objPeriodoService.get|
//
//		Periodo periodo = new Periodo();
//
//		model.addObject("periodo", periodo);
//		model.addObject("listPeriodo", ListarPeriodo);
//
//		// model.setViewName("pages/alumnos/alumnos");
//		model.setViewName("periodos");
//
//		return model;
//	}

	@RequestMapping(value = "/savePeriodo", method = RequestMethod.POST)
	public ModelAndView savePeriodo(@ModelAttribute Periodo periodo) throws Exception {

		logger.info("saveAlumno");

		try {
			if (periodo.getIdPeriodo() == 0) {
				objPeriodoService.addPeriodo(periodo);
			} else {
				objPeriodoService.updatePeriodo(periodo);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/Periodos");
	}

	@RequestMapping(value = "/newPeriodo", method = RequestMethod.GET)
	public ModelAndView newPeriodo(ModelAndView model) throws Exception {
		logger.info("newPeriodo");
		Periodo periodo = new Periodo();
		model.addObject("periodo", periodo);
		model.setViewName("form-periodo");
		return model;
	}

	@RequestMapping(value = "/editPeriodo", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {

		int periodoId = Integer.parseInt(request.getParameter("id"));
		logger.info("editPeriodo " + periodoId);
		Periodo periodo = null;
		try {
			periodo = objPeriodoService.getPeriodoById(periodoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-alumno");
		model.addObject("periodo", periodo);

		return model;
		
	}
	
	@RequestMapping(value = "/deletePeriodo", method = RequestMethod.GET)
	public ModelAndView deleteAlumno(HttpServletRequest request) throws Exception {
		int periodoId = Integer.parseInt(request.getParameter("id"));
		logger.info("deletePeriodo " + periodoId);
		try {
			objPeriodoService.deletePeriodo(periodoId);
		} catch (Exception e) {
			// // TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/periodos");
	}

}
