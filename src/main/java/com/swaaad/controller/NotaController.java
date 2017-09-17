package com.swaaad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.swaaad.model.Alumno;
import com.swaaad.model.Nota;
import com.swaaad.service.AlumnosService;
import com.swaaad.service.CompetenciaService;
import com.swaaad.service.NotaService;
import com.swaaad.service.PeriodoService;

@Controller
//@SessionAttributes("sessionCurso")
public class NotaController {
	private static final Logger logger = LoggerFactory.getLogger(NotaController.class);
	private int sessionCurso;
//	@Autowired
//	NotaService objNotaService;
	
	@Autowired
	AlumnosService objAlumnoService;
	
	@Autowired
	PeriodoService objPeriodoService;

	@RequestMapping(value = { "listNota" }, method = RequestMethod.GET)
	public ModelAndView notasPage(ModelAndView model, HttpSession session, HttpServletRequest request) throws Exception {

		logger.info("notasPage");
		//
		List<Nota> ListarNota = null;
		
		session = request.getSession(false);
		int a = (Integer) session.getAttribute("idCurso");
		System.out.println(a + " desde notas");		
		System.out.println(sessionCurso);
		
		//System.out.println(objPeriodoService.get);
//		ListarNota = objNotaService.getAllNota();

		Nota nota = new Nota();

//		model.addObject("nota", nota);
//		model.addObject("listNota", ListarNota);
		
		model.addObject("listPeriodos", objPeriodoService.getAllPeriodos());
		
		model.addObject("listAlumnos", objAlumnoService.getAllAlumnosByIdCurso(request));
		

//		model.setViewName("pages/notas/notas");
//		model.setViewName("nota-lista");
		model.setViewName("listNota");

		return model;
	}

	@RequestMapping(value = "/saveNota", method = RequestMethod.POST)
	public ModelAndView saveNota(@ModelAttribute Nota nota) throws Exception {

		logger.info("saveNota");

		try {
			if (nota.getIdNota() == 0) {
//				objNotaService.addNota(nota);
			} else {
//				objNotaService.updateNota(nota);
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
		
		int notaId = Integer.parseInt(request.getParameter("id"));
		logger.info("editNota "+notaId);
		Nota nota = null;
		try {
//			nota = objNotaService.getNotaById(notaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("form-nota");
		model.addObject("nota", nota);

		return model;
	}

	@RequestMapping(value = "/deleteNota", method = RequestMethod.GET)
	public ModelAndView deleteNota(HttpServletRequest request) throws Exception {
		int notaId = Integer.parseInt(request.getParameter("id"));
		logger.info("deleteNota " + notaId);
		 try {
//		objNotaService.deleteNota(notaId);
		 } catch (Exception e) {
		 e.printStackTrace();
		 }
		//
		return new ModelAndView("redirect:/notas");
	}
}
