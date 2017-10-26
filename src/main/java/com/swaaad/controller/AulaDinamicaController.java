package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.AulaDinamica;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.AulaDinamicaService;
@CrossOrigin
@Controller
public class AulaDinamicaController {
	private static final Logger logger = LoggerFactory.getLogger(AulaDinamicaController.class);
	@Autowired
	private AulaDinamicaService objAulaDinamicaService;
	
	@Autowired
	private AlumnosService objAlumnoService;
	

	@RequestMapping(value = { "aula-dinamica" }, method = RequestMethod.GET)
	public ModelAndView aulaDinamicasPage(ModelAndView model, HttpServletRequest request) throws Exception {

		logger.info("aulaDinamicasPage");
		//
		List<AulaDinamica> ListarAulaDinamica = null;

		ListarAulaDinamica = objAulaDinamicaService.getAllAulasDinamicas();

		AulaDinamica aulaDinamica = new AulaDinamica();

		model.addObject("aulaDinamica", aulaDinamica);
		model.addObject("listAulaDinamica", ListarAulaDinamica);
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));
//		model.setViewName("pages/aulaDinamicas/aulaDinamicas");
		model.setViewName("aula-dinamica");

		return model;
	}

	@RequestMapping(value = "/saveAulaDinamica", method = RequestMethod.POST)
	public ModelAndView saveAulaDinamica(@ModelAttribute("aulaDinamica") AulaDinamica aulaDinamica) throws Exception {

		logger.info("saveAulaDinamica");

		
		System.out.println("saveAulaDinamica");
		try {
			if (aulaDinamica.getIdAulaDinamica() == 0) {
				objAulaDinamicaService.addAulaDinamica(aulaDinamica);
			} else {
				objAulaDinamicaService.updateAulaDinamica(aulaDinamica);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return new ModelAndView("redirect:/aula-dinamica");
	}

	@RequestMapping(value = "/newAulaDinamica", method = RequestMethod.GET)
	public ModelAndView newAulaDinamica(ModelAndView model) throws Exception {
		logger.info("newAulaDinamica");
		AulaDinamica aulaDinamica = new AulaDinamica();
		model.addObject("aulaDinamica", aulaDinamica);
		model.setViewName("form-aulaDinamica");
		return model;
	}

	@RequestMapping(value = "/editAulaDinamica", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) throws Exception {
		
		int aulaDinamicaId = Integer.parseInt(request.getParameter("id"));
		logger.info("editAulaDinamica "+aulaDinamicaId);
		AulaDinamica aulaDinamica = null;
		try {
			aulaDinamica = objAulaDinamicaService.getAulaDinamicaById(aulaDinamicaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-aulaDinamica");
		model.addObject("aulaDinamica", aulaDinamica);

		return model;
	}

	@RequestMapping(value = "/deleteAulaDinamica", method = RequestMethod.GET)
	public ModelAndView deleteAulaDinamica(HttpServletRequest request) throws Exception {
		int aulaDinamicaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteAulaDinamica " + aulaDinamicaId);
		 try {
		objAulaDinamicaService.deleteAulaDinamica(aulaDinamicaId);
		 } catch (Exception e) {
		// // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		//
		return new ModelAndView("redirect:/aulaDinamicas");
	}
}
