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

import com.swaaad.model.Nota;
import com.swaaad.service.NotaService;

@Controller
public class NotasController {
	private static final Logger logger = LoggerFactory.getLogger(NotasController.class);
	@Autowired
	NotaService objNotaService;
	
	@RequestMapping(value = { "notas" }, method = RequestMethod.GET)
	public ModelAndView notasPage(ModelAndView model) throws Exception {

		logger.info("notasPage");
		//
		List<Nota> ListarNota = null;

		ListarNota = objNotaService.getAllNotas();

		Nota nota = new Nota();

		model.addObject("nota", nota);
		model.addObject("ListarNota", ListarNota);

		model.setViewName("notas");

		return model;
	}
	@RequestMapping(value = "/saveNota", method = RequestMethod.POST)
	public ModelAndView saveNota(@ModelAttribute Nota nota) throws Exception {

		logger.info("saveNota");

		try {
			if (nota.getIdNota() == 0) {
				objNotaService.addNota(nota);
			} else {
				objNotaService.updateNota(nota);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/notas");
	}

	@RequestMapping(value = "/newNota", method = RequestMethod.GET)
	public ModelAndView newNota(ModelAndView model) throws Exception {
		logger.info("newNota");
		Nota nota = new Nota();
		model.addObject("nota", nota);
		model.setViewName("form-nota");
		return model;
	}

	@RequestMapping(value = "/editNota", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {

		int idNota = Integer.parseInt(request.getParameter("id"));
		logger.info("editNota" + idNota);
		Nota nota = null;
		try {
			nota = objNotaService.getNotaById(idNota);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-Nota");
		model.addObject("nota", nota);

		return model;
	}

	@RequestMapping(value = "/deleteNota", method = RequestMethod.GET)
	public ModelAndView deleteNota(HttpServletRequest request) throws Exception {
		int idNota = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteNota " + idNota);
		try {
			objNotaService.deleteNota(idNota);
		} catch (Exception e) {
			// // TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/notas");
	}

}
