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

import com.swaaad.model.Alumno;
import com.swaaad.model.Competencia;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.CompetenciaService;

@Controller
public class CompetenciaController {
	private static final Logger logger = LoggerFactory.getLogger(CompetenciaController.class);
	
	@Autowired
	CompetenciaService objCompetenciaService;

	@RequestMapping(value = { "competencia" }, method = RequestMethod.GET)
	public ModelAndView competenciaPage(ModelAndView model) throws Exception {

		logger.info("competenciaPage");
		//
		List<Competencia> ListarCompetencia = null;

		ListarCompetencia = objCompetenciaService.getAllCompetencia();

		Competencia competencia = new Competencia();

		model.addObject("competencia", competencia);
		model.addObject("listCompetencia", ListarCompetencia);

		model.setViewName("notas");

		return model;
	}

	@RequestMapping(value = "/saveCompetencia", method = RequestMethod.POST)
	public ModelAndView saveCompetencia(@ModelAttribute Competencia competencia) throws Exception {

		logger.info("saveCompetencia");

		try {
			if (competencia.getIdCompetencia() == 0) {
				objCompetenciaService.addCompetencia(competencia);
			} else {
				objCompetenciaService.updateCompetencia(competencia);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/notas");
	}

	@RequestMapping(value = "/newCompetencia", method = RequestMethod.GET)
	public ModelAndView newCompetencia(ModelAndView model) throws Exception {
		logger.info("newCompetencia");
		Competencia competencia = new Competencia();
		model.addObject("competencia", competencia);
		model.setViewName("form-competencia");
		return model;
	}

	@RequestMapping(value = "/editCompetencia", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {

		int competenciaId = Integer.parseInt(request.getParameter("id"));
		logger.info("editCompetencia " + competenciaId);
		Competencia competencia= null;
		try {
			competencia = objCompetenciaService.getCompetenciaById(competenciaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-competencia");
		model.addObject("competencia", competencia);

		return model;
	}

	@RequestMapping(value = "/deleteCompetencia", method = RequestMethod.GET)
	public ModelAndView deleteCompetencia(HttpServletRequest request) throws Exception {
		int competenciaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAlumno " + competenciaId);
		try {
			objCompetenciaService.deleteCompetencia(competenciaId);
		} catch (Exception e) {
			// // TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		return new ModelAndView("redirect:/competencia");
	}

}
