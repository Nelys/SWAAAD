package com.swaaad.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Docente;
import com.swaaad.service.DocenteService;

public class DocenteController {
	private static final Logger logger = LoggerFactory.getLogger(DocenteController.class);

	@Autowired
	DocenteService objDocenteService;

	@RequestMapping(value = { "/saveDocente" }, method = RequestMethod.GET)
	public ModelAndView saveDocente(@ModelAttribute Docente docente) throws Exception {

		logger.info("saveDocente");

		try {
			if (docente.getIdDocente() == 0) {
				objDocenteService.addDocente(docente);
			} else {
				objDocenteService.updateDocente(docente);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/docente");
	}

	@RequestMapping(value = "/newDocente", method = RequestMethod.GET)
	public ModelAndView newDocente(ModelAndView model) throws Exception {
		logger.info("nuevo Docente");
		Docente docente = new Docente();
		model.addObject("docente", docente);
		model.setViewName("form-docente");
		return model;
	}

	@RequestMapping(value = "/editContraseñaDocente", method = RequestMethod.GET)
	public ModelAndView editContraseñaDocente(HttpServletRequest request) throws Exception {
		int docenteId = Integer.parseInt(request.getParameter("id"));
		logger.info("editContraseñaDocente" + docenteId);
		Docente docente = null;
		try {
			docente = objDocenteService.getDocenteById(docenteId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-docente");
		model.addObject("docente", docente);

		return model;
	}

}
